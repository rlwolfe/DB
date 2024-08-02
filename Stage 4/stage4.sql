--
-- Target: PostgreSQL 
-- Syntax: psql \i filename
-- 
-- Date  : Aug 01 2024 17:29
-- Script Generated by Database Design Studio 2.21.3 
--




--
-- Create Table    : 'Shift'   
-- day_of_week     :  
-- timeslot        :  
--
CREATE TABLE Shift (
    day_of_week    DAYS('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday') NOT NULL,
    timeslot       INTERVAL NOT NULL,
CONSTRAINT pk_Shift PRIMARY KEY (day_of_week,timeslot));


--
-- Create Table    : 'People'   
-- ID              :  
--
CREATE SEQUENCE seq_People_ID
    INCREMENT 1
    START 1;

CREATE TABLE People (
    ID             INTEGER DEFAULT NEXTVAL('seq_People_ID') NOT NULL,
CONSTRAINT pk_People PRIMARY KEY (ID));


--
-- Create Table    : 'Wages'   
-- ID              :  
-- JOB_ID          :  
-- wage            :  
--
CREATE SEQUENCE seq_Wages_ID
    INCREMENT 1
    START 1;

CREATE TABLE Wages (
    ID             INTEGER DEFAULT NEXTVAL('seq_Wages_ID') NOT NULL,
    JOB_ID         INTEGER NOT NULL,
    wage           INTEGER NOT NULL,
CONSTRAINT pk_Wages PRIMARY KEY (ID));


--
-- Create Table    : 'Employee'   
-- ID              :  (references People.ID)
-- EmpID           :  
-- name            :  
-- start_date      :  
-- birthdate       :  
-- department      : dept/team 
--
CREATE SEQUENCE seq_Employee_EmpID
    INCREMENT 1
    START 1;

