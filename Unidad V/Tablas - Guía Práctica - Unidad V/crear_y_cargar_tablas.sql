CREATE DATABASE IF NOT EXISTS tp_unidad_v;
USE tp_unidad_v;

-- TABLE: aircraft
CREATE TABLE aircraft (
    aid INT NOT NULL,
    aname VARCHAR(255),
    crusingrange INT,
    PRIMARY KEY (aid)
) ENGINE=InnoDB;

-- TABLE: flights
CREATE TABLE flights (
    flno INT NOT NULL,
    origin VARCHAR(255),
    destination VARCHAR(255),
    distance INT,
    departs TIMESTAMP,
    arrives TIMESTAMP,
    price DECIMAL(10,2),
    PRIMARY KEY (flno)
) ENGINE=InnoDB;

-- TABLE: employees
CREATE TABLE employees (
    eid INT NOT NULL,
    ename VARCHAR(255),
    salary INT,
    PRIMARY KEY (eid)
) ENGINE=InnoDB;

-- TABLE: certified
CREATE TABLE certified (
    eid INT NOT NULL,
    aid INT NOT NULL,
    PRIMARY KEY (eid, aid)
) ENGINE=InnoDB;

-- TABLE: parts
CREATE TABLE parts (
    pid INT NOT NULL,
    pname VARCHAR(255),
    color VARCHAR(255),
    PRIMARY KEY (pid)
) ENGINE=InnoDB;

-- TABLE: suppliers
CREATE TABLE suppliers (
    sid INT NOT NULL,
    sname VARCHAR(255),
    address VARCHAR(255),
    PRIMARY KEY (sid)
) ENGINE=InnoDB;

-- TABLE: catalog
CREATE TABLE catalog (
    sid INT NOT NULL,
    pid INT NOT NULL,
    cost DECIMAL(10,2),
    PRIMARY KEY (sid, pid)
) ENGINE=InnoDB;

-- TABLE: class
CREATE TABLE class (
    name VARCHAR(255) NOT NULL,
    meets_at VARCHAR(255),
    room VARCHAR(255),
    fid INT,
    PRIMARY KEY (name)
) ENGINE=InnoDB;

-- TABLE: enrolled
CREATE TABLE enrolled (
    snum INT NOT NULL,
    cname VARCHAR(255) NOT NULL,
    PRIMARY KEY (snum, cname)
) ENGINE=InnoDB;

-- TABLE: student
CREATE TABLE student (
    snum INT NOT NULL,
    sname VARCHAR(255),
    major VARCHAR(255),
    standing VARCHAR(2),
    age INT,
    PRIMARY KEY (snum)
) ENGINE=InnoDB;

-- TABLE: faculty
CREATE TABLE faculty (
    fid INT NOT NULL,
    fname VARCHAR(255),
    deptid INT,
    PRIMARY KEY (fid)
) ENGINE=InnoDB;

-- TABLE: dept
CREATE TABLE dept (
    did INT NOT NULL,
    dname VARCHAR(255),
    budget DECIMAL(10,2),
    managerid INT,
    PRIMARY KEY (did)
) ENGINE=InnoDB;

-- TABLE: emp
CREATE TABLE emp (
    eid INT NOT NULL,
    ename VARCHAR(255),
    age INT,
    salary INT,
    PRIMARY KEY (eid)
) ENGINE=InnoDB;

-- TABLE: works
CREATE TABLE works (
    eid INT NOT NULL,
    did INT NOT NULL,
    pct_time INT,
    PRIMARY KEY (eid, did)
) ENGINE=InnoDB;

-- TABLE: sailors
CREATE TABLE sailors (
    sid VARCHAR(255) NOT NULL,
    sname VARCHAR(255),
    rating VARCHAR(255),
    age VARCHAR(255),
    PRIMARY KEY (sid)
) ENGINE=InnoDB;

