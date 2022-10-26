SYNTAX:

CREATE [OR REPLACE] FUNCTION function_name
[(parameter_name [IN | OUT | IN OUT] type [, ...])]
RETURN return_datatype
{IS | AS}
BEGIN
 < function_body >
END [function_name];

EXAMPLE:

CREATE OR REPLACE FUNCTION totalCustomers
RETURN number IS
 total number(2) := 0;
BEGIN
 SELECT count(*) into total
 FROM customers;

 RETURN total;
END;
/

DECLARE
 c number(2);
BEGIN
 c := totalCustomers();
 dbms_output.put_line('Total no. of Customers: ' || c);
END;
/

EXAMPLE :

DECLARE
 a number;
 b number;
 c number;
FUNCTION findMax(x IN number, y IN number)
RETURN number
IS
 z number;
BEGIN
 IF x > y THEN
 z:= x;
 ELSE
 Z:= y;
 END IF;
 RETURN z;
END;

BEGIN
 a:= 23;
 b:= 45;
 c := findMax(a, b);
 dbms_output.put_line(' Maximum of (23,45): ' || c);
END;
/

EXAMPLE FACTORIAL:

DECLARE
 num number;
 factorial number;
FUNCTION fact(x number)
RETURN number
IS
 f number;
 BEGIN
 IF x=0 THEN
 f := 1;
 ELSE
 f := x * fact(x-1);
 END IF;
RETURN f;
END;
BEGIN
 num:= 6;
 factorial := fact(num);
 dbms_output.put_line(' Factorial '|| num || ' is ' || factorial);
END;
/
