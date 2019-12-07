alter table product_dim
add BEffDate    date;
alter table product_dim
add EEffDate    date;
alter table product_dim
add CurrentFlag char(1 byte);

update product_dim
set beffdate = to_date ('10-JUN-15','DD-MMM-YY')
where eeffdate is null;