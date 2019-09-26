select p1.productlineid, max(p2.productstandardprice) as max_price
from productline_t p1 left outer join product_t p2
on p1.productlineid = p2.productlineid
group by p1.productlineid;


select productid, count(productid), sum(orderedquantity) as TotalQtyOrdered
from orderline_t
group by productid
order by TotalQtyOrdered;

select c.customerid, extract(month from o.orderdate) as order_month, count(extract(month from o.orderdate)) as month_count
from customer_t c left outer join order_t o
on c.customerid= o.customerid
group by extract(month from o.orderdate), c.customerid
order by c.customerid;

select distinct s.salespersonname, c.customername, c.customerid
from salesperson_t s join order_t o
on s.salespersonid = o.salespersonid 
join customer_t c
on o.customerid = c.customerid
order by s.salespersonname;

select p.productid, count(t.orderid) as NumOrders
from product_t p left outer join orderline_t o
on p.productid = o.productid
left outer join order_t t
on o.orderid = t.orderid
group by p.productid
order by NumOrders desc;

select c.customerid, count(o.orderid)
from customer_t c left outer join order_t o
on c.customerid = o.customerid
where o.orderdate like '%15%'
group by c.customerid;

select s.salespersonid, count(o.orderid) as Total_Orders
from salesperson_t s left outer join order_t o
on s.salespersonid = o.salespersonid
group by s.salespersonid;

select customerid, count(orderid)
from order_t
having count(orderid)>2
group by customerid;

select salesterritoryid
from salesperson_t
having count(salesterritoryid)>1
group by salesterritoryid;

select p.productid, count(o.orderid) as total_orders, 
from product_t p left outer join orderline_t o
on p.productid = o.productid
group by p.productid
order by count(o.orderid);

select productfinish, min(productstandardprice)
from product_t
where productfinish is not null
group by productfinish
order by min(productstandardprice);

select materialname, materialtype, width
from rawmaterial_t
where material != 'Cherry' and material != 'Oak'
and width > 10;

select s.salespersonid, extract(month from o.orderdate) as order_month,
count(extract(month from o.orderdate)) as total_orders,
extract(year from o.orderdate) as order_year
from salesperson_t s left outer join order_t o
on s.salespersonid = o.salespersonid
group by s.salespersonid, extract(month from o.orderdate), extract(year from o.orderdate)
having extract(year from o.orderdate) = 2015
order by s.salespersonid;