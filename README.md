# DB
Library Employees Database

We created these diagrams to hold the employee entity and each type of employee possible. They all hold ID (as a primary key), name (first & last), starting work date, birthday and which department/s they work in. They also contain the shifts each employee has with a day (of the week) and time (of day). In addition: the librarian contains the section of the library where s/he works, the preserver contains the specialty in which they work, the manager contains which team s/he is in charge of and the security personal contains the location which s/he guards.

ERD:
![image](https://github.com/rlwolfe/DB/assets/67902191/054bebb4-78ee-48ef-9dc2-9c262b73f343)

DSD:
![image](https://github.com/rlwolfe/DB/assets/67902191/ecf20615-1169-4028-bf54-c2be7308fd13)


We used python to generate data, and we filled in the table with 200,000 employees of different types because and then split them into departments and gave them the relevant entity attributes

The pg_dump log file is called backupSQL.log
