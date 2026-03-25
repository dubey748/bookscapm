using {db.books as mybook} from '../db/booksdatamodel';

service BookSrv {
    entity BooksSet as projection on mybook.Books;
}
