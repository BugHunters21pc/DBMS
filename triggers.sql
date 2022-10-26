SYNTAX:

CREATE [OR REPLACE ] TRIGGER trigger_name
{BEFORE | AFTER | INSTEAD OF }
{INSERT [OR] | UPDATE [OR] | DELETE}
[OF col_name]
ON table_name
[REFERENCING OLD AS o NEW AS n]
[FOR EACH ROW]
WHEN (condition)
DECLARE
 Declaration-statements
 BEGIN
 Executable-statements
EXCEPTION
 Exception-handling-statements
END;

EXAMPLE:

CREATE OR REPLACE TRIGGER display_salary_changes
BEFORE DELETE OR INSERT OR UPDATE ON customers
FOR EACH ROW
WHEN (NEW.ID > 0)
DECLARE
 sal_diff number;
BEGIN
 sal_diff := :NEW.salary - :OLD.salary;
 dbms_output.put_line('Old salary: ' || :OLD.salary);
 dbms_output.put_line('New salary: ' || :NEW.salary);
 dbms_output.put_line('Salary difference: ' || sal_diff);
END;
/