CREATE TABLE Employee (
    ID             INTEGER NOT NULL,
    EmpID          INTEGER DEFAULT NEXTVAL('seq_Employee_EmpID') NOT NULL,
    name           VARCHAR NOT NULL,
    start_date     DATE NOT NULL,
    birthdate      DATE NOT NULL,
    department     DEPT/TEAM('Library', 'Desk', 'Archives', 'Management', 'Security') NOT NULL,
CONSTRAINT pk_Employee PRIMARY KEY (ID,EmpID),
CONSTRAINT fk_Employee FOREIGN KEY (ID)
    REFERENCES People (ID)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


--
-- Create Table    : 'Librarian'   
-- EmpID           :  (references Employee.EmpID)
-- ID              :  (references Employee.ID)
-- specialty       : genres 
--
CREATE TABLE Librarian (
    EmpID          INTEGER NOT NULL,
    ID             INTEGER NOT NULL,
    specialty      GENRE('children', 'mystery', 'fantasy', 'romance', 'science fiction', 'thriller', 'historical fiction', 'biography', 'self-help', 'cookbook') NOT NULL,
CONSTRAINT pk_Librarian PRIMARY KEY (EmpID,ID),
CONSTRAINT fk_Librarian FOREIGN KEY (ID,EmpID)
    REFERENCES Employee (ID,EmpID)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


--
-- Create Table    : 'Preserver'   
-- EmpID           :  (references Employee.EmpID)
-- ID              :  (references Employee.ID)
-- specialty       : genres 
--
CREATE TABLE Preserver (
    EmpID          INTEGER NOT NULL,
    ID             INTEGER NOT NULL,
    specialty      GENRE('children', 'mystery', 'fantasy', 'romance', 'science fiction', 'thriller', 'historical fiction', 'biography') NOT NULL,
CONSTRAINT pk_Preserver PRIMARY KEY (EmpID,ID),
CONSTRAINT fk_Preserver FOREIGN KEY (ID,EmpID)
    REFERENCES Employee (ID,EmpID)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


--
-- Create Table    : 'Secratary'   
-- EmpID           :  (references Employee.EmpID)
-- ID              :  (references Employee.ID)
--
CREATE TABLE Secratary (
    EmpID          INTEGER NOT NULL,
    ID             INTEGER NOT NULL,
CONSTRAINT pk_Secratary PRIMARY KEY (EmpID,ID),
CONSTRAINT fk_Secratary FOREIGN KEY (ID,EmpID)
    REFERENCES Employee (ID,EmpID)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


--
-- Create Table    : 'Manager'   
-- EmpID           :  (references Employee.EmpID)
-- ID              :  (references Employee.ID)
-- team            : dept/team 
--
CREATE TABLE Manager (
    EmpID          INTEGER NOT NULL,
    ID             INTEGER NOT NULL,
    team           DEPT/TEAM('Library', 'Desk', 'Archives', 'Security') NOT NULL,
CONSTRAINT pk_Manager PRIMARY KEY (EmpID,ID),
CONSTRAINT fk_Manager FOREIGN KEY (ID,EmpID)
    REFERENCES Employee (ID,EmpID)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


--
-- Create Table    : 'Security'   
-- EmpID           :  (references Employee.EmpID)
-- ID              :  (references Employee.ID)
-- location        : guard posts 
--
CREATE TABLE Security (
    EmpID          INTEGER NOT NULL,
    ID             INTEGER NOT NULL,
    location       POSTS('Front door', 'Back door', 'Side door', 'Main floor', 'Archives') NOT NULL,
CONSTRAINT pk_Security PRIMARY KEY (EmpID,ID),
CONSTRAINT fk_Security FOREIGN KEY (ID,EmpID)
    REFERENCES Employee (ID,EmpID)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


--
-- Create Table    : 'Works'   
-- EmpID           :  (references Employee.EmpID)
-- day_of_week     :  (references Shift.day_of_week)
-- timeslot        :  (references Shift.timeslot)
-- ID              :  (references Employee.ID)
--
CREATE TABLE Works (
    EmpID          INTEGER NOT NULL,
    day_of_week    DAYS('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday') NOT NULL,
    timeslot       INTERVAL NOT NULL,
    ID             INTEGER NOT NULL,
CONSTRAINT pk_Works PRIMARY KEY (EmpID,day_of_week,timeslot,ID),
CONSTRAINT fk_Works FOREIGN KEY (ID,EmpID)
    REFERENCES Employee (ID,EmpID)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
CONSTRAINT fk_Works2 FOREIGN KEY (day_of_week,timeslot)
    REFERENCES Shift (day_of_week,timeslot)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE CASCADE);


--
-- Create Table    : 'Payments'   
-- ID              :  (references Wages.ID)
-- ID1             :  (references Employee.ID)
-- EmpID           :  (references Employee.EmpID)
-- Cashflow_ID     :  
-- Date_paid       :  
-- Status          :  
--
CREATE SEQUENCE seq_Payments_Cashflow_ID
    INCREMENT 1
    START 1;

CREATE TABLE Payments (
    ID             INTEGER NOT NULL,
    ID1            INTEGER NOT NULL,
    EmpID          INTEGER NOT NULL,
    Cashflow_ID    INTEGER DEFAULT NEXTVAL('seq_Payments_Cashflow_ID') NOT NULL,
    Date_paid      DATE NOT NULL,
    Status         BOOL NOT NULL,
CONSTRAINT pk_Payments PRIMARY KEY (ID,ID1,EmpID,Cashflow_ID),
CONSTRAINT fk_Payments FOREIGN KEY (ID)
    REFERENCES Wages (ID)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT fk_Payments2 FOREIGN KEY (ID1,EmpID)
    REFERENCES Employee (ID,EmpID)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


--
-- Permissions for: 'public'
--
GRANT ALL ON Shift TO GROUP public;
GRANT ALL ON People TO GROUP public;
GRANT ALL ON Wages TO GROUP public;
GRANT ALL ON Employee TO GROUP public;
GRANT ALL ON Librarian TO GROUP public;
GRANT ALL ON Preserver TO GROUP public;
GRANT ALL ON Secratary TO GROUP public;
GRANT ALL ON Manager TO GROUP public;
GRANT ALL ON Security TO GROUP public;
GRANT ALL ON Works TO GROUP public;
GRANT ALL ON Payments TO GROUP public;
