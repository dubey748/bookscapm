# CAP Books Service

This project is a simple SAP CAP (Cloud Application Programming Model) application that exposes a Books entity using OData V4 service.
It demonstrates CDS modeling, service exposure, CSV test data, and CRUD testing using HTTP requests.

---

Technologies Used

* SAP CAP (Node.js)
* CDS (Core Data Services)
* OData V4
* SQLite (default database)
* VS Code / BAS
* REST Client (crud.http)

---

Project Structure

.
├── db
│   ├── schema.cds
│   └── data
│       └── db.books-Books.csv
│
├── srv
│   └── catlogsrv.cds
│
├── test
│   └── crud.http
│
├── package.json
└── README.md

---

Data Model

namespace db.books;

entity Books {
key ID        : UUID;
title         : String;
Author        : String;
price         : Decimal(10,2);
publishDate   : DateTime;
digitalCopy   : Boolean;
}

---

Service Definition

using { db.books.Books } from '../db/schema';

service CatalogService {

```
entity Books as projection on Books;
```

}

Service URL

/odata/v4/catalog

---

Test Data

File location

db/data/db.books-Books.csv

Example

ID,title,Author,price,publishDate,digitalCopy
11111111-1111-1111-1111-111111111111,Learn CAP,John,100,2024-01-01T10:00:00,true
22222222-2222-2222-2222-222222222222,Node Book,David,200,2024-02-01T10:00:00,false

---

Run the Application

npm install
cds watch

Server URL

http://localhost:4004

---

Test Endpoints

Get Service

GET http://localhost:4004/odata/v4/catalog

Get All Books

GET http://localhost:4004/odata/v4/catalog/BooksSet

Get Single Book

GET http://localhost:4004/odata/v4/catalog/BooksSet(11111111-1111-1111-1111-111111111111)

Create Book

POST http://localhost:4004/odata/v4/catalog/BooksSet
Content-Type: application/json

{
"title": "New Book",
"Author": "Abhishek",
"price": 200,
"digitalCopy": true
}

---

Testing using crud.http

Use REST Client extension in VS Code.

File

test/crud.http

Run requests directly from editor.

---

Features

* CDS data model
* OData V4 service
* CSV test data loading
* CRUD operations
* UUID key handling
* CAP default SQLite database

---

Author

Abhishek Dubey
