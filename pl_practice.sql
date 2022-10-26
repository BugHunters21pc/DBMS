set serveroutput ON;
set autoprint OFF;

VARIABLE v_bind1 varchar2(10);  --bind variable alias to global variable
EXECUTE :v_bind :='hello';


BEGIN
    :v_bind :='admin';
    DBMS_OUTPUT.put_line(:v_bind);
END;
/

DECLARE 
  l_message VARCHAR2(100) := 'My first message through PL/SQL';  --1
  op  INT := 12345; 
  v_1 INT(2) := &a;
  v_2 INT(2) := &b ;
  v_pi CONSTANT FLOAT := 3.141592;  -- assigning constant
BEGIN
  l_message :='Second message';  
  DBMS_OUTPUT.put_line (l_message);
  DBMS_OUTPUT.put_line('Printing message with CONCAT '||op);    --2
  DBMS_OUTPUT.put_line(v_1+v_2);     --2
  DBMS_OUTPUT.put_line(v_pi);
END;
/


DROP TABLE CUSTOMER;
--4th
CREATE TABLE CUSTOMERS( 
   ID   INT NOT NULL, 
   NAME VARCHAR (20) NOT NULL, 
   AGE INT NOT NULL, 
   ADDRESS CHAR (25), 
   SALARY   DECIMAL (18, 2),        
   PRIMARY KEY (ID) 
); 

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 ); 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (3, 'kaushik', 23, 'Kota', 2000.00 ); 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 ); 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 ); 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES (6, 'Komal', 22, 'MP', 4500.00 );

DECLARE 
    v_salary INT ;
    anv_salary customers.salary%type;   --anchored data type
BEGIN 
    SELECT Salary into v_salary from CUSTOMERS where AGE = 27;
    SELECT Salary into anv_salary from CUSTOMERS where AGE = 32;
    DBMS_OUTPUT.put_line ('Salary of Customer with ID = 1 is '||v_salary);
    DBMS_OUTPUT.put_line (anv_salary);
END;
/


--5th

DECLARE         
    v_1 INT :=10;
    v_2 INT :=20;
    v_3 INT :=5;
BEGIN
    IF v_1 < v_3 and v_1 < v_2 THEN
        DBMS_OUTPUT.put_line('The Smallest no is '||v_1);
    END IF;
    IF v_2 <v_1 and v_2 < v_3 THEN
        DBMS_OUTPUT.put_line('The Smallest no is '||v_1);
    END IF;
    IF v_3 <v_1 and v_3 < v_2 THEN
        DBMS_OUTPUT.put_line('The Smallest no is '||v_3);   
    END IF;    
        DBMS_OUTPUT.put_line('good');
END;
/

--6
DECLARE 
    s1 VARCHAR(20) := &string_1;
    s2 VARCHAR(20) := &string_2;
BEGIN
    IF s1 LIKE s2 THEN
        DBMS_OUTPUT.put_line('Both are same string');
    ELSE
        DBMS_OUTPUT.put_line('Both are not same string');
    END IF;
END;
/

drop procedure GREETINGS;


CREATE OR REPLACE PROCEDURE GREETING AS
BEGIN
  dbms_output.put_line('This is a message');
END;
/



drop procedure C;
CREATE OR REPLACE PROCEDURE C as
    c_id country.country_id%type;
    c_name country.country_name%type;
   
BEGIN
    SELECT COUNTRY_ID , COUNTRY_NAME INTO c_id,c_name
    FROM Country
    WHERE c_name  LIKE 'I%';

   
    dbms_output.put_line(c_name);
    end;
    /
    
--findmin with procedure
CREATE OR REPLACE PROCEDURE findmin(x in number,y in number,z out number) is
BEGIN
    IF x<y THEN
        z:= x;
    ELSE
        z:= y;
    END IF;
END;
/

declare 
    a number :=&a;
    b number :=&b;
    c number ;
begin
    findmin(a,b,c);
    dbms_output.put_line('MINIMUM'||c);
end; 







DECLARE
a number;
PROCEDURE squareNum(x IN OUT number) IS
BEGIN
x := x * x;
END;
BEGIN
a:= 23;
squareNum(a);
dbms_output.put_line(' Square of (23): ' || a);
END;




set serveroutput on;

DECLARE 
  nom number;
PROCEDURE squareit( y IN OUT number) IS
BEGIN 
    y := y * y;
END;
BEGIN 
    nom := 15;
    squareit(nom);
    dbms_output.put_line('Answer : '|| nom);
END;



--function

