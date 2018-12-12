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
CREATE TABLE Employee (
	ID int primary key,
	username varchar(255),
	password varchar(255)
);

CREATE TABLE Project (
	ID int primary key,
	name varchar(128),
	managerID int references Employee(ID)
);

CREATE TABLE Time (
	ID int primary key,
	UUID varchar(255),
	startTime varchar(255),
	endTime varchar(255),
	projectID int,
	employeeID int references Employee(ID)
);

ALTER TABLE Time
ADD CONSTRAINT fk_time_proj FOREIGN KEY (projectID)
REFERENCES Project(ID) ON DELETE CASCADE;

-- Allow users to select data from the tables.
GRANT SELECT ON Employee TO PUBLIC;
GRANT SELECT ON Project TO PUBLIC;
GRANT SELECT ON Time TO PUBLIC;

-- Add sample records.
INSERT INTO Employee VALUES (1, 'j1', 'password');
INSERT INTO Employee VALUES (2, 'j2', 'password');
INSERT INTO Employee VALUES (3, 'j3', 'password');
INSERT INTO Employee VALUES (4, 'j4', 'password');
INSERT INTO Employee VALUES (5, 'j5', 'password');

INSERT INTO Project VALUES (1, 'Alpha', 3);
INSERT INTO Project VALUES (2, 'Beta', 3);
INSERT INTO Project VALUES (3, 'Gamma', 5);
INSERT INTO Project VALUES (4, 'Zeta', 5);

INSERT INTO Time VALUES (1, 'test uuid', '2018-10-25-10-23-54', 
			     '2018-10-25-12-23-54', 2, 1);
INSERT INTO Time VALUES (2, 'another uuid', '2018-10-25-10-23-54', 
			     '2018-10-25-12-23-54', 1, 1);
INSERT INTO Time VALUES (3, 'idk what to put', '2018-10-25-10-23-54', 
			     '2018-10-25-12-23-54', 4, 1);
INSERT INTO Time VALUES (4, 'out of ideas', '2018-10-25-13-23-54', 
			     '2018-10-25-15-23-54', 2, 1);

