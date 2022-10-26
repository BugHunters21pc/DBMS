IF THEN SYNTAX:

IF condition THEN
 S;
END IF;

EXAMPLE:

IF (a <= 20) THEN
 c:= c+1;
END IF;

DECLARE
 a number(2) := 10;
BEGIN
 a:= 10;
 -- check the boolean condition using if statement
 IF( a < 20 ) THEN
 -- if condition is true then print the following
 dbms_output.put_line('a is less than 20 ' );
 END IF;
 dbms_output.put_line('value of a is : ' || a);
END;
/

DECLARE
 c_id customers.id%type := 1;
 c_sal customers.salary%type;
BEGIN
 SELECT salary
 INTO c_sal
 FROM customers
 WHERE id = c_id;
 IF (c_sal <= 2000) THEN
 UPDATE customers
 SET salary = salary + 1000
 WHERE id = c_id;
 dbms_output.put_line ('Salary updated');
 END IF;
END;
/

IF-THEN-ELSE SYNTAX:

IF condition THEN
 S1;
ELSE
 S2;
END IF;

EXAMPLE:

DECLARE
 a number(3) := 100;
BEGIN
 -- check the boolean condition using if statement
 IF( a < 20 ) THEN
 -- if condition is true then print the following
 dbms_output.put_line('a is less than 20 ' );
 ELSE
 dbms_output.put_line('a is not less than 20 ' );
 END IF;
 dbms_output.put_line('value of a is : ' || a);
END;
/

IF-THEN-ELSIF SYNTAX:

IF(boolean_expression 1)THEN
 S1; -- Executes when the boolean expression 1 is true
ELSIF( boolean_expression 2) THEN
 S2; -- Executes when the boolean expression 2 is true
ELSIF( boolean_expression 3) THEN
 S3; -- Executes when the boolean expression 3 is true
ELSE
 S4; -- executes when the none of the above condition is true
END IF;

EXAMPLE:

DECLARE
 a number(3) := 100;
BEGIN
 IF ( a = 10 ) THEN
  dbms_output.put_line('Value of a is 10' );
 ELSIF ( a = 20 ) THEN
  dbms_output.put_line('Value of a is 20' );
 ELSIF ( a = 30 ) THEN
  dbms_output.put_line('Value of a is 30' );
 ELSE
  dbms_output.put_line('None of the values is matching');
 END IF;
  dbms_output.put_line('Exact value of a is: '|| a );
END;
/

CASE SYNTAX:

CASE selector
 WHEN 'value1' THEN S1;
 WHEN 'value2' THEN S2;
 WHEN 'value3' THEN S3;
 ...
 ELSE Sn; -- default case
END CASE;

EXAMPLE:

DECLARE
 grade char(1) := 'A';
BEGIN
 CASE grade
 when 'A' then dbms_output.put_line('Excellent');
 when 'B' then dbms_output.put_line('Very good');
 when 'C' then dbms_output.put_line('Well done');
 when 'D' then dbms_output.put_line('You passed');
 when 'F' then dbms_output.put_line('Better try again');
 else dbms_output.put_line('No such grade');
 END CASE;
END;
/

SEARCHED CASE SYNTAX:

CASE
 WHEN selector = 'value1' THEN S1;
 WHEN selector = 'value2' THEN S2;
 WHEN selector = 'value3' THEN S3;
 ...
 ELSE Sn; -- default case
END CASE;

EXAMPLE:

DECLARE
 grade char(1) := 'B';
BEGIN
 case
 when grade = 'A' then dbms_output.put_line('Excellent');
 when grade = 'B' then dbms_output.put_line('Very good');
 when grade = 'C' then dbms_output.put_line('Well done');
 when grade = 'D' then dbms_output.put_line('You passed');
 when grade = 'F' then dbms_output.put_line('Better try again');
 else dbms_output.put_line('No such grade');
 end case;
END;
/

NESTED IF THEN ELSE SYNTAX:

IF( boolean_expression 1)THEN
 -- executes when the boolean expression 1 is true
 IF(boolean_expression 2) THEN
 -- executes when the boolean expression 2 is true
 sequence-of-statements;
 END IF;
ELSE
 -- executes when the boolean expression 1 is not true
 else-statements;
END IF;

EXAMPLE:

DECLARE
 a number(3) := 100;
 b number(3) := 200;
BEGIN
 -- check the boolean condition
 IF( a = 100 ) THEN
 -- if condition is true then check the following
 IF( b = 200 ) THEN
 -- if condition is true then print the following
 dbms_output.put_line('Value of a is 100 and b is 200' );
 END IF;
 END IF;
 dbms_output.put_line('Exact value of a is : ' || a );
 dbms_output.put_line('Exact value of b is : ' || b );
END;
/


