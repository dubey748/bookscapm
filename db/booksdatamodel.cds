namespace db.books;

entity Books {
    key ID          : UUID;
        title       : String;
        Author      : String;
        price       : Decimal(10, 2);
        publishDate : DateTime;
        digitalCopy : Boolean
}
