SYNTAX:

DECLARE
 <declarations section>
BEGIN
 <executable command(s)>
EXCEPTION
 <exception handling goes here >
 WHEN exception1 THEN
 exception1-handling-statements
 WHEN exception2 THEN
 exception2-handling-statements
 WHEN exception3 THEN
 exception3-handling-statements
 ........
 WHEN others THEN
 exception3-handling-statements
END;

EXAMPLE:

DECLARE
 c_id customers.id%type := 8;
 c_name customerS.No.ame%type;
 c_addr customers.address%type;
BEGIN
 SELECT name, address INTO c_name, c_addr
 FROM customers
 WHERE id = c_id;
 DBMS_OUTPUT.PUT_LINE ('Name: '|| c_name);
 DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);
EXCEPTION
 WHEN no_data_found THEN
 dbms_output.put_line('No such customer!');
 WHEN others THEN
 dbms_output.put_line('Error!');
END;
/

Raising Exceptions:

DECLARE
 exception_name EXCEPTION;
BEGIN
 IF condition THEN
  RAISE exception_name;
 END IF;
EXCEPTION
 WHEN exception_name THEN
 statement;
END;

User-defined Exceptions:

DECLARE
 my-exception EXCEPTION;
 
EXAMPLE:

DECLARE
 c_id customers.id%type := &cc_id;
 c_name customerS.No.ame%type;
 c_addr customers.address%type;
 -- user defined exception
 ex_invalid_id EXCEPTION;
BEGIN
 IF c_id <= 0 THEN
 RAISE ex_invalid_id;
 ELSE
 SELECT name, address INTO c_name, c_addr
 FROM customers
 WHERE id = c_id;
 DBMS_OUTPUT.PUT_LINE ('Name: '|| c_name);
 DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);
 END IF;
EXCEPTION
 WHEN ex_invalid_id THEN
 dbms_output.put_line('ID must be greater than zero!');
 WHEN no_data_found THEN
 dbms_output.put_line('No such customer!');
 WHEN others THEN
 dbms_output.put_line('Error!');
END;
/

Pre-defined Exceptions:

PL/SQL provides many pre-defined exceptions, which are executed when any database
rule is violated by a program. For example, the predefined exception NO_DATA_FOUND is
raised when a SELECT INTO statement returns no rows. The following table lists few of
the important pre-defined exceptions:

FORMAT: EXCEPTION   ORCALE_ERROR  SQL_CODE  DESCRIPTION

ACCESS_INTO_NULL 06530 -6530 It is raised when a null object is
automatically assigned a value.

CASE_NOT_FOUND 06592 -6592
It is raised when none of the
choices in the WHEN clause of a
CASE statement is selected, and
there is no ELSE clause.

COLLECTION_IS_NULL 06531 -6531
It is raised when a program
attempts to apply collection
methods other than EXISTS to an
uninitialized nested table or
varray, or the program attempts
to assign values to the elements of
an uninitialized nested table or
varray.

DUP_VAL_ON_INDEX 00001 -1
It is raised when duplicate values
are attempted to be stored in a
column with unique index.

INVALID_CURSOR 01001 -1001
It is raised when attempts are
made to make a cursor operation
that is not allowed, such as closing
an unopened cursor.

INVALID_NUMBER 01722 -1722
It is raised when the conversion of
a character string into a number
fails because the string does not
represent a valid number.

LOGIN_DENIED 01017 -1017
It is raised when a program
attempts to log on to the database
with an invalid username or
password.

NO_DATA_FOUND 01403 +100 It is raised when a SELECT INTO
statement returns no rows.

NOT_LOGGED_ON 01012 -1012
It is raised when a database call is
issued without being connected to
the database.

PROGRAM_ERROR 06501 -6501 It is raised when PL/SQL has an
internal problem.

ROWTYPE_MISMATCH 06504 -6504
It is raised when a cursor fetches
value in a variable having
incompatible data type.

SELF_IS_NULL 30625 -30625
It is raised when a member
method is invoked, but the
instance of the object type was not
initialized.

STORAGE_ERROR 06500 -6500
It is raised when PL/SQL ran out of
memory or memory was
corrupted.

TOO_MANY_ROWS 01422 -1422
It is raised when a SELECT INTO
statement returns more than one
row.

VALUE_ERROR 06502 -6502
It is raised when an arithmetic,
conversion, truncation, or sizeconstraint error occurs.

ZERO_DIVIDE 01476 1476 It is raised when an attempt is
made to divide a number by zero.