CREATE OR REPLACE FUNCTION AREA_CIRCLE(radius number) 
RETURN number IS
PI constant number(7,3):= 3.141;
area number(7,3);
BEGIN
    area := PI * ( radius * radius );
    return area;
END;
/



BEGIN
    --area = AREA_CIRCLE(12.4);
    dbms_output.put_line(AREA_CIRCLE(22));
END;
/
    


CREATE OR REPLACE FUNCTION FIND_MIN(a in number,b in number)
RETURN number is
    c number;
BEGIN
    IF a > b THEN
        c := b;
        return c;
    ELSE
        c := a;
        return c;
    END IF;
END;
/


BEGIN     
    dbms_output.put_line(FIND_MIN(101,20));
END;
/

DECLARE 
    a number := &num1;
    b number := &num2;
    c number;
BEGIN     
    c := FIND_MIN(a,b);
    dbms_output.put_line(c);
END;
/

--end of function



--function problem

CREATE OR REPLACE FUNCTION NO_CUST
RETURN INT IS
 total number(2) := 0 ;
BEGIN
    SELECT COUNT(*) INTO total FROM CUSTOMERS;
    RETURN total;
    dbms_output.put_line('Total no of Customers is '||total);
END;
/


EXECUTE  FINDMIN(78,77);  --demo

BEGIN
    dbms_output.put_line(NO_CUST());
END;
/





--RECURSEIVE FUNCTION

CREATE OR REPLACE FUNCTION FACTORIAL(f int)
RETURN number IS
    ans number ;
BEGIN
    IF f = 0 THEN
        ans := 1;
    ELSE 
        ans := ans * FACTORIAL(f-1);
    END IF;
    RETURN ans;
END;
/
        

SET SERVEROUTPUT ON;

DECLARE
    num number ;
    f number ;
BEGIN
num:= 6;
f := FACTORIAL(num);
dbms_output.put_line(' Factorial '|| num || ' is ' || f);
END;
/



SELECT EXTRACT(YEAR FROM DATE '1999-11-12') from dual;


DEClARE 
TYPE new_rec IS RECORD(
    v_1 number, 
    v_2 int,
    v_3 varchar(20)
);
 r1 new_rec;

BEGIN
    dbms_output.put_line('User Record Data created');
END;
/




--  USING EXPLICIT CURSOR

SET SERVEROUTPUT ON;
DECLARE 
  v_total number(2);
BEGIN
    UPDATE customers 
    set salary = salary + 500;
    IF sql%notfound THEN 
        dbms_output.put_line('No customers found');
    ELSIF sql%found THEN
        v_total := sql%rowcount;
        dbms_output.put_line('No of Records Updated : '||v_total);
    END IF;
END;
/


--using IMPLICIT CURSORS

DECLARE 
    id BILL.bill_id%type;
    iname BILL.item_name%type;
    code BILL.item_code%type;
    price BILL.price%type;
    
    CURSOR cur_bill is
        SELECT bill_id , item_name, item_code, price from BILL;
        
BEGIN 
    open cur_bill;
    LOOP
        fetch cur_bill into id,iname,code,price;
        EXIT WHEN cur_bill%notfound;    
        dbms_output.put_line( id||' '||iname||' '||code||' '||price );
    END LOOP;
    CLOSE cur_bill;
END;
/

--using parameterized explicit cursor with default parameter

DECLARE
    cur_input number ;
    v_name customers.name%type;
    cursor cur_cust(cur_input number := 11000) is
        SELECT name from customers where salary >= cur_input;
BEGIN
    open cur_cust;
    dbms_output.put_line('Name of customers having salary greater than '||cur_input);
    LOOP 
        fetch cur_cust into v_name;
        exit when cur_cust%notfound;
        dbms_output.put_line('Name : '||v_name);
    END LOOP;
END;
/
    
-- looping cursor
DECLARE
    cur_input number ;
    v_name customers.name%type;
    cursor cur_cust(cur_input number := 5000) is
        SELECT name from customers where salary >= cur_input;
BEGIN
    for idex in cur_cust(8000)
    loop 
        dbms_output.put_line(idex.name);
    END LOOP;
END;
/



--problem sheet answer cursor
DECLARE 
    cursor cur_emp is SELECT employee_id , first_name , salary from employees where departament_id = 50 for update;
    incr number;
BEGIN
    for rec_cur in cur_emp LOOP 
        if rec_cur.salary < 9000 THEN
            incr := 0.2;
        ELSE 
            incr := 0.12;
        END IF;
        UPDATE employees set salary = salary + (salary * incr) WHERE CURRENT OF rec_cur ;
    END LOOP;
