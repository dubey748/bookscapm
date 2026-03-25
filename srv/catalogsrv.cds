using {db.books as my} from '../db/booksdatamodel';
using {relationshipDemo.db as rel} from '../db/relationshipDemo';

service CatalogService {

    entity Books as projection on my.Books;

}

service RelationshipService {

    //Association
    entity Header           as projection on rel.Header;
    entity Items            as projection on rel.Items;

    // Coposition
    entity salesOrderHeader as projection on rel.salesOrderHeader;
    entity salesOrderItems  as projection on rel.salesOrderItems;

}
