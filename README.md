# DB
Library Employees Database

We created these diagrams to hold the employee entity and each type of employee possible. They all hold ID (as a primary key), name (first & last), starting work date, birthday and which department/s they work in. They also contain the shifts each employee has with a day (of the week) and time (of day). In addition: the librarian contains the section of the library where s/he works, the preserver contains the specialty in which they work, the manager contains which team s/he is in charge of and the security personal contains the location which s/he guards.

## ERD:
![image](https://github.com/rlwolfe/DB/assets/67902191/054bebb4-78ee-48ef-9dc2-9c262b73f343)

## DSD:
![image](https://github.com/rlwolfe/DB/assets/67902191/ecf20615-1169-4028-bf54-c2be7308fd13)


We used python to generate data, and we filled in the table with 200,000 employees of different types because and then split them into departments and gave them the relevant entity attributes

# ----------- Stage 2 -----------

The pg_dump log file is called backupSQL.log

Queries created and time tracked for them is in the file Queries.sql (and the extra 4 in Constraints.sql)

Indexing was added to:
1. day_of_week in Shift, runtime: 18.205 ms
2. birthdate in Employee, runtime: 225.375 ms
3. start_date in Employee, runtime: 194.777 ms

Then the queries were re-run and new times were added below the previous times.

Constraint was added to ensure that all employees are at least 16 years of age when they started working and to confirm that all shifts are between the hours of 08:00 and 20:00

These constraints created the simple error of telling us that there were rows that didn't follow the constraints, which we fixed in the database and now all the entries are accurate and we enacted the constraints for all future entries.

# ----------- Stage 3 -----------

Additional queries with 2/3 table joins were added to the file joins.sql with their timings below each query

Once the views were created and the queries added they all returned the following:
INSERT 0 1
UPDATE 1
DELETE 1
Query returned successfully in X msec. (166, 64, 51, 49)

No error messages were received

## **** Visualizations ****

### Bar Graph showing all the employees working each day of the week (there are roughly 7,000 per day):
![bar_graph_visualiser-shifts_per_day](https://github.com/user-attachments/assets/a3d334d5-6d1b-459c-b31c-4f5b4b53a0e7)

### Pie Chart showing all employees by department (there are roughly 40,000 in each department):
![pie_chart_visualiser-emp_by_dept](https://github.com/user-attachments/assets/9ab16278-52d1-4d21-9f66-8bb5248a8ca0)

## **** Functions ****
Created and saved in the Functions.sql

output from running the functions:
CREATE FUNCTION
Query returned successfully in 577 msec. (others were also around 500 msec)

# ----------- Stage 4 -----------

## **** Views ****
2 views were created, both returned the following:
CREATE VIEW
Query returned successfully in X msec.
*in the first X = 68 and the second X = 63

One view is for managers and displays all the employees and their salaries and when they are supposed to be paid and if they have been paid yet. The other one is for accounting and it displays all payment statuses for wages.

## **** Queries ****

#### EmployeeWages -
Select (employees paid less than 500) output:
Successfully run. Total query runtime: 535 msec.
80089 rows affected.

Insert (new employee payment) output:
INSERT 0 1
Query returned successfully in 90 msec.

#### PaymentStatus-
Select (employees not yet paid) output:
Successfully run. Total query runtime: 194 msec.
99902 rows affected.

Update (archives employees' payment status to paid) output:
UPDATE 39740
Query returned successfully in 342 msec.

### ERD that was integrated into ours
![image](https://github.com/user-attachments/assets/a14fdb3a-cfb5-4f52-b843-84227bfdefcc)

### Combined ERD:
![image](https://github.com/user-attachments/assets/6aa3ab29-f644-43f8-bf71-b7354de9ced8)

### other group's DSD before integration
![image](https://github.com/user-attachments/assets/7a6bdb48-bb34-476f-8e1c-58ef99c59bcf)

### Combined DSD
![image](https://github.com/user-attachments/assets/bb9c2c1c-dcbd-43a5-af97-94113e59ec88)