END;
/

/*          NOT CORRECT
        
DECLARE
 CURSOR c_dept IS 
  SELECT * 
  FROM departments
  WHERE manager_id IS NOT NULL
  ORDER BY department_name;
  r_dept c_dept%ROWTYPE;
  
        


CURSOR c_emp (c_dept_no departments.department_id%TYPE) IS
  SELECT *  FROM employees
  WHERE department_id = c_dept_no;
  
  r_emp c_emp%ROWTYPE;
    
        

BEGIN
   OPEN c_dept;
   LOOP
     FETCH c_dept INTO r_dept;
      EXIT WHEN c_dept%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('----------------------------------');
      DBMS_OUTPUT.PUT_LINE('Department Name : '||r_dept.department_name);
      DBMS_OUTPUT.PUT_LINE('----------------------------------');
          OPEN c_emp(r_dept.department_id);
           LOOP
            FETCH c_emp INTO r_emp;
             EXIT WHEN c_emp%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE('Employees Details : '||r_emp.employee_id
			||' '||r_emp.first_name||' '||r_emp.last_name||' '||r_emp.salary);
           END LOOP;
          CLOSE c_emp;  
   END LOOP;
   CLOSE c_dept;
END;

 */
        
    
CREATE OR REPLACE PACKAGE package_1 as 
    FUNCTION find_sal(c_id customers.ID%type) RETURN number;
    PROCEDURE add_new(c_id customers.ID%type,c_name customers.name%type,c_age customers.age%type);
END package_1;
/

CREATE OR REPLACE PACKAGE BODY package_1 as
    
        PROCEDURE add_new(c_id customers.ID%type,c_name customers.name%type,c_age customers.age%type) IS
        BEGIN 
            insert into customers (id,name,age) values(c_id,c_name,c_age);
            dbms_output.put_line('Record successfully inserted');
        END add_new;
        
        FUNCTION find_sal(c_id customers.ID%type)
        RETURN number IS
        c_sal customers.salary%type;
        BEGIN 
            select salary into c_sal from customers where id=c_id;
            return c_sal;
        END find_sal;
END package_1;
/

DECLARE
    c_id customers.ID%type := 10;
    c_name customers.name%type :='Malik';
    c_age customers.age%type :=30;
BEGIN
    package_1.add_new(c_id,c_name,c_age);
END;
/

DECLARE
    c_id customers.ID%type := &id;
    ans customers.salary%type;
BEGIN
    ans := package_1.find_sal(c_id);
    dbms_output.put_line('Salary of customer with '||c_id||' is '||ans);
END;
/


select * from customers;
select user from dual;


CREATE OR REPLACE TRIGGER bi_customers
AFTER INSERT ON customers 
FOR EACH ROW
ENABLE
DECLARE
    v_name varchar(15);
BEGIN 
    select user into v_name from dual;
    dbms_output.put_line('You inserted a record - '||v_name);
END;
/


insert into customers (id,name,salary,age,address) values (11,'Kailash',6000,30,'Bihar');

--same trigger
CREATE OR REPLACE TRIGGER bi_customers
BEFORE INSERT OR UPDATE OR DELETE ON customers 
FOR EACH ROW
ENABLE
DECLARE
    v_name varchar(15);
BEGIN 
    select user into v_name from dual;
    dbms_output.put_line('You inserted a record - '||v_name);
END;
/

-- DELETE FROM CUSTOMERS WHERE ID = 11;



select sys_context('ACTION','CURRENT_USER') from dual;
select ora_dict_obj_name from dual;


set serveroutput on;
--EXECEPITON 
DECLARE 
    v_div number :=100;
    v_divisor number := &divison;
    v_ans number;
    ev_zero exception;
BEGIN
    if v_divisor = 0 then 
        raise ev_zero;
    END IF;
    v_ans := v_div / v_divisor ;
    dbms_output.put_line('Result is '||v_ans);
    
    EXCEPTION WHEN ev_zero then 
        dbms_output.put_line('Cannot divide by zero');
END;
/


--- user defined exception 
ACCEPT v_num number PROMPT 'Enter your age : ';
DECLARE
    v_age number(2) := &v_num;
BEGIN 
    if v_age <= 18 THEN
        RAISE_APPLICATION_ERROR(-20008,'YOUR ARE A MINOR, NOT ALLOWRD FOR DRINKS');
    END IF;
    
    dbms_output.put_line('Your above the age requirement ');
    
    EXCEPTION WHEN others then
        dbms_output.put_line(SQLERRM);
END;
/