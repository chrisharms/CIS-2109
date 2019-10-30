Create Table Employee_T (
    Emp_ID          varchar(5) Primary Key,
    Emp_Salary      Number(6) Not Null,
    Emp_Super       varchar(10),
    Emp_Dept        Number(2));
    
Create Table Store_T (
    Store_Name      varchar(20) Primary Key,
    Store_Mgr       varchar(10),
    Revenue         Number(8),
    Opening_Date    Date);

Create Table Employee_Store_T (
    Emp_ID          varchar(5) references Employee_T (Emp_ID),
    Store_Name      varchar(20) references Store_T (Store_Name), 
    Rating          Number(2),
    Hours_Per_Week  Number(3),
    constraint PK_Employee_Store_T primary key (Emp_ID, Store_Name));
    

insert into Employee_T 
values('E-11',60000,'Alice',10);
insert into Employee_T 
values('E-5',55000,'Bob',12);
insert into Employee_T 
values('E-6',43000,'Alice',10);
insert into Employee_T 
values('E-2',45000,'Bob',15);

insert into Store_T
values('Pink_Store','Bob',300000,'15-JAN-2015');
insert into Store_T
values('Blue_Store','Alice',500000,'1-MAR-2014');

insert into Employee_Store_T
values('E-11','Pink_Store',9,25);
insert into Employee_Store_T
values('E-5','Pink_Store',8,40);
insert into Employee_Store_T
values('E-6','Pink_Store',8,10);
insert into Employee_Store_T
values('E-11','Blue_Store',7,15);
insert into Employee_Store_T
values('E-6','Blue_Store',9,30);
insert into Employee_Store_T
values('E-2','Blue_Store',9,40);

select es.store_name, s.store_mgr, es.emp_id, es.hours_per_week,
s.revenue, s.opening_date, e.emp_salary, e.emp_super, e.emp_dept,
es.rating
from Employee_T e full join Employee_Store_T es
on e.emp_id = es.emp_id
full join Store_T s
on es.store_name = s.store_name;


update employee_t
set emp_salary = emp_salary + 1000
where emp_dept = 10;

alter table store_t
add Square_Footage number(6);

update store_t
set square_footage = 3000
where store_name = 'Blue_Store';

update store_t
set square_footage = 2000
where store_name = 'Pink_Store';

alter table employee_t
rename column emp_id to Emp_Number;

alter table employee_store_t
rename column emp_id to Emp_Number;

delete from employee_store_t
where store_name = 'Pink_Store';

delete from store_t
where store_name = 'Pink_Store';

alter table employee_store_t
drop column rating;

alter table employee_t
modify emp_salary null;

insert into employee_t
values('E-20',null,'John',30);