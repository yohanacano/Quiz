CREATE TABLE EMPLOYEES(
ID NUMBER(*,0) PRIMARY KEY,
DATE_OF_JOINING DATE NOT NULL,
FULL_NAME VARCHAR2(255 BYTE) NOT NULL,
MANAGER_ID NUMBER(*,0) CONSTRAINT FK_MANAGER REFERENCES EMPLOYEES(ID)
);

CREATE TABLE PROJECTS(
ID NUMBER(*,0) PRIMARY KEY,
CODE VARCHAR2(255 BYTE) NOT NULL,
BUDGET NUMBER(10,2) NOT NULL,
DATE_OF_BEGINNING DATE,
DATE_OF_ENDING DATE,
MANAGER_ID NUMBER(*,0) CONSTRAINT FK_MANAGER_PROJEC REFERENCES EMPLOYEES(ID)
);

CREATE TABLE SALARIES(
ID NUMBER(*,0) PRIMARY KEY,
SALARY NUMBER(10,2) NOT NULL CONSTRAINT CHK_GREATER CHECK (SALARY>1000),
EMPLOYEE_ID NUMBER(*,0) NOT NULL CONSTRAINT FK_SALARY_EMPLOYEE REFERENCES EMPLOYEES(ID),
PROJECT_ID NUMBER(*,0) CONSTRAINT FK_SALARY_PROJECT REFERENCES PROJECTS(ID) 
);

--Write a SQL query to fetch project code and count of employees (code, employees_count) sorted by employees_count in descending order. example 48205501099, 4
SELECT PR.CODE AS código, EM.FULL_NAME AS employees_count
FROM SALARIES SA
JOIN EMPLOYEES EM ON EM.ID=SA.EMPLOYEE_ID
JOIN PROJECTS PR ON PR.ID=SA.PROJECT_ID
WHERE PR.CODE='48205501099';

--Write a query to fetch employee names and their salaries records order by salary asc. Return employee details even if he/she is not assigned to any project
SELECT EM.FULL_NAME FROM SALARIES SA
JOIN EMPLOYEES EM ON EM.ID=SA.EMPLOYEE_ID
ORDER BY SA.SALARY ASC;

--Write a SQL query to fetch all the Employees who are also managers from employees table

--Write a SQL query to fetch each employee with the name of his/her boss in one column named "employee_boss" separated by ' - ' (don't forget the spaces). Example: "Drew Rosario - Holmes Manning", "Emery Kelley - Holmes Manning" (employee name - manager name)

--Write a SQL query to fetch all the employees which first name starts with O (uppercase) (Orlando, Ovidio)
SELECT * FROM EMPLOYEES
WHERE FULL_NAME LIKE 'O%';

--
