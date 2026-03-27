using {db.books as my} from '../db/booksdatamodel';
using {relationshipDemo.db as rel} from '../db/relationshipDemo';

service CatalogService {

    entity Books as projection on my.Books;

}

service RelationshipService {

    entity Header           as projection on rel.Header;
    entity Items            as projection on rel.Items;

    entity salesOrderHeader as projection on rel.salesOrderHeader;
    entity salesOrderItems  as projection on rel.salesOrderItems;

}

// annotate CatalogService.Books with @(UI: {

//     LineItem       : [
//         {
//             $Type: 'UI.DataField',
//             Value: title
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: Author
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: price
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: publishDate
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: digitalCopy
//         }
//     ],

//     SelectionFields: [
//         title,
//         Author
//     ]

// });

annotate rel.salesOrderHeader with @(UI: {
    SelectionFields: [
        ID,
        description
    ],
    LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: ID
        },
        {
            $Type: 'UI.DataField',
            Value: description
        }
    ]
});


annotate rel.salesOrderItems with @(UI: {LineItem: [
    {
        $Type: 'UI.DataField',
        Value: ID
    },
    {
        $Type: 'UI.DataField',
        Value: product
    },
    {
        $Type: 'UI.DataField',
        Value: quantity
    }
]});
