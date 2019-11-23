create directory paymentrecords_dir as 'C:\Users\charm\Documents\GitHub\CIS-2109\Final Project\';
create table paymentrecords_ext (
paymentid                   number(38,0),
paymentamount               number,
paymentdate                 date,
firstdepositdate            date,
finalpaymentduedate         date,
remainingbalance            number,
order_orderid               number(38,0),
paymentplan_paymentplanid   number(38,0))
organization external (
        type oracle_loader
        default directory paymentrecords_dir
        access parameters (fields terminated by ',')
        location ('paymentrecords.csv'));
        

insert into customer
values (1,'Chris','Harms','3255 Dbms Lane','Templeville','PA',19121,6969696969,'chisiscool@temple.edu');
insert into customer
values (2,'Joe','Shmoe','4222 Clinton Way','Intercourse','PA',18076,1234567890,'dude@temple.edu');
insert into customer
values (3,'Peter','Parker','123 Spidey Street','Forest Hills','NY',17026,9083761468,'spiderboi@temple.edu');
alter table customer 
add university varchar2(30);
update customer set university = 'Temple University' where customerid = 1;
update customer set university = 'Penn State University' where customerid = 2;
update customer set university = 'UCLA' where customerid = 3;

insert into employee
values (1,'John','Doe',1000000,'Box Packer Guy',1);
insert into employee
values (2,'Jane','Doe',1000001,'Warehouse Staff',1);
insert into employee
values (3,'Mike','Hick',1001,'Contact Sponsors',2);

insert into "Order"
values (1,'04-FEB-18',1,1);
insert into "Order"
values (2,'24-AUG-18',2,1);
insert into "Order"
values (3,'11-JUN-19',3,1);
insert into "Order"
values (4,'13-MAR-19',2,1);

insert into vendor
values (1,'Nice Electronics LLC.','Matt','Long',4789213409,'101 Electric Ave','Electric City','PA',10234);
insert into vendor
values (2,'Nicer Electronics LLC.','Brandon','Long',5684981209,'105 Electric Street','Electricville','PA',10574);

insert into productcategory
values (1,'Camera','Device that you point at things and click to take pictures');
insert into productcategory
values (2,'Laptop','Device that you use to struggle with Oracle SQL Dev');

insert into product
values (1,'Nikon D3500',400,'Refurbished','Nice af DSLR camera that takes good pics',1,2);
insert into product
values (2,'Canon Rebel T5',550,'New','A canon camera thats nicer than the Nikon',1,1);
insert into product
values (3,'Macbook Pro 13 Inch',1100,'Refurbished','2017 Macbook Pro with some fast and nice specs',2,2);
insert into product
values (4,'Dell XPS 13',1300,'New','2018 Dell laptop thats brand new',2,1);

insert into sponsor
values (1,'Cool Recycling','Zack','Smart','34 Recycle Avenue','Greenville','NJ',12098);
insert into sponsor
values (2,'Donation Center','Jen','Long','531 Donate Way','Nashville','TN',10375);
insert into sponsor
values (3,'Best Buy','John','Stamos','23 Hollywood Blvd','Hollywood','CA',16325);

insert into sponsoredproducts
values (1,1,30);
insert into sponsoredproducts
values (3,1,36);
insert into sponsoredproducts
values (4,2,30);

insert into sponsorcontacts
values (1,1);
insert into sponsorcontacts
values (2,3);
insert into sponsorcontacts
values (3,3);

insert into paymentplan
values (1,'Credit Card',24);
insert into paymentplan
values (2,'Credit Card',36);
insert into paymentplan
values (3,'Check',12);
insert into paymentplan
values (4,'Cash',36);

insert into orderline
values (1,2,2);
insert into orderline
values (2,4,4);
insert into orderline
values (3,1,1);
insert into orderline
values (4,2,2);
insert into orderline
values (2,2,5);

insert into shipment
values (1,'07-FEB-19',1,2,2);
insert into shipment
values (2,'28-AUG-18',2,4,4);
insert into shipment
values (3,'15-JUN-19',3,1,1);
insert into shipment
values (4,'17-MAR-19',4,2,2);
insert into shipment
values (5,'28-AUG-18',2,2,3);
insert into shipment
values (6,'28-AUG-18',2,2,2);
