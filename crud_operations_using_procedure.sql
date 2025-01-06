--crud operations
--village
--1-insert
CREATE OR REPLACE PROCEDURE add_village (
    p_village_name IN VARCHAR2,
    p_region IN VARCHAR2,
    p_description IN VARCHAR2
) AS
BEGIN
    INSERT INTO Villages (village_name, region, description)
    VALUES (p_village_name, p_region, p_description);
    DBMS_OUTPUT.PUT_LINE('Village added successfully: ' || p_village_name);
    COMMIT;
END;
/

SET SERVEROUTPUT ON;
BEGIN
   -- add_village('Greenfield', 'south', 'A small peaceful village.');
   add_village('Greenary', 'south-east', 'A greenary full and valley beautiful village.');
END;

select *from villages;

--update
CREATE OR REPLACE PROCEDURE update_village (
    p_village_id IN NUMBER,
    p_village_name IN VARCHAR2,
    p_region IN VARCHAR2,
    p_description IN VARCHAR2
) AS
BEGIN
    UPDATE Villages
    SET village_name = p_village_name,
        region = p_region,
        description = p_description
    WHERE village_id = p_village_id;
    DBMS_OUTPUT.PUT_LINE('Village updated successfully: ' || p_village_name);
    COMMIT;
END;
/

SET SERVEROUTPUT ON;
BEGIN
    update_village(1,'jungler', 'north', 'A small but beautiful and peaceful village.');
END;

select *from villages;

--3-delete
CREATE OR REPLACE PROCEDURE delete_village (
    p_village_id IN NUMBER
) AS
BEGIN
    DELETE FROM Villages WHERE village_id = p_village_id;
    DBMS_OUTPUT.PUT_LINE('Village deleted successfully: ID ' || p_village_id);
    COMMIT;
END;
/

SET SERVEROUTPUT ON;
BEGIN
    delete_village(25);
END;

--attractions
--1-insert
CREATE OR REPLACE PROCEDURE add_attraction (
    p_village_id IN NUMBER,
    p_name IN VARCHAR2,
    p_description IN VARCHAR2
) AS
BEGIN
    INSERT INTO Attractions (village_id, name, description)
    VALUES (p_village_id, p_name, p_description);
    DBMS_OUTPUT.PUT_LINE('Attraction added successfully: ' || p_name);
    COMMIT;
END;
/
SET SERVEROUTPUT ON size 100000;
BEGIN
    add_attraction(1, 'Historic Castle', 'A beautiful medieval castle located in the heart of the village.');
END;

select *from attractions;


--2-update
CREATE OR REPLACE PROCEDURE update_attraction (
    p_attraction_id IN NUMBER,
    p_name IN VARCHAR2,
    p_description IN VARCHAR2
) AS
BEGIN
    UPDATE Attractions
    SET name = p_name,
        description = p_description
    WHERE attraction_id = p_attraction_id;
    DBMS_OUTPUT.PUT_LINE('Attraction updated successfully: ' || p_name);
    COMMIT;
END;
/

set serveroutput on size 100000;
begin
    update_attraction(2, 'scenic waterfall', 'a breathtaking waterfall surrounded by lush greenery, perfect for nature lovers.');
end;
/


--3-delete
CREATE OR REPLACE PROCEDURE delete_attraction (
    p_attraction_id IN NUMBER
) AS
BEGIN
    DELETE FROM Attractions WHERE attraction_id = p_attraction_id;
    DBMS_OUTPUT.PUT_LINE('Attraction deleted successfully: ID ' || p_attraction_id);
    COMMIT;
END;
/
set serveroutput on size 100000;
begin
    delete_attraction(1);
end;
/

--tourism packages
--1-insert
CREATE OR REPLACE PROCEDURE add_package (
    p_village_id IN NUMBER,
    p_package_name IN VARCHAR2,
    p_duration IN NUMBER,
    p_price IN NUMBER,
    p_description IN VARCHAR2
) AS
BEGIN
    INSERT INTO Tourism_Packages (village_id, package_name, duration, price, description)
    VALUES (p_village_id, p_package_name, p_duration, p_price, p_description);
    DBMS_OUTPUT.PUT_LINE('Package added successfully: ' || p_package_name);
    COMMIT;
END;
/
set serveroutput on size 100000;
begin
    add_package(5, 'foodland restaurant', 7, 375.00, 'a 7-day nature retreat in the foodland village with forest hikes and relaxation.');
end;
/

--2-update
CREATE OR REPLACE PROCEDURE update_package (
    p_package_id IN NUMBER,
    p_package_name IN VARCHAR2,
    p_duration IN NUMBER,
    p_price IN NUMBER,
    p_description IN VARCHAR2
) AS
BEGIN
    UPDATE Tourism_Packages
    SET package_name = p_package_name,
        duration = p_duration,
        price = p_price,
        description = p_description
    WHERE package_id = p_package_id;
    DBMS_OUTPUT.PUT_LINE('Package updated successfully: ' || p_package_name);
    COMMIT;
END;
/
set serveroutput on size 100000;
begin
    update_package(5, 'humayu restaurant', 7, 375.00, 'a 7-day nature retreat in humayu restaurant.');
end;
/

select *from TOURISM_PACKAGES;


--3-delete
CREATE OR REPLACE PROCEDURE delete_package (
    p_package_id IN NUMBER
) AS
BEGIN
    DELETE FROM Tourism_Packages WHERE package_id = p_package_id;
    DBMS_OUTPUT.PUT_LINE('Package deleted successfully: ID ' || p_package_id);
    COMMIT;
END;
/
set serveroutput on size 100000;
begin
    delete_package(2);
end;
/
--customers
--1-insert
CREATE OR REPLACE PROCEDURE add_customer (
    p_name IN VARCHAR2,
    p_contact_info IN VARCHAR2,
    p_address IN VARCHAR2,
    p_email IN VARCHAR2
) AS
BEGIN
    INSERT INTO Customers (name, contact_info, address, email)
    VALUES (p_name, p_contact_info, p_address, p_email);
    DBMS_OUTPUT.PUT_LINE('Customer added successfully: ' || p_name);
    COMMIT;
END;
/
set serveroutput on size 100000;
begin
    add_customer('john doe', '1234567890', '123 main st, city, country', 'john.doe@example.com');
    end;
/

select *from customers;

--bookings
--1-insert
CREATE OR REPLACE PROCEDURE book_package (
    p_customer_id IN NUMBER,
    p_package_id IN NUMBER
) AS
BEGIN
    INSERT INTO Bookings (customer_id, package_id)
    VALUES (p_customer_id, p_package_id);
    DBMS_OUTPUT.PUT_LINE('Booking made successfully for Customer ID: ' || p_customer_id);
    COMMIT;
END;
/
set serveroutput on size 100000;
begin
    book_package(5,5);
end;
/

select *from bookings;

