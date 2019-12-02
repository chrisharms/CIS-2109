select o.orderid, o.orderdate, l.productid, l.orderedquantity, p.productstandardprice
from order_t o join orderline_t l
on o.orderid = l.orderid
join product_t p
on l.productid = p.productid;

create table Product_Dim (
    productkey          number(4,0) primary key not null,
    productid           number(4,0) not null,
    productdescription  varchar2(50 byte) not null,
    productlineid       number(4,0) not null,
    productlinename     varchar2(50 byte) not null);
    
create sequence productseq3 start with 1;

insert into product_dim
select productseq3.nextval as productkey, p.productid as productid,
NVL(p.productdescription,'Undefined') as productdescription, l.productlineid as productid,
l.productlinename as productlinename
from product_t p left outer join productline_t l
on p.productlineid = l.productlineid;

insert into product_dim
values (22,-99,'Undefined',-99,'Undefined');

create table Sales_Fact (
    salesdatekey        number(4,0) primary key not null,
    productkey          number(4,0) not null,
    ordersalesprice     number(6,2) not null,
    CONSTRAINT salesfact_productdim_fk FOREIGN KEY (productkey)
        REFERENCES product_dim (productkey),
    constraint salesfact_datedim_fk foreign key (salesdatekey)
        references date_dim (datekey));

