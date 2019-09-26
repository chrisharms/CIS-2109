select c.customer_id, NVL((o.shipped_date - o.order_date),-99) as time_to_ship
from customers c right outer join orders o
on c.customer_id = o.customer_id
where c.customer_city = 'Los Angeles';

select o.customer_id, NVL((o.shipped_date - o.order_date),-99) as time_to_ship
from orders o
where exists (select c.customer_id
                        from customers c
                        where c.customer_city = 'Los Angeles'
                        and c.customer_id = o.customer_id);

select vendor_id, avg(invoice_total) as vendor_avg
from invoices
group by vendor_id
having avg(invoice_total) > (select avg(invoice_total) from invoices);

select distinct vendor_id
from invoices
where invoice_total > (select avg(invoice_total) from invoices);


select o.order_id
from order_details o inner join items i
on o.item_id = i.item_id
where i.artist = 'Burt Ruggles'
union all
select o.order_id
from order_details o inner join items i
on o.item_id = i.item_id
where i.artist = 'Jess & Odie';

select o.order_id
from order_details o inner join items i
on o.item_id = i.item_id
where i.artist = 'Burt Ruggles'
and o.order_id in (select o.order_id
                   from order_details o inner join items i
                   on o.item_id = i.item_id
                   where i.artist = 'Jess & Odie');

select c.customer_id,  NVL(sum(d.order_qty * i.unit_price),0) as total_amount
from customers c full outer join orders o
on c.customer_id = o.customer_id
full outer join order_details d
on o.order_id = d.order_id
full outer join items i
on d.item_id = i.item_id
group by c.customer_id;

select customer_id, total_amount, case
    when total_amount <= 50 then 'very bad'
    when total_amount > 50 and total_amount <= 100 then 'bad'
    when total_amount > 100 and total_amount <= 150 then 'ok'
    when total_amount > 150 and total_amount <= 200 then 'good'
    else 'very good'
    end customer_status
from (select c.customer_id,  NVL(sum(d.order_qty * i.unit_price),0) as total_amount
      from customers c full outer join orders o
      on c.customer_id = o.customer_id
      full outer join order_details d
      on o.order_id = d.order_id
      full outer join items i
      on d.item_id = i.item_id
      group by c.customer_id)
order by customer_id;