IMPLICIT CURSORS:

Attribute Description

%FOUND
Returns TRUE if an INSERT, UPDATE, or DELETE statement
affected one or more rows or a SELECT INTO statement returned
one or more rows. Otherwise, it returns FALSE.

%NOTFOUND
The logical opposite of %FOUND. It returns TRUE if an INSERT,
UPDATE, or DELETE statement affected no rows, or a SELECT
INTO statement returned no rows. Otherwise, it returns FALSE.

%ISOPEN
Always returns FALSE for implicit cursors, because Oracle closes
the SQL cursor automatically after executing its associated SQL
statement.

%ROWCOUNT Returns the number of rows affected by an INSERT, UPDATE, or
DELETE statement, or returned by a SELECT INTO statement.

EXAMPLE:

DECLARE
 total_rows number(2);
BEGIN
   UPDATE customers
   SET salary = salary + 500;
   IF sql%notfound THEN
   dbms_output.put_line('no customers selected');
   ELSIF sql%found THEN
   total_rows := sql%rowcount;
  dbms_output.put_line( total_rows || ' customers selected ');
 END IF;
END;
/

EXPLICIT CURSORS:

--Declaring the Cursor

CURSOR c_customers IS
 SELECT id, name, address FROM customers;
 
--Opening the Cursor
 
 OPEN c_customers;
 
--Fetching the Cursor

FETCH c_customers INTO c_id, c_name, c_addr;

--Closing the Cursor

CLOSE c_customers;

EXAMPLE :

DECLARE
 c_id customers.id%type;
 c_name customerS.No.ame%type;
 c_addr customers.address%type;
 CURSOR c_customers is
 SELECT id, name, address FROM customers;
BEGIN
 OPEN c_customers;
 LOOP
 FETCH c_customers into c_id, c_name, c_addr;
 EXIT WHEN c_customers%notfound;
 dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr);
 END LOOP;
 CLOSE c_customers;
END;
/


 
