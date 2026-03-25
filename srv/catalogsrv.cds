using {db.books as my} from '../db/booksdatamodel';

service CatalogService {

    entity Books as projection on my.Books;

}