INSERT INTO aircraft (aid, aname, crusingrange) VALUES 
(1, 'Boeing 747-400', 8430),
(2, 'Boeing 737-800', 3383),
(3, 'Airbus A340-300', 7120),
(4, 'British Aerospace Jetstream 41', 1502),
(5, 'Embraer ERJ-145', 1530),
(6, 'SAAB 340', 2128),
(7, 'Piper Archer III', 520),
(8, 'Tupolev 154', 4103),
(16, 'Schwitzer 2-33', 30),
(9, 'Lockheed L1011', 6900),
(10, 'Boeing 757-300', 4010),
(11, 'Boeing 777-300', 6441),
(12, 'Boeing 767-400ER', 6475),
(13, 'Airbus A320', 2605),
(14, 'Airbus A319', 1805),
(15, 'Boeing 727', 1504);

INSERT INTO catalog (sid, pid, cost) VALUES 
(1, 3, 0.50),
(1, 4, 0.50),
(1, 8, 11.70),
(2, 3, 0.55),
(2, 8, 7.95),
(2, 1, 16.50),
(3, 8, 12.50),
(3, 9, 1.00),
(4, 5, 2.20),
(4, 6, 1247548.23),
(4, 7, 1247548.23);

INSERT INTO certified (eid, aid) VALUES 
(567354612, 1),
(567354612, 2),
(567354612, 10),
(567354612, 11),
(567354612, 12),
(567354612, 15),
(567354612, 7),
(567354612, 9),
(567354612, 3),
(567354612, 4),
(567354612, 5),
(552455318, 2),
(552455318, 14),
(550156548, 1),
(550156548, 12),
(390487451, 3),
(390487451, 13),
(390487451, 14),
(274878974, 10),
(274878974, 12),
(355548984, 8),
(355548984, 9),
(310454876, 8),
(310454876, 9),
(548977562, 7),
(142519864, 1),
(142519864, 11),
(142519864, 12),
(142519864, 10),
(142519864, 3),
(142519864, 2),
(142519864, 13),
(142519864, 7),
(269734834, 1),
(269734834, 2),
(269734834, 3),
(269734834, 4),
(269734834, 5),
(269734834, 6),
(269734834, 7),
(269734834, 8),
(269734834, 9),
(269734834, 10),
(269734834, 11),
(269734834, 12),
(269734834, 13),
(269734834, 14),
(269734834, 15),
(552455318, 7),
(556784565, 5),
(556784565, 2),
(556784565, 3),
(573284895, 3),
(573284895, 4),
(573284895, 5),
(574489456, 8),
(574489456, 6),
(574489457, 7),
(242518965, 2),
(242518965, 10),
(141582651, 2),
(141582651, 10),
(141582651, 12),
(011564812, 2),
(011564812, 10),
(356187925, 6),
(159542516, 5),
(159542516, 7),
(090873519, 6);

INSERT INTO class (name, meets_at, room, fid) VALUES 
('Data Structures', 'MWF 10', 'R128', 489456522),
('Database Systems', 'MWF 12:30-1:45', '1320 DCL', 142519864),
('Operating System Design', 'TuTh 12-1:20', '20 AVW', 489456522),
('Archaeology of the Incas', 'MWF 3-4:15', 'R128', 248965255),
('Aviation Accident Investigation', 'TuTh 1-2:50', 'Q3', 011564812),
('Air Quality Engineering', 'TuTh 10:30-11:45', 'R15', 011564812),
('Introductory Latin', 'MWF 3-4:15', 'R12', 248965255),
('American Political Parties', 'TuTh 2-3:15', '20 AVW', 619023588),
('Social Cognition', 'Tu 6:30-8:40', 'R15', 159542516),
('Perception', 'MTuWTh 3', 'Q3', 489221823),
('Multivariate Analysis', 'TuTh 2-3:15', 'R15', 90873519),
('Patent Law', 'F 1-2:50', 'R128', 090873519),
('Urban Economics', 'MWF 11', '20 AVW', 489221823),
('Organic Chemistry', 'TuTh 12:30-1:45', 'R12', 489221823),
('Marketing Research', 'MW 10-11:15', '1320 DCL', 489221823),
('Seminar in American Art', 'M 4', 'R15', 489221823),
('Orbital Mechanics', 'MWF 8', '1320 DCL', 011564812),
('Dairy Herd Management', 'TuTh 12:30-1:45', 'R128', 356187925),
('Communication Networks', 'MW 9:30-10:45', '20 AVW', 141582651),
('Optical Electronics', 'TuTh 12:30-1:45', 'R15', 254099823),
('Intoduction to Math', 'TuTh 8-9:30', 'R128', 489221823);

