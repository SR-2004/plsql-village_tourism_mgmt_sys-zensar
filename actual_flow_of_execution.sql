-- execute a procedure based on user choice
create or replace procedure execute_operation(choice number) as
begin
    case choice
        when 1 then
            search_attractions('park');
        when 2 then
            search_villages('hilltop');
        when 3 then
            search_packages_by_village_and_fee('riverside', 300);
        else
            dbms_output.put_line('invalid choice. please enter a valid option.');
    end case;
end;
/

set serveroutput on;
begin
    execute_operation(1); -- calling ones for adding village
    execute_operation(2); --updating
    execute_operation(3); --deleting
end;
/



--actual flow for user to work with a project accordingly
create or replace procedure execute_operation(choice number) as
begin
    case choice
        when 1 then
            add_village('Greenary', 'south-east', 'A greenary full and valley beautiful village.');
            dbms_output.put_line('Village added successfully.');

        when 2 then
            update_village(1, 'Harmony Village', 'South Region', 'A vibrant village with rich culture and traditions.');
            dbms_output.put_line('Village updated successfully.');

        when 3 then
            delete_village(21);
            dbms_output.put_line('Village deleted successfully.');

        when 4 then
            add_attraction(1, 'Mystic Lake', 'A serene lake surrounded by mountains.');
            dbms_output.put_line('Attraction added successfully.');

        when 5 then
            update_attraction(1, 'Mystic Falls', 'A beautiful waterfall in the heart of the forest.');
            dbms_output.put_line('Attraction updated successfully.');

        when 6 then
            delete_attraction(1);
            dbms_output.put_line('Attraction deleted successfully.');

        when 7 then
            add_package(1, 'Adventure Trek', 5, 499.99, 'A thrilling trek through the mountains.');
            dbms_output.put_line('Package added successfully.');

        when 8 then
            update_package(1, 'Relaxation Retreat', 3, 299.99, 'A relaxing retreat with spa services.');
            dbms_output.put_line('Package updated successfully.');

        when 9 then
            delete_package(11);
            dbms_output.put_line('Package deleted successfully.');

        when 10 then
            add_customer('John Doe', '1234567890', '123 Elm Street, Springfield', 'johndoe@example.com');
            dbms_output.put_line('Customer added successfully.');

        when 11 then
            book_package(1, 1);
            dbms_output.put_line('Package booked successfully.');

        when 12 then
            show_attractions;

        else
            dbms_output.put_line('Invalid choice. Please enter a valid option.');
    end case;
end;
/

set serveroutput on size 1000000;
begin
    execute_operation(1); -- Replace the number with the desired operation choice
end;