create user clerk identified by "password1";
create user manager identified by "password2";
create user developer identified by "password3";

grant select any table to clerk;

grant select any table to manager;
grant update any table to manager;
grant insert any table to manager;
grant delete any table to manager;

grant all privileges to developer;