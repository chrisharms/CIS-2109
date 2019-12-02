/* script name: Lab_10.sql                 	 */

/* Drop all tables before creating tables                */
BEGIN

  --Bye Tables!
  FOR i IN (SELECT ut.table_name
              FROM USER_TABLES ut) LOOP
    EXECUTE IMMEDIATE 'drop table '|| i.table_name ||' CASCADE CONSTRAINTS ';
  END LOOP;

END;

/

CREATE TABLE Customer_T
	(CustomerID         NUMBER(4)          NOT NULL,
	 CustomerName       VARCHAR(25)    ,
	 CustomerAddress    VARCHAR(30)    ,
         CustomerCity       VARCHAR(20)    ,              
         CustomerState      CHAR(2)        ,
         CustomerPostalCode VARCHAR(10)    ,
CONSTRAINT Customer_PK PRIMARY KEY (CustomerID));


CREATE TABLE ProductLine_T
	(ProductLineID     NUMBER(4)         NOT NULL,
	ProductLineName    VARCHAR(50)               ,
CONSTRAINT ProductLine_PK PRIMARY KEY (ProductLineID));


CREATE TABLE Product_T
	(ProductID            NUMBER(4)         NOT NULL,
         ProductLineID        NUMBER(4)      ,
         ProductDescription   VARCHAR(50)    ,
         ProductFinish        VARCHAR(20)    ,
         ProductStandardPrice NUMBER(6,2)    ,
	 ProductOnHand	      NUMBER(6)      ,
CONSTRAINT Product_PK PRIMARY KEY (ProductID),
CONSTRAINT Product_FK1 FOREIGN KEY (ProductLineID) 
	REFERENCES ProductLine_T(ProductLineID));

CREATE TABLE Order_T
	(OrderID            NUMBER(5)        NOT NULL,
	 CustomerID         NUMBER(4)   ,
         OrderDate          DATE        ,
	 FulfillmentDate    DATE	,
	 SalespersonID	    NUMBER(4)	,
	 ShipAdrsID	    NUMBER(4)	,
CONSTRAINT Order_PK PRIMARY KEY (OrderID),
CONSTRAINT Order_FK1 FOREIGN KEY (CustomerID) 
	REFERENCES Customer_T(CustomerID));


CREATE TABLE OrderLine_T
	(OrderLineID	    NUMBER(4)	     NOT NULL,
	 OrderID            NUMBER(5)        NOT NULL,
         ProductID          NUMBER(4)        NOT NULL,
         OrderedQuantity    NUMBER(10)         ,
CONSTRAINT OrderLine_PK PRIMARY KEY (OrderLineID),
CONSTRAINT OrderLine_FK1 FOREIGN KEY (OrderID) 
	REFERENCES Order_T(OrderID),
CONSTRAINT OrderLine_FK2 FOREIGN KEY (ProductID) 
	REFERENCES Product_T(ProductID));


COMMIT;

Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (1,'Contemporary Casuals','1355 S Hines Blvd','Gainesville','FL','32601-2871');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (2,'Value Furnitures','15145 S.W. 17th St.','Plano','TX','75094-7743');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (3,'Home Furnishings','1900 Allard Ave','Albany','NY','12209-1125');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (4,'Eastern Furniture','1925 Beltline Rd.','Carteret','NJ','07008-3188');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (5,'Impressions','5585 Westcott Ct.','Sacramento','CA','94206-4056');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (6,'Furniture Gallery','325 Flatiron Dr.','Boulder','CO','80514-4432');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (7,'New Furniture','Palace Ave','Farmington','NM',null);
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (8,'Dunkins Furniture','7700 Main St','Syracuse','NY','31590');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (9,'A Carpet','434 Abe Dr','Rome','NY','13440');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (12,'Flanigan Furniture','Snow Flake Rd','Ft Walton Beach','FL','32548');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (13,'Ikards','1011 S. Main St','Las Cruces','NM','88001');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (14,'Wild Bills','Four Horse Rd','Oak Brook','Il','60522');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (15,'Janet''s Collection','Janet Lane','Virginia Beach','VA','10012');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (16,'ABC Furniture Co.','152 Geramino Drive','Rome','NY','13440');

INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (1, 'Basic');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (2, 'Antique');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (3, 'Modern');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (4, 'Classical');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (5, 'Rellville');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (6, 'Spanish Style');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (7, 'Gothic');

Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (1,'Cherry End Table','Cherry',175.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (2,'Birch Coffee Tables','Birch',200.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (3,'Oak Computer Desk','Oak',750.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (4,'Entertainment Center','Cherry',1650.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (5,'Writer''s Desk','Oak',325.00,0,2);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (6,'8-Drawer Dresser','Birch',750.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (7,'48 Bookcase','Walnut',150.00,0,3);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (8,'48 Bookcase','Oak',175.00,0,3);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (9,'96 Bookcase','Walnut',225.00,0,3);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (10,'96 Bookcase','Oak',200.00,0,3);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (11,'4-Drawer Dresser','Oak',500.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (12,'8-Drawer Dresser','Oak',800.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (13,'Nightstand','Cherry',150.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (14,'Writer''s Desk','Birch',300.00,0,2);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (17,'High Back Leather Chair','Leather',362.00,0,3);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (18,'6'' Grandfather Clock','Oak',890.00,0,4);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (19,'7'' Grandfather Clock','Oak',1100.00,0,4);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (20,'Amoire','Walnut',1200.00,0,2);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (21,'Pine End Table','Pine',256.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (24,null,null,0.00,0,5);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (25,null,null,0.00,0,2);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (1, to_Date('08/Sep/09', 'DD/MON/RR'), 4, to_date('25/Nov/05', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (2, to_date('04/Oct/09', 'DD/MON/RR'), 3, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (3, to_date('19/Jul/09', 'DD/MON/RR'), 1, to_date('', 'DD/MON/RR'), 2, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (4, to_date('01/Nov/09', 'DD/MON/RR'), 6, to_date('', 'DD/MON/RR'), 5, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (5, to_date('28/Jul/09', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (6, to_Date('27/Aug/09', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (7, to_date('16/Sep/09', 'DD/MON/RR'), 1, to_date('', 'DD/MON/RR'), 2, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (8, to_date('16/Sep/09', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (9, to_date('16/Sep/09', 'DD/MON/RR'), 6, to_date('', 'DD/MON/RR'), 5, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (19, to_date('05/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (20, to_date('06/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (21, to_date('06/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (22, to_date('06/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (23, to_date('06/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (24, to_date('10/Mar/10', 'DD/MON/RR'), 1, to_date('', 'DD/MON/RR'), 2, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (25, to_date('10/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (26, to_date('10/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (27, to_date('10/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (28, to_date('10/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (29, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (30, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, 4);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (31, to_date('11/Mar/10', 'DD/MON/RR'), 15, to_date('', 'DD/MON/RR'), 4, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (32, to_date('11/Mar/10', 'DD/MON/RR'), 15, to_date('', 'DD/MON/RR'), 4, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (34, to_date('11/Mar/10', 'DD/MON/RR'), 15, to_date('', 'DD/MON/RR'), 4, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (35, to_date('11/Mar/10', 'DD/MON/RR'), 8, to_date('', 'DD/MON/RR'), 5, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (36, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, 1);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (37, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (38, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, 1);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (39, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, 1);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (40, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (41, to_date('11/Mar/10', 'DD/MON/RR'), 12, to_date('', 'DD/MON/RR'), 6, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (42, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (43, to_date('11/Mar/10', 'DD/MON/RR'), 12, to_date('', 'DD/MON/RR'), 6, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (44, to_date('11/Mar/10', 'DD/MON/RR'), 6, to_date('', 'DD/MON/RR'), 9, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (45, to_date('11/Mar/10', 'DD/MON/RR'), 12, to_date('', 'DD/MON/RR'), 6, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (46, to_date('11/Mar/10', 'DD/MON/RR'), 1, to_date('', 'DD/MON/RR'), 2, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (47, to_date('11/Mar/10', 'DD/MON/RR'), 12, to_date('', 'DD/MON/RR'), 6, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (48, to_date('11/Mar/10', 'DD/MON/RR'), 1, to_date('', 'DD/MON/RR'), 2, 3);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (49, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 3, 2);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (50, to_date('11/Mar/10', 'DD/MON/RR'), 8, to_date('', 'DD/MON/RR'), null, 9);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (51, to_date('11/Mar/10', 'DD/MON/RR'), 16, to_date('', 'DD/MON/RR'), null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (52, to_date('11/Mar/10', 'DD/MON/RR'), 16, to_date('', 'DD/MON/RR'), null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (53, to_date('11/Mar/10', 'DD/MON/RR'), 16, to_date('', 'DD/MON/RR'), null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (54, to_date('11/Mar/10', 'DD/MON/RR'), 16, to_date('', 'DD/MON/RR'), 9, 10);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (55, to_date('11/Mar/10', 'DD/MON/RR'), 16, to_date('', 'DD/MON/RR'), null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (56, to_date('11/Mar/10', 'DD/MON/RR'), 9, to_date('', 'DD/MON/RR'), 2, 11);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (57, to_date('11/Mar/10', 'DD/MON/RR'), 9, to_date('', 'DD/MON/RR'), null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (58, to_date('11/Mar/10', 'DD/MON/RR'), 14, to_date('', 'DD/MON/RR'), 5, 13);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (59, to_date('11/Mar/10', 'DD/MON/RR'), 13, to_date('', 'DD/MON/RR'), 8, 14);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (63, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 6, 15);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (64, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 6, 2);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (65, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 6, 1);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (66, to_date('11/Mar/10', 'DD/MON/RR'), 9, to_date('', 'DD/MON/RR'), 5, 17);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (69, to_date('11/Mar/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), 2, 2);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (71, to_date('08/Sep/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (73, to_date('08/Sep/10', 'DD/MON/RR'), 12, to_date('', 'DD/MON/RR'), null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (75, to_date('08/Sep/10', 'DD/MON/RR'), 1, to_date('', 'DD/MON/RR'), null, 3);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (76, to_date('15/Sep/10', 'DD/MON/RR'), 4, to_date('', 'DD/MON/RR'), null, null);



Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (1,1,2,18);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (31,1,6,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (2,1,10,9);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (3,2,3,12);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (4,2,8,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (5,2,14,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (17,3,2,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (7,4,3,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (15,4,4,0);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (8,4,5,3);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (16,4,6,3);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (29,5,1,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (9,5,6,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (37,24,1,0);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (39,25,2,5);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (40,26,1,5);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (41,28,1,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (42,32,5,10);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (43,32,14,10);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (46,39,2,3);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (51,48,17,5);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (54,49,1,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (53,50,20,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (55,51,3,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (56,51,4,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (57,52,1,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (58,52,4,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (59,54,2,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (60,54,3,3);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (61,55,1,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (62,55,4,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (63,56,4,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (64,58,3,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (65,59,13,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (66,63,3,5);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (67,65,4,0);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (68,66,4,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (69,69,7,4);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (70,71,3,0);


commit; 

/*Create table Date Dimension*/
Drop table Date_Dim; 
CREATE TABLE Date_Dim(
DateKey Integer NOT NULL,
DateValue Date NOT NULL,
Day Char(10 ),
DayOfWeek Integer,
DayOfMonth Integer,
DayOfYear Integer,
PreviousDay date,
NextDay date,
WeekOfYear Integer,
Month Char(10 ),
MonthOfYear Integer,
QuarterOfYear Integer,
Year Integer, 
	 CONSTRAINT Date_Dim_PK PRIMARY KEY (DateKey)
);

INSERT INTO Date_Dim
SELECT
to_number(to_char(CurrDate, 'YYYYMMDD')) as DateKey,
CurrDate AS DateValue,
TO_CHAR(CurrDate,'Day') as Day,
to_number(TO_CHAR(CurrDate,'D')) AS DayOfWeek,
to_number(TO_CHAR(CurrDate,'DD')) AS DayOfMonth,
to_number(TO_CHAR(CurrDate,'DDD')) AS DayOfYear,
CurrDate - 1 as PreviousDay,
CurrDate + 1 as NextDay,
to_number(TO_CHAR(CurrDate+1,'IW')) AS WeekOfYear,
TO_CHAR(CurrDate,'Month') AS Month,
to_number(TO_CHAR(CurrDate,'MM')) AS MonthofYear,
to_number((TO_CHAR(CurrDate,'Q'))) AS QuarterOfYear,
to_number(TO_CHAR(CurrDate,'YYYY')) AS Year
FROM (
select level n, TO_DATE('01/06/2009','DD/MM/YYYY') + NUMTODSINTERVAL(level,'day') CurrDate
from dual
connect by level <= 500)
order by 1;