INSERT INTO dept (did, dname, budget, managerid) VALUES 
(1, 'Hardware', 1048572.12, 141582651),
(2, 'Operations', 12099101.00, 287321212),
(3, 'Legal', 222988.13, 248965255),
(4, 'Marketing', 538099.54, 548977562),
(5, 'Software', 400011.12, 141582651),
(6, 'Production', 12099101.00, 578875478),
(7, 'Shipping', 5.00, 489456522);

INSERT INTO emp (eid, ename, age, salary) VALUES 
(142519864, 'Susan Martin', 39, 56990),
(242518965, 'James Smith', 68, 27099),
(141582651, 'Mary Johnson', 44, 94011),
(011564812, 'John Williams', 35, 74098),
(254099823, 'Patricia Jones', 28, 42783),
(356187925, 'Robert Brown', 28, 35431),
(489456522, 'Linda Davis', 26, 25971),
(287321212, 'Michael Miller', 62, 131072),
(248965255, 'Barbara Wilson', 48, 95021),
(159542516, 'Matt Nelson', 33, 48990),
(090873519, 'Elizabeth Taylor', 27, 33055),
(486512566, 'David Anderson', 20, 25199),
(619023588, 'Jennifer Thomas', 24, 34654),
(112348546, 'Joseph Thompson', 26, 24998),
(115987938, 'Christopher Garcia', 60, 24998),
(132977562, 'Angela Martinez', 31, 24998),
(269734834, 'Rick Carter', 38, 24998),
(280158572, 'Margaret Clark', 40, 24998),
(301221823, 'Juan Rodriguez', 30, 32175),
(318548912, 'Ann Mitchell', 23, 32175),
(320874981, 'Daniel Lee', 23, 32175),
(322654189, 'Lisa Walker', 38, 32175),
(348121549, 'Trey Phillips', 69, 32175),
(351565322, 'Nancy Allen', 30, 39910),
(451519864, 'Mark Young', 34, 39910),
(455798411, 'Luis Hernandez', 44, 39910),
(550156548, 'George Wright', 42, 41008),
(552455318, 'Ana Lopez', 35, 41008),
(556784565, 'Kenneth Hill', 81, 41008),
(567354612, 'Karen Scott', 70, 39910),
(573284895, 'Steven Green', 29, 39910),
(574489456, 'Betty Adams', 39, 39910),
(015645489, 'Daniel Evans', 25, 40312),
(015487874, 'Gene Edwards', 51, 41008),
(054879887, 'Dorthy Lewis', 33, 41008),
(098784544, 'Eric Collins', 23, 41008),
(074454898, 'Scott Bell', 23, 70100),
(156489494, 'Gil Richardson', 32, 70100),
(179887498, 'Dorthy Howard', 28, 40312),
(156465461, 'Eric Cooper', 26, 24998),
(128778823, 'William Ward', 33, 24998),
(178949844, 'Chad Stewart', 29, 24998),
(298489484, 'Lisa Gray', 31, 24998),
(274878974, 'Harry Watson', 30, 24998),
(267894232, 'Paul Hall', 25, 24998),
(254898318, 'Gim Rogers', 25, 32175),
(489221823, 'Richard Jackson', 33, 32996),
(548977562, 'Donald King', 43, 92048),
(289562686, 'Thomas Robinson', 34, 32175),
(291795563, 'Haywood Kelly', 36, 32175),
(578875478, 'Edward Baker', 50, 101071),
(051135593, 'Maria White', 22, 24998),
(060839453, 'Charles Harris', 24, 24998),
(334568786, 'William Moore', 32, 32175),
(355548984, 'Tom Murphy', 41, 32175),
(310454876, 'Milo Brooks', 22, 39910),
(390487451, 'Mark Coleman', 42, 39910),
(454565232, 'Louis Jenkins', 20, 39910),
(141582657, 'Stanley Browne', 23, 14093);

