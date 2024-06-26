--
-- Target: PostgreSQL 
-- Syntax: psql \i filename
-- 
-- Date  : May 24 2024 15:01
-- Script Generated by Database Design Studio 2.21.3 
--

--
-- Drop Table    : 'Works'   
--
DROP TABLE if EXISTS "Works";

--
-- Drop Table    : 'Security'   
--
DROP TABLE if EXISTS "Security";

--
-- Drop Table    : 'Manager'   
--
DROP TABLE if EXISTS "Manager";

--
-- Drop Table    : 'Secratary'   
--
DROP TABLE if EXISTS "Secratary";

--
-- Drop Table    : 'Preserver'   
--
DROP TABLE if EXISTS "Preserver";

--
-- Drop Table    : 'Librarian'   
--
DROP TABLE if EXISTS "Librarian";

--
-- Drop Table    : 'Shift'   
--
DROP TABLE if EXISTS "Shift";

--
-- Drop Table    : 'Employee'   
--
DROP TABLE if EXISTS "Employee";

DROP TYPE IF EXISTS dept;
DROP TYPE IF EXISTS team;
DROP TYPE IF EXISTS days;
DROP TYPE IF EXISTS genre;
DROP TYPE IF EXISTS specialty;
DROP TYPE IF EXISTS post;

DROP SEQUENCE seq_Employee_EmpID;
