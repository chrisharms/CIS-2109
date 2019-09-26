
-- INSERT INTO invoices 
INSERT INTO invoices 
(invoice_id,vendor_id,invoice_number,invoice_date,invoice_total,payment_total,credit_total,terms_id,invoice_due_date,payment_date) 
VALUES 
(115,83,'31361834',TO_DATE('24-MAY-08','DD-MON-RR'),318.42,0,0,2,TO_DATE('10-JUN-08','DD-MON-RR'),null);

INSERT INTO invoices 
(invoice_id,vendor_id,invoice_number,invoice_date,invoice_total,payment_total,credit_total,terms_id,invoice_due_date,payment_date) 
VALUES 
(116,102,'31215834',TO_DATE('24-MAY-08','DD-MON-RR'),318.42,0,0,2,TO_DATE('10-JUN-08','DD-MON-RR'),null);



COMMIT ;

alter table vendors add cooperating_vendor_id number;

update  vendors set cooperating_vendor_id = 2 where vendor_id = 72; 
update  vendors set cooperating_vendor_id = 72 where vendor_id = 2;
update  vendors set cooperating_vendor_id = 22 where vendor_id = 120;
update  vendors set cooperating_vendor_id = 120 where vendor_id = 22;
update  vendors set cooperating_vendor_id = 1 where vendor_id = 114;
update  vendors set cooperating_vendor_id = 114 where vendor_id = 1;
update  vendors set cooperating_vendor_id = 114 where vendor_id = 1;
update  vendors set cooperating_vendor_id = 26 where vendor_id = 59;
update  vendors set cooperating_vendor_id = 59 where vendor_id = 26;
update  vendors set cooperating_vendor_id = 51 where vendor_id = 37;
update  vendors set cooperating_vendor_id = 37 where vendor_id = 51;
update  vendors set cooperating_vendor_id = 73 where vendor_id = 115;
update  vendors set cooperating_vendor_id = 115 where vendor_id = 73;
commit; 
