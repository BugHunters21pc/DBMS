SYNTAX:

CREATE [OR REPLACE] PROCEDURE procedure_name
[(parameter_name [IN | OUT | IN OUT] type [, ...])]
{IS | AS}
BEGIN
 < procedure_body >
END procedure_name;

EXAMPLE:

CREATE OR REPLACE PROCEDURE greetings
AS
BEGIN
 dbms_output.put_line('Hello World!');
END;
/

EXECUTE greetings;

BEGIN
 greetings;
END;
/

DROP PROCEDURE procedure-name;

DROP PROCEDURE greetings;

EXAMPLE: PROCEDURE USING PL/SQL

DECLARE
 a number;
 b number;
 c number;
PROCEDURE findMin(x IN number, y IN number, z OUT number) IS
BEGIN
 IF x < y THEN
 z:= x;
 ELSE
 z:= y;
 END IF;
END;
BEGIN
 a:= 23;
 b:= 45;
 findMin(a, b, c);
 dbms_output.put_line(' Minimum of (23, 45) : ' || c);
END;
/

