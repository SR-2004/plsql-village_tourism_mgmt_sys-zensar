-- create all tables of village tourism management system

create table villages (village_id number generated by default as identity primary key, village_name varchar2(100) not null, region varchar2(50), description varchar2(255));

create table attractions (attraction_id number generated by default as identity primary key, village_id number not null references villages(village_id), name varchar2(100), description varchar2(255));

create table tourism_packages (package_id number generated by default as identity primary key, village_id number not null references villages(village_id), package_name varchar2(100), duration number, price number(10, 2), description varchar2(255)); 

create table customers (customer_id number generated by default as identity primary key, name varchar2(100), contact_info varchar2(15), address varchar2(255), email varchar2(100)); 

create table bookings (booking_id number generated by default as identity primary key, customer_id number not null references customers(customer_id), package_id number not null references tourism_packages(package_id), booking_date date default sysdate, status varchar2(20) default 'booked');