INSERT INTO employees (eid, ename, salary) VALUES 
(242518965, 'James Smith', 120433),
(141582651, 'Mary Johnson', 178345),
(011564812, 'John Williams', 153972),
(567354612, 'Lisa Walker', 256481),
(552455318, 'Larry West', 101745),
(550156548, 'Karen Scott', 205187),
(390487451, 'Lawrence Sperry', 212156),
(274878974, 'Michael Miller', 99890),
(254099823, 'Patricia Jones', 24450),
(356187925, 'Robert Brown', 44740),
(355548984, 'Angela Martinez', 212156),
(310454876, 'Joseph Thompson', 212156),
(489456522, 'Linda Davis', 127984),
(489221823, 'Richard Jackson', 23980),
(548977562, 'William Ward', 84476),
(310454877, 'Chad Stewart', 33546),
(142519864, 'Betty Adams', 227489),
(269734834, 'George Wright', 289950),
(287321212, 'Michael Miller', 48090),
(552455348, 'Dorthy Lewis', 92013),
(248965255, 'Barbara Wilson', 43723),
(159542516, 'William Moore', 48250),
(348121549, 'Haywood Kelly', 32899),
(090873519, 'Elizabeth Taylor', 32021),
(486512566, 'David Anderson', 743001),
(619023588, 'Jennifer Thomas', 54921),
(015645489, 'Donald King', 18050),
(556784565, 'Mark Young', 205187),
(573284895, 'Eric Cooper', 114323),
(574489456, 'William Jones', 105743),
(574489457, 'Milo Brooks', 20);

INSERT INTO enrolled (snum, cname) VALUES 
(112348546, 'Database Systems'),
(115987938, 'Database Systems'),
(348121549, 'Database Systems'),
(322654189, 'Database Systems'),
(552455318, 'Database Systems'),
(455798411, 'Operating System Design'),
(552455318, 'Operating System Design'),
(567354612, 'Operating System Design'),
(112348546, 'Operating System Design'),
(115987938, 'Operating System Design'),
(322654189, 'Operating System Design'),
(567354612, 'Data Structures'),
(552455318, 'Communication Networks'),
(455798411, 'Optical Electronics'),
(301221823, 'Perception'),
(301221823, 'Social Cognition'),
(301221823, 'American Political Parties'),
(556784565, 'Air Quality Engineering'),
(099354543, 'Patent Law'),
(574489456, 'Urban Economics');

-- Script para insertar datos en la tabla faculty
INSERT INTO faculty (fid, fname, deptid) VALUES
(142519864, 'Ivana Teach', 20),
(242518965, 'James Smith', 68),
(141582651, 'Mary Johnson', 20),
(011564812, 'John Williams', 68),
(254099823, 'Patricia Jones', 68),
(356187925, 'Robert Brown', 12),
(489456522, 'Linda Davis', 20),
(287321212, 'Michael Miller', 12),
(248965255, 'Barbara Wilson', 12),
(159542516, 'William Moore', 33),
(090873519, 'Elizabeth Taylor', 11),
(486512566, 'David Anderson', 20),
(619023588, 'Jennifer Thomas', 11),
(489221823, 'Richard Jackson', 33),
(548977562, 'Ulysses Teach', 20);

