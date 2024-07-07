# DB
Library Employees Database

We created these diagrams to hold the employee entity and each type of employee possible. They all hold ID (as a primary key), name (first & last), starting work date, birthday and which department/s they work in. They also contain the shifts each employee has with a day (of the week) and time (of day). In addition: the librarian contains the section of the library where s/he works, the preserver contains the specialty in which they work, the manager contains which team s/he is in charge of and the security personal contains the location which s/he guards.

ERD:
![image](https://github.com/rlwolfe/DB/assets/67902191/054bebb4-78ee-48ef-9dc2-9c262b73f343)

DSD:
![image](https://github.com/rlwolfe/DB/assets/67902191/ecf20615-1169-4028-bf54-c2be7308fd13)


We used python to generate data, and we filled in the table with 200,000 employees of different types because and then split them into departments and gave them the relevant entity attributes

The pg_dump log file is called backupSQL.log

Queries created and time tracked for them is in the file Queries.sql (and the extra 4 in Constraints.sql)

Indexing was added to:
1. day_of_week in Shift, runtime: 18.205 ms
2. birthdate in Employee, runtime: 225.375 ms
3. start_date in Employee, runtime: 194.777 ms

Then the queries were re-run and new times were added below the previous times.

Constraint was added to ensure that all employees are at least 16 years of age when they started working and to confirm that all shifts are between the hours of 08:00 and 20:00

These constraints created the simple error of telling us that there were rows that didn't follow the constraints, which we fixed in the database and now all the entries are accurate and we enacted the constraints for all future entries.
