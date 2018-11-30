--
-- This SQL script builds a database, deleting any pre-existing version.
--
-- @author tjv37
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS Times;
DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Employees;

-- Create the schema.
CREATE TABLE Employees (
	ID int primary key,
	name varchar(128)
);

CREATE TABLE Projects (
	ID int primary key,
	name varchar(128),
	managerID int references Employees(ID)
);

CREATE TABLE Times (
	ID int primary key,
	startTime timestamp,
	endTime timestamp,
	employeeID int references Employees(ID),
	projectID int references Projects(ID)
);
	

-- Allow users to select data from the tables.
GRANT SELECT ON Employees TO PUBLIC;
GRANT SELECT ON Projects TO PUBLIC;
GRANT SELECT ON Times TO PUBLIC;

-- Add sample records.
INSERT INTO Employee VALUES (1, 'Joe');
INSERT INTO Employee VALUES (2, 'John');
INSERT INTO Employee VALUES (3, 'Jay');
INSERT INTO Employee VALUES (4, 'Jordan');
INSERT INTO Employee VALUES (5, 'Joe');

INSERT INTO Project VALUES (1, 'Alpha', 3);
INSERT INTO Project VALUES (2, 'Beta', 3);
INSERT INTO Project VALUES (3, 'Gamma', 5);
INSERT INTO Project VALUES (4, 'Zeta', 5);

INSERT INTO Time VALUES (1, '2018-10-25 10:23:54', 
			     '2018-10-25 12:23:54', 2, 1);
INSERT INTO Time VALUES (2, '2018-10-25 10:23:54', 
			     '2018-10-25 12:23:54', 1, 1);
INSERT INTO Time VALUES (3, '2018-10-25 10:23:54', 
			     '2018-10-25 12:23:54', 4, 1);
INSERT INTO Time VALUES (4, '2018-10-25 13:23:54', 
			     '2018-10-25 15:23:54', 2, 1);

