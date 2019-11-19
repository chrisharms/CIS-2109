CREATE TABLE customer (
    customerid          INTEGER NOT NULL,
    customerfirstname   VARCHAR2(20 CHAR) NOT NULL,
    customerlastname    VARCHAR2(20) NOT NULL,
    customerstreet      VARCHAR2(30) NOT NULL,
    customercity        VARCHAR2(30) NOT NULL,
    customerstate       CHAR(2 CHAR) NOT NULL,
    customerzip         INTEGER NOT NULL,
    customerphone       INTEGER,
    customeremail       VARCHAR2(30) NOT NULL
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( customerid );

CREATE TABLE employee (
    employeeid            INTEGER NOT NULL,
    employeefirstname     VARCHAR2(20),
    employeelastname      VARCHAR2(20),
    employeesalary        INTEGER,
    employeeposition      VARCHAR2(20),
    employee_employeeid   INTEGER NOT NULL
);

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( employeeid );

CREATE TABLE "Order" (
    orderid               INTEGER NOT NULL,
    orderdate             DATE,
    customer_customerid   INTEGER NOT NULL,
    employee_employeeid   INTEGER NOT NULL
);

ALTER TABLE "Order" ADD CONSTRAINT order_pk PRIMARY KEY ( orderid );

CREATE TABLE orderline (
    order_orderid       INTEGER NOT NULL,
    product_productid   INTEGER NOT NULL,
    orderedquantity     INTEGER
);

ALTER TABLE orderline ADD CONSTRAINT orderline_pk PRIMARY KEY ( product_productid,
                                                                order_orderid );

CREATE TABLE paymentplan (
    paymentplanid         INTEGER NOT NULL,
    paymentmethod         VARCHAR2(15),
    paymentplanduration   INTEGER
);

ALTER TABLE paymentplan ADD CONSTRAINT paymentplan_pk PRIMARY KEY ( paymentplanid );

CREATE TABLE paymentrecords (
    paymentid                   INTEGER NOT NULL,
    paymentamount               NUMBER,
    paymentdate                 DATE,
    firstdepositdate            DATE,
    finalpaymentduedate         DATE,
    remainingbalance            NUMBER,
    order_orderid               INTEGER NOT NULL,
    paymentplan_paymentplanid   INTEGER NOT NULL
);

ALTER TABLE paymentrecords ADD CONSTRAINT paymentrecords_pk PRIMARY KEY ( paymentid );

CREATE TABLE product (
    productid                    INTEGER NOT NULL,
    productname                  VARCHAR2(30) NOT NULL,
    productprice                 NUMBER NOT NULL,
    productcondition             VARCHAR2(20) NOT NULL,
    productdescription           VARCHAR2(50),
    productcategory_categoryid   INTEGER NOT NULL,
    vendor_vendorid              INTEGER NOT NULL
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( productid );

CREATE TABLE productcategory (
    categoryid               INTEGER NOT NULL,
    producttype              VARCHAR2(20) 
    ,
    producttypedescription   VARCHAR2(60)
);

ALTER TABLE productcategory ADD CONSTRAINT productcategory_pk PRIMARY KEY ( categoryid );

CREATE TABLE sponsorcontacts (
    sponsor_sponsorid     INTEGER NOT NULL,
    employee_employeeid   INTEGER NOT NULL
);

ALTER TABLE sponsorcontacts ADD CONSTRAINT sponsorcontacts_pk PRIMARY KEY ( sponsor_sponsorid,
                                                                    employee_employeeid );

CREATE TABLE shipment (
    shipmentid          INTEGER NOT NULL,
    deliverydate        DATE,
    order_orderid       INTEGER NOT NULL,
    product_productid   INTEGER NOT NULL,
    productquantity     INTEGER
);

ALTER TABLE shipment
    ADD CONSTRAINT shipment_pk PRIMARY KEY ( shipmentid,
                                             order_orderid,
                                             product_productid );

CREATE TABLE sponsor (
    sponsorid                 INTEGER NOT NULL,
    sponsorname               VARCHAR2(20),
    sponsorcontactfirstname   VARCHAR2(20),
    sponsorcontactlastname    VARCHAR2(20),
    sponsorstreet             VARCHAR2(30),
    sponsorcity               VARCHAR2(30),
    sponsorstate              CHAR(2),
    sponsorzip                INTEGER
);

ALTER TABLE sponsor ADD CONSTRAINT sponsor_pk PRIMARY KEY ( sponsorid );

CREATE TABLE sponsoredproducts (
    product_productid   INTEGER NOT NULL,
    sponsor_sponsorid   INTEGER NOT NULL,
    productquantity     INTEGER
);

ALTER TABLE sponsoredproducts ADD CONSTRAINT sponsoredproducts_pk PRIMARY KEY ( product_productid,
                                                                                sponsor_sponsorid );

CREATE TABLE vendor (
    vendorid                 INTEGER NOT NULL,
    vendorname               VARCHAR2(30),
    vendorcontactfirstname   VARCHAR2(20),
    vendorcontactlastname    VARCHAR2(20),
    vendorphone              INTEGER,
    vendorstreet             VARCHAR2(30),
    vendorcity               VARCHAR2(30),
    vendorstate              CHAR(2),
    vendorzip                INTEGER
);

ALTER TABLE vendor ADD CONSTRAINT vendor_pk PRIMARY KEY ( vendorid );

ALTER TABLE employee
    ADD CONSTRAINT employee_employee_fk FOREIGN KEY ( employee_employeeid )
        REFERENCES employee ( employeeid );

ALTER TABLE "Order"
    ADD CONSTRAINT order_customer_fk FOREIGN KEY ( customer_customerid )
        REFERENCES customer ( customerid );

ALTER TABLE "Order"
    ADD CONSTRAINT order_employee_fk FOREIGN KEY ( employee_employeeid )
        REFERENCES employee ( employeeid );

ALTER TABLE orderline
    ADD CONSTRAINT orderline_order_fk FOREIGN KEY ( order_orderid )
        REFERENCES "Order" ( orderid );

ALTER TABLE orderline
    ADD CONSTRAINT orderline_product_fk FOREIGN KEY ( product_productid )
        REFERENCES product ( productid );

ALTER TABLE paymentrecords
    ADD CONSTRAINT paymentrecords_order_fk FOREIGN KEY ( order_orderid )
        REFERENCES "Order" ( orderid );

ALTER TABLE paymentrecords
    ADD CONSTRAINT paymentrecords_paymentplan_fk FOREIGN KEY ( paymentplan_paymentplanid )
        REFERENCES paymentplan ( paymentplanid );

ALTER TABLE product
    ADD CONSTRAINT product_productcategory_fk FOREIGN KEY ( productcategory_categoryid )
        REFERENCES productcategory ( categoryid );

ALTER TABLE product
    ADD CONSTRAINT product_vendor_fk FOREIGN KEY ( vendor_vendorid )
        REFERENCES vendor ( vendorid );

ALTER TABLE sponsorcontacts
    ADD CONSTRAINT sponsorcontacts_employee_fk FOREIGN KEY ( employee_employeeid )
        REFERENCES employee ( employeeid );

ALTER TABLE sponsorcontacts
    ADD CONSTRAINT sponsorcontacts_sponsor_fk FOREIGN KEY ( sponsor_sponsorid )
        REFERENCES sponsor ( sponsorid );

ALTER TABLE shipment
    ADD CONSTRAINT shipment_order_fk FOREIGN KEY ( order_orderid )
        REFERENCES "Order" ( orderid );

ALTER TABLE shipment
    ADD CONSTRAINT shipment_product_fk FOREIGN KEY ( product_productid )
        REFERENCES product ( productid );

ALTER TABLE sponsoredproducts
    ADD CONSTRAINT sponsoredproducts_product_fk FOREIGN KEY ( product_productid )
        REFERENCES product ( productid );

ALTER TABLE sponsoredproducts
    ADD CONSTRAINT sponsoredproducts_sponsor_fk FOREIGN KEY ( sponsor_sponsorid )
        REFERENCES sponsor ( sponsorid );