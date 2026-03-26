const cds = require('@sap/cds')
const { Books } = cds.entities

module.exports = srv => {
    const db = cds.db

    srv.on('READ', 'Books', async (req, res) => {
        result = []
        results = await db.run([
            //For all data
            SELECT.from(Books)

            //For specific data
            // SELECT.from(Books).where({ ID: req.data.ID })

        ])
        return results
    })

    // CREATE

    srv.on('CREATE', 'Books', async (req, resp) => {

        results = [];

        results = await db.run(
            INSERT.into(Books).entries(req.data)
        )
            .then((resolve, reject) => {
                if (resolve)
                    return req.data;
                else
                    return req.error(400, 'Failed to Create');
            })
            .catch(err => {
                return req.error(500, 'Server down, Try again' + err.toString());
            })

        return results;

    });

    //UPDATE
    srv.on('UPDATE', 'Books', async (req, resp) => {
        console.log("CUSTOM UPDATE CALLED");
        results = [];

        results = await db.run([
            UPDATE(Books).set(req.data).where({ ID: req.data.ID })
        ])
            .then((resolve, reject) => {
                if (resolve)
                    return req.data;
                else
                    return req.error(400, 'Failed to update');
            })
            .catch(err => {
                req.error(500, 'Try after some time....');
            })

        return results;
    });

    srv.on('DELETE', 'Books', async (req, resp) => {
        console.log("CUSTOM UPDATE CALLED");
        results = [];

        results = await db.run([
            DELETE.from(Books).where({ ID: req.data.ID })
        ])
        return results;
    });

    srv.before('CREATE', 'Books', req => {
        if (req.data.price < 0) req.error(400, "Price can not be negative")
    });

    srv.after('UPDATE', 'Books', req => {
        console.log("Book Updated")
    })
}