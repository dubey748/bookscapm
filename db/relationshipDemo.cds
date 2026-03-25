namespace relationshipDemo.db;


// Association

entity Header {
    key ID            : UUID;
        description   : String;
        items_details : Association to many Items
                            on items_details.headerID = $self.ID

}

entity Items {
    key ID       : UUID;
        headerID : UUID;
        product  : String;
        quantity : Integer
}

//Composition

entity salesOrderHeader {

    key ID                 : UUID;
        description        : String;
        items_details_comp : Composition of many salesOrderItems
                                 on items_details_comp.header = $self

}

entity salesOrderItems {

    key ID       : UUID;

        header   : Association to salesOrderHeader;
        product  : String;
        quantity : Integer

}