-- Script para insertar datos en la tabla flights
INSERT INTO flights (flno, origin, destination, distance, departs, arrives, price) VALUES
(99, 'Los Angeles', 'Washington D.C.', 2308, '2005-04-12 09:30', '2005-04-12 21:40', 235.98),
(13, 'Los Angeles', 'Chicago', 1749, '2005-04-12 08:45', '2005-04-12 20:45', 220.98),
(346, 'Los Angeles', 'Dallas', 1251, '2005-04-12 11:50', '2005-04-12 19:05', 225.43),
(387, 'Los Angeles', 'Boston', 2606, '2005-04-12 07:03', '2005-04-12 17:03', 261.56),
(7, 'Los Angeles', 'Sydney', 7487, '2005-04-12 22:30', '2005-04-14 06:10', 1278.56),
(2, 'Los Angeles', 'Tokyo', 5478, '2005-04-12 12:30', '2005-04-13 15:55', 780.99),
(33, 'Los Angeles', 'Honolulu', 2551, '2005-04-12 09:15', '2005-04-12 11:15', 375.23),
(34, 'Los Angeles', 'Honolulu', 2551, '2005-04-12 12:45', '2005-04-12 15:18', 425.98),
(76, 'Chicago', 'Los Angeles', 1749, '2005-04-12 08:32', '2005-04-12 10:03', 220.98),
(68, 'Chicago', 'New York', 802, '2005-04-12 09:00', '2005-04-12 12:02', 202.45),
(7789, 'Madison', 'Detroit', 319, '2005-04-12 06:15', '2005-04-12 08:19', 120.33),
(701, 'Detroit', 'New York', 470, '2005-04-12 08:55', '2005-04-12 10:26', 180.56),
(702, 'Madison', 'New York', 789, '2005-04-12 07:05', '2005-04-12 10:12', 202.34),
(4884, 'Madison', 'Chicago', 84, '2005-04-12 22:12', '2005-04-12 23:02', 112.45),
(2223, 'Madison', 'Pittsburgh', 517, '2005-04-12 08:02', '2005-04-12 10:01', 189.98),
(5694, 'Madison', 'Minneapolis', 247, '2005-04-12 08:32', '2005-04-12 09:33', 120.11),
(304, 'Minneapolis', 'New York', 991, '2005-04-12 10:00', '2005-04-12 13:39', 101.56),
(149, 'Pittsburgh', 'New York', 303, '2005-04-12 09:42', '2005-04-12 12:09', 116.50);

-- Script para insertar datos en la tabla parts
INSERT INTO parts (pid, pname, color) VALUES
(1, 'Left Handed Bacon Stretcher Cover', 'Red'),
(2, 'Smoke Shifter End', 'Black'),
(3, 'Acme Widget Washer', 'Red'),
(4, 'Acme Widget Washer', 'Silver'),
(5, 'I Brake for Crop Circles Sticker', 'Translucent'),
(6, 'Anti-Gravity Turbine Generator', 'Cyan'),
(7, 'Anti-Gravity Turbine Generator', 'Magenta'),
(8, 'Fire Hydrant Cap', 'Red'),
(9, '7 Segment Display', 'Green');

-- Script para insertar datos en la tabla sailors
INSERT INTO sailors (sid, sname, rating, age) VALUES
(18, 'jones', '3', 30.0),
(41, 'jonah', '6', 56.0),
(22, 'ahab', '7', 44.0),
(63, 'moby', NULL, 15.0);

