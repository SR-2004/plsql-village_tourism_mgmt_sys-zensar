
-- procedure to search for packages by village and entry fees
create or replace procedure search_packages_by_village_and_fee(p_village_name in varchar2, p_max_fee in number) as
    cursor packages_cursor is
        select p.package_name, p.duration, p.price, v.village_name
        from tourism_packages p
        join villages v on p.village_id = v.village_id
        where lower(v.village_name) like '%' || lower(p_village_name) || '%'
        and p.price <= p_max_fee;
begin
    for package in packages_cursor loop
        dbms_output.put_line('package: ' || package.package_name);
        dbms_output.put_line('duration: ' || package.duration || ' days');
        dbms_output.put_line('price: ' || package.price);
        dbms_output.put_line('village: ' || package.village_name);
        dbms_output.put_line('--------------------------------------------------');
    end loop;
end;
/

-- trigger to log insertion into attractions
create or replace trigger log_attraction_insertion
after insert on attractions
for each row
begin
    dbms_output.put_line('new attraction added: ' || :new.name);
    dbms_output.put_line('description: ' || :new.description);
end;
/

-- trigger to log updates on villages
create or replace trigger log_village_update
after update on villages
for each row
begin
    dbms_output.put_line('village updated from ' || :old.village_name || ' to ' || :new.village_name);
    dbms_output.put_line('new description: ' || :new.description);
end;
/



--triggers for operations
CREATE OR REPLACE TRIGGER villages_insert_trigger
AFTER INSERT ON villages
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Inserted village: ' || :NEW.village_name || ' in region ' || :NEW.region);
END;
/

CREATE OR REPLACE TRIGGER villages_update_trigger
AFTER UPDATE ON villages
FOR EACH ROW
BEGIN
    -- Log the update action (you can replace this with any required action)
    DBMS_OUTPUT.PUT_LINE('Updated village: ' || :OLD.village_name || ' to ' || :NEW.village_name || ' in region ' || :NEW.region);
END;
/

--executing the triggers
SET SERVEROUTPUT ON;
BEGIN
    add_village('New Village', 'North-East', 'A growing village with many amenities.');
END;
/

SET SERVEROUTPUT ON;
BEGIN
    update_village(3, 'Updated Riverside', 'North-east', 'A village by the river with scenic views.');
END;
/

SET SERVEROUTPUT ON;
BEGIN
    delete_village(21);
END;
/ 



--cursor --->fetch all data
create or replace procedure show_attractions as
    cursor attractions_cursor is
        select attraction_id, name, description
        from attractions;
begin
    dbms_output.put_line('--------------------------------------------------');
    dbms_output.put_line('              attractions list');
    dbms_output.put_line('--------------------------------------------------');
    for attraction in attractions_cursor loop
        dbms_output.put_line('attraction id: ' || attraction.attraction_id);
        dbms_output.put_line('name        : ' || attraction.name);
        dbms_output.put_line('description : ' || attraction.description);
        dbms_output.put_line('--------------------------------------------------');
    end loop;
    dbms_output.put_line('--------------------------------------------------');
end;
/

set serveroutput on;
begin
    show_attractions;
end;
/

