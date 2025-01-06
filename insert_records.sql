-- village
insert into villages (village_name, region, description) values ('southern', 'south', 'a small peaceful village.');
insert into villages (village_name, region, description) values ('riverside', 'north', 'a village by the river with beautiful views.');
insert into villages (village_name, region, description) values ('lakeside', 'west', 'a serene village by a large lake.');
insert into villages (village_name, region, description) values ('hilltop', 'east', 'a village on top of a hill with great views.');
insert into villages (village_name, region, description) values ('woodland', 'central', 'a village surrounded by dense forests.');

select * from villages;


-- attractions
insert into attractions (village_id, name, description) values (1, 'greenfield park', 'a large park with plenty of open space and playgrounds.');
insert into attractions (village_id, name, description) values (2, 'riverside viewpoint', 'a scenic spot offering breathtaking views of the river.');
insert into attractions (village_id, name, description) values (3, 'lakeside boating', 'boating activities on the peaceful lakeside.');
insert into attractions (village_id, name, description) values (4, 'hilltop observatory', 'an observatory offering panoramic views of the surrounding area.');
insert into attractions (village_id, name, description) values (5, 'woodland trails', 'a network of hiking trails through the forest.');

select * from attractions;



-- tourism_bookings
insert into tourism_packages (village_id, package_name, duration, price, description) values (1, 'greenfield escape', 3, 199.99, 'a 3-day retreat in greenfield with relaxation and sightseeing.');
insert into tourism_packages (village_id, package_name, duration, price, description) values (2, 'riverside adventure', 5, 349.50, 'a 5-day adventure in riverside with hiking, boating, and river activities.');
insert into tourism_packages (village_id, package_name, duration, price, description) values (3, 'lakeside leisure', 4, 279.75, 'a 4-day stay at lakeside with boating, fishing, and nature walks.');
insert into tourism_packages (village_id, package_name, duration, price, description) values (4, 'hilltop horizon', 6, 399.00, 'a 6-day tour of hilltop with stunning views, hiking, and astronomy.');
insert into tourism_packages (village_id, package_name, duration, price, description) values (5, 'woodland retreat', 7, 450.00, 'a 7-day nature retreat in the woodland village with forest hikes and relaxation.');

select * from tourism_packages;


-- customers
insert into customers (name, contact_info, address, email) values ('john doe', '1234567890', '123 main st, city, country', 'john.doe@example.com');
insert into customers (name, contact_info, address, email) values ('jane smith', '0987654321', '456 oak st, town, country', 'jane.smith@example.com');
insert into customers (name, contact_info, address, email) values ('michael johnson', '1122334455', '789 pine st, city, country', 'michael.johnson@example.com');
insert into customers (name, contact_info, address, email) values ('sarah lee', '6677889900', '101 maple st, village, country', 'sarah.lee@example.com');
insert into customers (name, contact_info, address, email) values ('david brown', '2233445566', '202 birch st, town, country', 'david.brown@example.com');

select *from customers;


-- bookings
insert into bookings (customer_id, package_id) values (1, 1);
insert into bookings (customer_id, package_id) values (2, 2);
insert into bookings (customer_id, package_id) values (3, 3);
insert into bookings (customer_id, package_id) values (4, 4);
insert into bookings (customer_id, package_id) values (5, 5);

select *from bookings;