-- Script para insertar datos en la tabla student
INSERT INTO student (snum, sname, major, standing, age) VALUES
(051135593, 'Maria White', 'English', 'SR', 21),
(060839453, 'Charles Harris', 'Architecture', 'SR', 22),
(099354543, 'Susan Martin', 'Law', 'JR', 20),
(112348546, 'Joseph Thompson', 'Computer Science', 'SO', 19),
(115987938, 'Christopher Garcia', 'Computer Science', 'JR', 20),
(132977562, 'Angela Martinez', 'History', 'SR', 20),
(269734834, 'Thomas Robinson', 'Psychology', 'SO', 18),
(280158572, 'Margaret Clark', 'Animal Science', 'FR', 18),
(301221823, 'Juan Rodriguez', 'Psychology', 'JR', 20),
(318548912, 'Dorthy Lewis', 'Finance', 'FR', 18),
(320874981, 'Daniel Lee', 'Electrical Engineering', 'FR', 17),
(322654189, 'Lisa Walker', 'Computer Science', 'SO', 17),
(348121549, 'Paul Hall', 'Computer Science', 'JR', 18),
(351565322, 'Nancy Allen', 'Accounting', 'JR', 19),
(451519864, 'Mark Young', 'Finance', 'FR', 18),
(455798411, 'Luis Hernandez', 'Electrical Engineering', 'FR', 17),
(462156489, 'Donald King', 'Mechanical Engineering', 'SO', 19),
(550156548, 'George Wright', 'Education', 'SR', 21),
(552455318, 'Ana Lopez', 'Computer Engineering', 'SR', 19),
(556784565, 'Kenneth Hill', 'Civil Engineering', 'SR', 21),
(567354612, 'Karen Scott', 'Computer Engineering', 'FR', 18),
(573284895, 'Steven Green', 'Kinesiology', 'SO', 19),
(574489456, 'Betty Adams', 'Economics', 'JR', 20),
(578875478, 'Edward Baker', 'Veterinary Medicine', 'SR', 21);

-- Script para insertar datos en la tabla suppliers
INSERT INTO suppliers (sid, sname, address) VALUES
(1, 'Acme Widget Suppliers', '1 Grub St., Potemkin Village, IL 61801'),
(2, 'Big Red Tool and Die', '4 My Way, Bermuda Shorts, OR 90305'),
(3, 'Perfunctory Parts', '99999 Short Pier, Terra Del Fuego, TX 41299'),
(4, 'Alien Aircaft Inc.', '2 Groom Lake, Rachel, NV 51902');

-- Script para insertar datos en la tabla works
INSERT INTO works (eid, did, pct_time) VALUES
(142519864, 2, 100),
(242518965, 1, 100),
(141582651, 1, 50),
(141582651, 5, 50),
(141582657, 1, 25),
(141582657, 5, 75),
(011564812, 3, 100),
(254099823, 3, 100),
(356187925, 2, 100),
(489456522, 7, 100),
(287321212, 2, 100),
(248965255, 3, 100),
(159542516, 4, 100),
(090873519, 2, 100),
(486512566, 4, 100),
(619023588, 1, 100),
(489221823, 2, 100),
(548977562, 4, 100),
(578875478, 6, 100),
(051135593, 2, 100),
(060839453, 2, 100),
(112348546, 2, 100),
(115987938, 2, 100),
(132977562, 2, 100),
(269734834, 2, 100),
(280158572, 2, 100),
(301221823, 2, 100),
(318548912, 2, 100),
(320874981, 2, 100),
(322654189, 2, 100),
(348121549, 2, 100),
(351565322, 2, 100),
(451519864, 2, 100),
(455798411, 2, 100),
(550156548, 2, 50),
(552455318, 2, 25),
(556784565, 2, 25),
(567354612, 2, 75),
(573284895, 2, 50),
(574489456, 2, 50),
(015645489, 6, 100),
(015487874, 6, 100),
(054879887, 6, 100),
(098784544, 6, 100),
(074454898, 6, 100),
(156489494, 6, 100),
(179887498, 6, 100),
(156465461, 6, 100),
(128778823, 6, 100),
(178949844, 6, 100),
(298489484, 6, 100),
(274878974, 6, 100),
(267894232, 6, 100),
(254898318, 6, 100),
(289562686, 6, 100),
(291795563, 6, 100),
(334568786, 6, 100),
(355548984, 6, 100),
(310454876, 6, 100),
(390487451, 6, 100),
(454565232, 6, 50);
