select customer_city as city
from customers cust
where customer_state='CA';

select title, unit_price, unit_price*1.2 as higher_price
from items;

select title
from items
where title like '%t';

select customer_first_name, customer_city, customer_state
from customers
where (customer_state='CA' or customer_state='FL') and customer_city > 'Fresno';

select count(customer_id)
from customers
where customer_state='CA';
