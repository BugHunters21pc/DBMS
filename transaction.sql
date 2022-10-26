For example:

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (7, 'Rajnish', 27, 'HP', 9500.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (8, 'Riddhi', 21, 'WB', 4500.00 );
SAVEPOINT sav1;
UPDATE CUSTOMERS
SET SALARY = SALARY + 1000;
ROLLBACK TO sav1;
UPDATE CUSTOMERS
SET SALARY = SALARY + 1000
WHERE ID = 7;
UPDATE CUSTOMERS
SET SALARY = SALARY + 1000
WHERE ID = 8;
COMMIT;

Automatic Transaction Control

To execute a COMMIT automatically whenever an INSERT, UPDATE or DELETE
command is executed, you can set the AUTOCOMMIT environment variable as:

SET AUTOCOMMIT ON;

You can turn-off the auto commit mode using the following command:
SET AUTOCOMMIT OFF;
