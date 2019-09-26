select orderid, paymentid
from payment_t;

select s.employeesupervisor, count(e.employeeid) as headcount
from employee_t e join employee_t s
on e.employeeid = s.employeesupervisor 
group by s.employeesupervisor
having count(e.employeeid) > 2;

--3

select o.orderid, sum(l.orderedquantity * p.productstandardprice) as totaldue, p.paymentamount
from order_t o left outer join orderline_t l
on o.orderid = l.orderid
left outer join payment_t p
on p.orderid = l.orderid
left outer join product_t p
on l.productid = p.productid
group by o.orderid, p.paymentamount
order by (totaldue-p.paymentamount) desc;

select NVL(s.salespersonstate,'Unknown State') as salesperson_state, NVL(p.productfinish,'unknown finish') as product_finish, sum(l.orderedquantity) as totsales
from salesperson_t s left outer join order_t o
on s.salespersonid = o.salespersonid
left outer join orderline_t l
on o.orderid = l.orderid
left outer join product_t p
on l.productid = p.productid
group by NVL(s.salespersonstate,'Unknown State'), NVL(p.productfinish,'unknown finish')
order by NVL(s.salespersonstate,'Unknown State');

select distinct c.customerid, c.customername, sum(l.orderedquantity) as num_products
from customer_t c left outer join order_t o
on c.customerid = o.customerid
left outer join orderline_t l
on o.orderid = l.orderid
left outer join product_t p
on l.productid = p.productid
where extract (month from o.orderdate) = 3 and p.productlineid = 1
group by c.customerid, c.customername
union
select c.customerid, c.customername, 0
from customer_t c
where c.customerid not in (select distinct c.customerid
                        from customer_t c left outer join order_t o
                        on c.customerid = o.customerid
                        left outer join orderline_t l
                        on o.orderid = l.orderid
                        left outer join product_t p
                        on l.productid = p.productid
                        where extract (month from o.orderdate) = 3 and p.productlineid = 1);

select orderid
from order_t
minus
select orderid
from payment_t;

select customerstate
from customer_t
minus
select salespersonstate
from salesperson_t;

select distinct c.customerstate
from customer_t c 
where c.customerstate not in (select s.salespersonstate
                              from salesperson_t s
                              where s.salespersonstate = c.customerstate);
                              
select territoryid, territoryname
from territory_t;

select s.salespersonname, sum(ol.orderedquantity)
from salesperson_t s left outer join order_t o
on s.salespersonid = o.salespersonid
left outer join orderline_t ol
on o.orderid = ol.orderid
left outer join product_t p
on ol.productid = p.productid
where p.productdescription = 'Oak Computer Desk' 
group by s.salespersonname
having sum(ol.orderedquantity) in (select max(ol.orderedquantity)
                        from salesperson_t s left outer join order_t o
                        on s.salespersonid = o.salespersonid
                        left outer join orderline_t ol
                        on o.orderid = ol.orderid
                        left outer join product_t p
                        on ol.productid = p.productid
                        where p.productdescription = 'Oak Computer Desk');

select c.customerid, count(orderid), (count(orderid) / (select count(orderid) from order_t))* 100 as percent
from customer_t c left outer join order_t o
on c.customerid = o.customerid 
group by c.customerid;

--#9
select t.territoryid, t.territoryname, count(c.customername) as total_cust
from territory_t t left outer join salesperson_t s
on t.territoryid = s.salesterritoryid
left outer join order_t o
on s.salespersonid = o.salespersonid
left outer join customer_t c
on o.customerid = c.customerid 
group by t.territoryid, t.territoryname
having count(c.customername) > 1.5*(select count(customerid) / count(territoryid)
                                    from customer_t, territory_t);

select count(customerid) from customer_t / select count(territoryid) from territory_t;

select (select count(territoryid) from territory_t) as total_terr
from dual;

select count(customerid) / count(distinct customerstate) as avg_cust_per_state
from customer_t;