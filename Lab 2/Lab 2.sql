select customer_first_name, customer_last_name
from customers
where customer_state='DC';

select customer_last_name, customer_address
from customers
where customer_city<'New York';

select invoice_number, invoice_date, (invoice_total-payment_total) as Remaining_Total
from invoices;

select max(unit_price)
from items;

select count(*) 
from invoice_line_items;

select title, artist
from items
where artist like '%&%';

select customer_first_name, customer_last_name
from customers
where customer_fax is null;

select count(*)
from customers
where customer_fax='NULL';

select customer_first_name, customer_last_name
from customers
order by customer_last_name, customer_first_name desc;

select customer_last_name, customer_address
from customers
where (customer_state='CA' and customer_city<'New York');

select customer_last_name, customer_first_name, customer_state, customer_city
from customers
where (customer_first_name like 'A%' and customer_city>'New York')
or customer_state='CA';

select customer_last_name, customer_first_name, customer_state, customer_city
from customers
where (customer_first_name like 'A%' and customer_city>'New York')
and customer_state='CA';

select invoice_id, invoice_total
from invoices
where invoice_total>600 and invoice_total<700;

select vendor_contact_first_name, vendor_contact_last_name 
from vendors
where vendor_contact_first_name like 'C%'
order by vendor_contact_last_name, vendor_contact_first_name;

select customer_first_name, nvl(customer_fax,9999999999)
from customers;

select SUBSTR(customer_first_name,1,1), customer_last_name
from customers;

select CONCAT(SUBSTR(customer_first_name,1,1),'.'), customer_last_name
from customers;

select unique vendor_id
from invoices