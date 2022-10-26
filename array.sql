SYNTAX:

CREATE OR REPLACE TYPE varray_type_name IS VARRAY(n) of <element_type>

TYPE varray_type_name IS VARRAY(n) of <element_type>

CREATE Or REPLACE TYPE namearray AS VARRAY(3) OF VARCHAR2(10);
/

EXAMPLE:

TYPE namearray IS VARRAY(5) OF VARCHAR2(10);
Type grades IS VARRAY(5) OF INTEGER;

EXAMPLE:

DECLARE
 type namesarray IS VARRAY(5) OF VARCHAR2(10);
 type grades IS VARRAY(5) OF INTEGER;
 names namesarray;
 marks grades;
 total integer;
BEGIN
 names := namesarray('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz');
 marks:= grades(98, 97, 78, 87, 92);
 total := names.count;
 dbms_output.put_line('Total '|| total || ' Students');
 FOR i in 1 .. total LOOP
 dbms_output.put_line('Student: ' || names(i) || '
 Marks: ' || marks(i));
 END LOOP;
END;
/

EXAMPLE 2:

DECLARE
 CURSOR c_customers is
 SELECT name FROM customers;
 type c_list is varray (6) of customerS.No.ame%type;
 name_list c_list := c_list();
 counter integer :=0;
BEGIN
 FOR n IN c_customers LOOP
 counter := counter + 1;
 name_list.extend;
 name_list(counter) := n.name;
 dbms_output.put_line('Customer('||counter ||'):'||name_list(counter));
 END LOOP;
END;
/


