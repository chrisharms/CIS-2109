select artist, avg(unit_price)
from items
group by artist;

select order_id, sum(order_qty) as total_items
from order_details
group by order_id;

select customer_state, count(unique(customer_city)) as State_Cities
from customers
group by customer_state
having count(unique(customer_city))>1;


select concat('Today the date is: ',to_char(SYSDATE,'MM-DD-YYYY HH24:MI:SS'))
from dual;

select vendor_name, invoice_total, payment_total, credit_total
from vendors inner join invoices
on vendors.vendor_id=invoices.vendor_id
where invoice_total=(payment_total+credit_total) and credit_total!=0;

select title, count(order_id)
from items join order_details
on items.item_id=order_details.item_id
group by title
having count(order_id)>5;

select count(first_name)
from vendor_contacts
group by first_name
having count(first_name)>1;

select c.customer_first_name, c.customer_last_name, NVL(o.order_id,'0'), sum(o2.order_qty)
from customers c left outer join orders o
on c.customer_id = o.customer_id
left outer join order_details o2
on o2.order_id = o.order_id
group by c.customer_last_name, c.customer_first_name, NVL(o.order_id,'0');

select distinct v.vendor_id, invoice_id
from vendors v left outer join invoices i
on v.vendor_id = i.vendor_id;

select v.vendor_name, v.vendor_phone,
NVL(v2.vendor_name,'N/A') as cooperating_vendor, v2.vendor_phone as cooperating_vendor_phone
from vendors v left outer join vendors v2
on v.vendor_id = v2.cooperating_vendor_id;