const cds = require('@sap/cds')
const { SELECT } = require('@sap/cds/lib/ql/cds-ql')
const { Books } = cds.entities

module.exports = srv => {
    const db = cds.db

    srv.on('READ', 'Books', async (req, res) => {
        result = []
        results = await db.run([
            //For all data
            // SELECT.from(Books)

            //For specific data
            SELECT.from(Books).where({ID:req.data.ID})

        ])
        return results
    })
}