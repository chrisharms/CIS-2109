create table Employee_Archives (
employeeid              varchar2 (10 byte) primary key,
employeename            varchar2 (25 byte),
employeeaddress         varchar2 (30 byte),
employeecity            varchar2 (20 byte),
employeestate           char (2 byte),
employeezip             number,
employeebirthdate       date,
employeedatehired       date,
employeesupervisor      varchar2 (10 byte),
previousmanager         varchar2 (10 byte),
updatedate              date);

create trigger employee_archive_t
after update on employee_t for each row
begin 
insert into employee_archives
values (employeeid,employeename,employeeaddress,employeecity,
        employeestate,employeezip,employeebirthdate,employeedatehired,
        :new.employeesupervisor,:old.employeesupervisor,GetDate());
end;

update employee_t
set employeesupervisor = 1111111
where employeeid = 'Laura';
