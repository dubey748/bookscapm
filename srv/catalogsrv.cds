using {db.books as my} from '../db/booksdatamodel';

service CatalogService {

    entity BooksSet as projection on my.Books;

}
