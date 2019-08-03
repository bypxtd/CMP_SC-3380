-- Group14 test data for database
-- The computers are taking over

-- default admin account
-- PLEASE LEAVE
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('admin', 'Admin', 'istrator'); -- admin in person table
INSERT INTO Employee (UserID) VALUES ('admin'); -- admin in employee table
INSERT INTO Administrator (UserID) VALUES ('admin'); -- admin in admin table
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('admin', '$2y$10$gkKfX/FICyjOivkfG14dsOaSfHbX6ukGVCDuM8wCilQmKY0DD0GHe', 'a'); -- admin in auth table
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser admin'); -- make a log of creating the admin
-- PLEASE LEAVE

-- test for Equipment::getLocation()
-- INSERT INTO Customer (UserID) VALUES ('admin');
-- INSERT INTO Location (ZIP, Address, Name, City, State) VALUES (65201, '101 Rail Street', 'Missouri Rail HQ', 'Columbia', 'MO');
-- INSERT INTO Train (TrainNumber, DepartureDate, DepartureTime) VALUES (1, CURDATE() + INTERVAL 5 DAY, CURTIME());
-- INSERT INTO Train (TrainNumber, DepartureDate, DepartureTime) VALUES (2, CURDATE(), CURTIME());
-- INSERT INTO Train (TrainNumber, DepartureDate, DepartureTime) VALUES (3, CURDATE() + INTERVAL 1 DAY, CURTIME());
-- INSERT INTO Train (TrainNumber, DepartureDate, DepartureTime) VALUES (4, CURDATE() + INTERVAL 3 DAY, CURTIME());
-- INSERT INTO Destination (TrainNumber, ZIP, Address) VALUES (1, 65201, '101 Rail Street');
-- INSERT INTO Destination (TrainNumber, ZIP, Address) VALUES (2, 65201, '101 Rail Street');
-- INSERT INTO Destination (TrainNumber, ZIP, Address) VALUES (3, 65201, '101 Rail Street');
-- INSERT INTO Destination (TrainNumber, ZIP, Address) VALUES (4, 65201, '101 Rail Street');
-- INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price) VALUES (99999, 'boxcar', 'Missouri Rail Industries', 1500.0);
-- INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) Values (1, 99999, 'admin', 'empty');
-- INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) Values (4, 99999, 'admin', 'empty');
-- INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) Values (3, 99999, 'admin', 'empty');
-- INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) Values (2, 99999, 'admin', 'empty');

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- Notes
-- Passwords for users within passwords.txt in /home/GROUP14 directory
-- Spreadsheet with plans for Equipment-Trains: goo.gl/Fv0lJq
-- Is there a log to view engineer / conductor history? Do I need to INSERT a LogEntry for when they are assigned to a train?
-- Should Equipment cars not assigned to Trains after the CURDATE show up under listings?

-- Format of tables below:
-- LOCATIONS
-- ADMINISTRATORS
-- ENGINEERS
-- CONDUCTORS
-- CUSTOMERS
-- EQUIPMENT
-- TRAINS
-- RESERVATIONS

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- LOCATIONS --
-- INSERT INTO Location (Zip, Address, Name, City, State) VALUES (, '', '', '', '');
-- INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('', '', , , '');

-- Columbi, MO
INSERT INTO Location (ZIP, Address, Name, City, State) VALUES (65201, '101 Rail Street', 'Missouri Rail HQ', 'Columbia', 'MO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 65201, 101 Rail Street');

-- Chicago, IL
INSERT INTO Location (Zip, Address, Name, City, State) VALUES (60606, '225 South Canal Street', 'Chicago Union Station', 'Chicago', 'IL');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 60606, 225 South Canal Street');

-- St. Louis, MO
INSERT INTO Location (Zip, Address, Name, City, State) VALUES (63103, '430 South 15th Street', 'Gateway Transportation Center', 'St. Louis', 'MO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 63103, 430 South 15th Street');

-- Kansas City, MO
INSERT INTO Location (Zip, Address, Name, City, State) VALUES (64108, '30 West Pershing Road', 'Kansas City Union Station', 'Kansas City', 'MO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 64108, 30 West Pershing Road');

-- Los Angeles, CA
INSERT INTO Location (Zip, Address, Name, City, State) VALUES (90012, '801 Vignes Street', 'Los Angeles Union Station', 'Los Angeles', 'CA');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 90012, 801 Vignes Street');

-- Seattle, WA
INSERT INTO Location (Zip, Address, Name, City, State) VALUES (98104, '303 South Jackson Street', 'King Street Station', 'Seattle', 'WA');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 98104, South Jackson Street');

-- Portland, ME
INSERT INTO Location (Zip, Address, Name, City, State) VALUES (04102, '100 Thompsons Point Road', 'Portland Transportation Center', ' Portland', 'ME');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 04102, 100 Thompsons Point Road');

-- Jacksonville, FL
INSERT INTO Location (Zip, Address, Name, City, State) VALUES (32216, '6140 Philips Hwy', 'Florida East Coast Railway', 'Jacksonville', 'FL');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 32216, 6140 Philips Hwy');

-- Rusk, TX
INSERT INTO Location (Zip, Address, Name, City, State) VALUES (75785, '535 Park Road 76', 'Texas State Railroad', 'Rusk', 'TX');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 75785, 535 Park Road 76');

-- Lincoln, NE
INSERT INTO Location (Zip, Address, Name, City, State) VALUES (68508, '277 Pinnacle Arena Drive', 'Lincoln Station', 'Lincoln', 'NE');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 68508, 277 Pinnacles Arena Drive');

-- Denver, CO
INSERT INTO Location (Zip, Address, Name, City, State) VALUES (80202, '1701 Wynkoop Street', 'Denver Union Station', 'Denver', 'CO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 80202, 1701 Wynkoop Street');

-- Little Rock, AR
INSERT INTO Location (Zip, Address, Name, City, State) VALUES (72201, '1400 W Markham Street', 'Little Rock Union Station', 'Little Rock', 'AR');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateLocation 72201, 1400 W Markham Street');

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- ADMINISTRATORS --
-- INSERT INTO Person (UserID, FirstName, LastName) VALUES ('', '', '');
-- INSERT INTO Employee (UserID) VALUES ('');
-- INSERT INTO Administrator (UserID) VALUES ('');
-- INSERT INTO Authentication (UserID, Password, Roles) VALUES ('', '', '');
-- INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('', '', , , '');

-- admin2
-- INSERT INTO Person (UserID, FirstName, LastName) VALUES ('admin2', 'Test', 'Admin2');
-- INSERT INTO Employee (UserID) VALUES ('admin2');
-- INSERT INTO Administrator (UserID) VALUES ('admin2');
-- INSERT INTO Authentication (UserID, Password, Roles) VALUES ('admin2', 'testpass', '$2y$10$rgUu1a5ERa3fjztg3adBpuNmWBQLjlmlwEJJnP5KtaSRWTg61TgPW', 'a');
-- INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin2', 'localhost', CURDATE(), CURTIME(), 'CreateUser admin2');

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- ENGINEERS --
-- INSERT INTO Person (UserID, FirstName, LastName) VALUES ();
-- INSERT INTO Employee (UserID) VALUES ();
-- INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES ();
-- INSERT INTO Authentication (UserID, Password, Roles) VALUES ();
-- INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ();

-- engineer1
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('engineer1', 'Test', 'Engineer1');
INSERT INTO Employee (UserID) VALUES ('engineer1');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'junior', 1560, 'engineer1');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('engineer1', '$2y$10$vcEnGNPhroaLTaRHkQMibuanpi.eC8Pxax57Vxy4uYzwZdjEnsH9C', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser engineer1');

-- MBate
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('MBate', 'Mary', 'Bateman');
INSERT INTO Employee (UserID) VALUES ('MBate');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'junior', 1040, 'MBate');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('MBate', '$2y$10$UNDWsvnWs/GNKPOJM7kWE.6u.Fc1snswqaw/YZccDnETo9XHwj5lm', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser MBate');

-- WardP
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('WardP', 'Pendleton', 'Ward');
INSERT INTO Employee (UserID) VALUES ('WardP');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'senior', 6240, 'WardP');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('WardP', '$2y$10$RJ1xc7ECQa07Tm46U5948uZaSqlddQq81Cx3Cdloc2lDO5RbbT3iG', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser WardP');

-- Jbake64
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('Jbake64', 'Justin', 'Baker');
INSERT INTO Employee (UserID) VALUES ('Jbake64');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (FALSE, 'senior', 12480, 'Jbake64');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('Jbake64', '$2y$10$ELpJq81CRPZoJRCV8pt5/.DrHhhLjstLv9mV3Adj9LdEs8SP.WcKq', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser Jbake64');

-- cdayz
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('cdayz', 'Charlie', 'Day');
INSERT INTO Employee (UserID) VALUES ('cdayz');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'junior', 2240, 'cdayz');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('cdayz', '$2y$10$cm91zRYR.FW.5x.jkh9r.eRnw2.3.Qkrf8XutyFAqW4MEr4VkGOrC', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser cdayz');

-- RaineTrain
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('RaineTrain', 'Ashley', 'Raine');
INSERT INTO Employee (UserID) VALUES ('RaineTrain');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'senior', 7040, 'RaineTrain');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('RaineTrain', '$2y$10$fOyw7fNR0OL1G9926NwoS.PTfzK43hhJgFioqMHIus36xsk8GcFU6', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser RaineTrain');

-- Yoshi17
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('Yoshi17', 'Yoshi', 'Long');
INSERT INTO Employee (UserID) VALUES ('Yoshi17');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'junior', 4160, 'Yoshi17');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('Yoshi17', '$2y$10$4x4DOO92d8lXgzkO5eeJDuF53gGSJVZC4UV43IPZtFQP4wNteOaH6', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser Yoshi17');

-- AlJo4
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('AlJo4', 'Alex', 'Johnson');
INSERT INTO Employee (UserID) VALUES ('AlJo4');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (FALSE, 'junior', 200, 'AlJo4');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('AlJo4', '$2y$10$2wGfXjSh1owAaGY1JnCQ9e50tIL9NM0IIWqEwDa/.ByzVSaT5z54u', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser AlJo4');

-- Jake
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('Jake', 'Jake', 'Michael');
INSERT INTO Employee (UserID) VALUES ('Jake');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (FALSE, 'senior', 33280, 'Jake');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('Jake', '$2y$10$2nr7bAdr5QSAvFHiQabsAu3SNJ8kTul8elmJJyU2uacs/xelFphai', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser Jake');

-- mtk008
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('mkt008', 'Melody', 'Knight');
INSERT INTO Employee (UserID) VALUES ('mkt008');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'junior', 3400, 'mkt008');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('mkt008', '$2y$10$Q0uRedqPPWoqTvWUuxm3HOJ.7VevytBV1IjwWXUS3gRGLaJrzWIwm', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser mtk008');

-- JG
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('JG', 'Johnny', 'Gill');
INSERT INTO Employee (UserID) VALUES ('JG');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'senior', 10400, 'JG');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('JG', '$2y$10$4p4lXU58dq4B2eupyTtd5uqYFeIqcmAGTebUe86VGhvTasQa60SZG', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser JG');

-- vincentmiller
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('vincentmiller', 'Vincent', 'Miller');
INSERT INTO Employee (UserID) VALUES ('vincentmiller');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'junior', 33280, 'vincentmiller');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('vincentmiller', '$2y$10$J0zM8hyTm6Duz7Xf2AGV3umFGFbgff4KskMB7kVxhP4Y.4QWufrMS', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser vincentmiller');

-- MarcosA52
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('MarcosA52', 'Marcos', 'Austin');
INSERT INTO Employee (UserID) VALUES ('MarcosA52');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'senior', 9920, 'MarcosA52');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('MarcosA52', '$2y$10$ZfHeIRcgkpU4iVqTPViFaeHfaDffxHl4fvNNO2cPotg4hxaabsH4O', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser MarcosA52');

-- samanthaXOXO
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('samanthaXOXO', 'Samantha', 'Bailey');
INSERT INTO Employee (UserID) VALUES ('samanthaXOXO');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'junior', 5980, 'samanthaXOXO');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('samanthaXOXO', '
$2y$10$twLeL94LG3dwTphQPqK7.eNjVyFi3hOu1eHtD8lrc6KjrrUgSNYhi', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser samanthaXOXO');

-- RTOWN
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('RTOWN', 'Randy', 'Harmon');
INSERT INTO Employee (UserID) VALUES ('RTOWN');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'senior', 23204, 'RTOWN');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('RTOWN', '$2y$10$utRuG2.iAsKv2vk7zyQdJea0yX2QGe4ugZlugjbp0I3ZYN4GFv6aW', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser RTOWN');

-- spiderman
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('spiderman', 'Noah', 'Webster');
INSERT INTO Employee (UserID) VALUES ('spiderman');
INSERT INTO Engineer (Status, Rank, Hours, UserID) VALUES (TRUE, 'senior', 29730, 'spiderman');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('spiderman', '$2y$10$X1WKWtIpIKhmsdpO4WGwu.eQEboJtYZuENWt4iQWapG..dEtjdjua', 'e');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser spiderman');

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- CONDUCTORS --
-- INSERT INTO Person (UserID, FirstName, LastName) VALUES ('', '', '');
-- INSERT INTO Employee (UserID) VALUES ('');
-- INSERT INTO Conductor (Status, Rank, UserID) VALUES (, '', '');
-- INSERT INTO Authentication (UserID, Password, Roles) VALUES ('', '', '');
-- INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('', '', , , '');

-- SteveR89
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('SteveR89', 'Steven', 'Ramirez');
INSERT INTO Employee (UserID) VALUES ('SteveR89');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'junior', 'SteveR89');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('SteveR89', '$2y$10$UFmywbiMxjOpJOSH7M/LZu5eGrqPNM9FmTw..goLFCMJNYK6uVkzS', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser SteveR89');

-- MozFart
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('MozFart', 'Wolfgang', 'Mozart');
INSERT INTO Employee (UserID) VALUES ('MozFart');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (FALSE, 'senior', 'MozFart');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('MozFart', '$2y$10$VKXmnkpWfBOfICr.Nl5fJesj/GmSaTsH4fmFmUoalTKnfINeTm/qG', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser MozFart');

-- 10ChopChop
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('10ChopChop', 'Frederic', 'Chopin');
INSERT INTO Employee (UserID) VALUES ('10ChopChop');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'senior', '10ChopChop');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('10ChopChop', '$2y$10$qLcIxtS17SYa6tDrFcKFyO/KiON7CMPp8sV/5IxRA8NQQa06.gxDm', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser 10ChopChop');

-- YoungBeet
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('YoungBeet', 'Ludwig', 'Beethoven');
INSERT INTO Employee (UserID) VALUES ('YoungBeet');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'junior', 'YoungBeet');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('YoungBeet', '$2y$10$hu/IKyy0ZZAzgMrgeb/Baun9B.JxhRnH3bgrSo.sA6QDPgxhVxxNm', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser YoungBeet');

-- JohannTheConductor
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('JohannTheConductor', 'Johann', 'Bach');
INSERT INTO Employee (UserID) VALUES ('JohannTheConductor');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (FALSE, 'junior', 'JohannTheConductor');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('JohannTheConductor', '$2y$10$45pxqoAX5V9Iwl7nwHs2eOi2o7DOToIPkH.3zaPkFVnhDTETykEuW', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser JohannTheConductor');

-- lilBrahms
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('lilBrahms', 'Johannes', 'Brahms');
INSERT INTO Employee (UserID) VALUES ('lilBrahms');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'senior', 'lilBrahms');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('lilBrahms', '$2y$10$e2/hkztGJeBtXsFWm6pM/e0KEexzgZzlSUdcX0o89aoAYFGmIVsBy', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser lilBrahms');

-- PyotrTchaikovsky
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('PyotrTchaikovsky', 'Pytor', 'Tchaikovsky');
INSERT INTO Employee (UserID) VALUES ('PyotrTchaikovsky');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'senior', 'PyotrTchaikovsky');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('PyotrTchaikovsky', '$2y$10$Xu2ClKmBdSUrAG0caxWtSOOGbQE8r9IUOij2T8/cXaSk6W9Bbum.S', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser PytorTchaikovsky');

-- CnD
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('CnD', 'Claude', 'Debussy');
INSERT INTO Employee (UserID) VALUES ('CnD');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'junior', 'CnD');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('CnD', '$2y$10$lByvOEOEg0ZyJlPD1IvGT.spcuJRghTHKn6db5L3ZPYcnesQP8Num', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser CnD');

-- Schub3rtV
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('Schub3rtV', 'Franz', 'Schubert');
INSERT INTO Employee (UserID) VALUES ('Schub3rtV');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'junior', 'Schub3rtV');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('Schub3rtV', '$2y$10$hZb5bg2SWPPc9FAVl0mfN.n/22Nh7lzbingUh.Aky3xKnqt75SMzS', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser Schub3rtV');

-- SnoopLiszt
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('SnoopLiszt', 'Franz', 'Liszt');
INSERT INTO Employee (UserID) VALUES ('SnoopLiszt');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'junior', 'SnoopLiszt');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('SnoopLiszt', '$2y$10$nfhzG.zFyd9YzxJ6UmrDAOo8lp.3Ogx6DRUG/M6LYaJ9wMH8VnK2q', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser SnoopLiszt');

-- DrWagner
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('DrWagner', 'Richard', 'Wagner');
INSERT INTO Employee (UserID) VALUES ('DrWagner');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'junior', 'DrWagner');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('DrWagner', '$2y$10$J6jQQ1yoDS1jfbAHO5OUluQ9DSY9QvkQS9YySjVEOFFEsgt.m87sC', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser DrWagner');

-- 25Strav
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('25Strav', 'Igor', 'Stravinsky');
INSERT INTO Employee (UserID) VALUES ('25Strav');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'senior', '25Strav');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('25Strav', '$2y$10$UFmywbiMxjOpJOSH7M/LZu5eGrqPNM9FmTw..goLFCMJNYK6uVkzS', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser 25Strav');

-- FelMendel
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('FelMendel', 'Felix', 'Mendelssohn');
INSERT INTO Employee (UserID) VALUES ('FelMendel');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'junior', 'FelMendel');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('FelMendel', '$2y$10$OnZjLvEIU3EADYewt/s56e1NtAqm7NheckW.jvfgf.a2FQg1iuvaO', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser FelMendel');

-- bigmahl
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('bigmahl', 'Gustav', 'Mahler');
INSERT INTO Employee (UserID) VALUES ('bigmahl');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'senior', 'bigmahl');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('bigmahl', '$2y$10$gHeWc2/wEvlWFk2MQEQtTuP1X9HYXqxu/5WHdB0VxpBxTWQG6nN.O', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser bigmahl');

-- GiaComo
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('GiaComo', 'Giacomo', 'Puccini');
INSERT INTO Employee (UserID) VALUES ('GiaComo');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'junior', 'GiaComo');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('GiaComo', '$2y$10$hAw0IDJscpgERzMPN2V1F.QvubCeLfq/D2ag33FUQKJC6d4KKFEIG', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser GiaComo');

-- VivaldiSouth
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('VivaldiSouth', 'Antonio', 'Vivaldi');
INSERT INTO Employee (UserID) VALUES ('VivaldiSouth');
INSERT INTO Conductor (Status, Rank, UserID) VALUES (TRUE, 'senior', 'VivaldiSouth');
INSERT INTO Authentication (UserID, Password, Roles) VALUES ('VivaldiSouth', '$2y$10$dkhxbkIqj30zQBFH3qjz7ufFlcP3CfKjzVRg4BV0.hLGpqx/6Ij.G', 'c');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser VivaldiSouth');

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- CUSTOMERS --
-- INSERT INTO Person (UserID, FirstName, LastName) VALUES ('', '', '');
-- INSERT INTO Customer (CompanyID, UserID) VALUES ('', '');
-- INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('', '', , , '');

-- Walmart, Tdogg05
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('Tdogg05', 'Tim', 'Barnes');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Walmart', 'Tdogg05');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser Tdogg05');

-- Apple, PalmTomm
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('PalmTomm', 'Tommy', 'Palmer');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Apple', 'PalmTomm');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser PalmTomm');

-- Amazon, 57jpat
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('57jpat', 'Jose', 'Patton');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Amazon', '57jpat');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser 57jpat');

-- Volkswagen, IMorgan07
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('IMorgan07', 'Iris', 'Morgan');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Volkswagen', 'IMorgan07');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser IMorgan07');

-- Verizon, OliveTea35
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('OliveTea35', 'Olive', 'Lee');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Verizon', 'OliveTea35');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser OliveTea35');

-- Hyvee, LSquared2
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('LSquared2', 'Luz', 'Lyons');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Hyvee', 'LSquared2');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser LSquared2');

-- Blizzard, Bsbt47
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('Bsbt47', 'Beatrice', 'Burgess');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Blizzard', 'Bsbt47');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser Bsbt47');

-- Google, monicaJ91
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('monicaJ91', 'Monica', 'Jacobs');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Google', 'monicaJ91');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser monicaJ91');

-- FedEx, bhoagie
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('bhoagie', 'Bernard', 'Hogan');
INSERT INTO Customer (CompanyID, UserID) VALUES ('FedEx', 'bhoagie');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser bhoagie');

-- Hershey, HersheyAndy
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('HersheyAndy', 'Andy', 'Russell');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Hershey', 'HersheyAndy');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser HersheyAndy');

-- Disney, WaltGisney
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('WaltGisney', 'Bob', 'Carter');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Disney', 'WaltGisney');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser WaltGisney');

-- Microsoft, bill1337
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('bill1337', 'Bill', 'Gates');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Microsoft', 'bill1337');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser bill1337');

-- Starbucks, Slove1
INSERT INTO Person (UserID, FirstName, LastName) VALUES ('Slove1', 'Sara', 'Love');
INSERT INTO Customer (CompanyID, UserID) VALUES ('Starbucks', 'Slove1');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateUser Slove1');

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- EQUIPMENT --
-- INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (, '', '', ,);
-- INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('', '', , , '');

-- Arranged by manufacturer & ascending SerialNumber

-- Chicago, IL manufacturer --------------------------------------
-- Assigned to Train: 105
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (500, 'autorack', 'American Car Company', 987.20, 161595);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 500');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (501, 'boxcar', 'American Car Company', 235.43, 239204);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 501');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (502, 'caboose', 'American Car Company', 276.75, 293867);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 502');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (503, 'flatcar', 'American Car Company', 1000.54, 245379);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 503');

-- Assigned to Train: 50
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (504, 'gondola', 'American Car Company', 645.98, 268035);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 504');

-- Assigned to Train: 50
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (505, 'hopper', 'American Car Company', 332.30, 163410);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 505');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (506, 'locomotive', 'American Car Company', 245.04, 187436);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 506');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (507, 'spine car', 'American Car Company', 954.22, 208244);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 507');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (508, 'tank car', 'American Car Company', 440.64, 186072);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 508');

-- St. Louis, MO manufacturer --------------------------------------
-- Assigned to Train: 104
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (600, 'autorack', 'Missouri Car and Foundry Company', 700.60, 197087);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 600');

-- Assigned to Train: 51
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (601, 'boxcar', 'Missouri Car and Foundry Company', 572.71, 234122);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 601');

-- Assigned to Train: 51
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (602, 'caboose', 'Missouri Car and Foundry Company', 654.60, 239487);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 602');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (603, 'flatcar', 'Missouri Car and Foundry Company', 906.93, 244678);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 603');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (604, 'gondola', 'Missouri Car and Foundry Company', 638.36, 207465);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 604');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (605, 'hopper', 'Missouri Car and Foundry Company', 950.81, 270775);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 605');

-- Assigned to Train: 52
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (606, 'locomotive', 'Missouri Car and Foundry Company', 369.53, 247786);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 606');

-- Assigned to Train: 52
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (607, 'spine car', 'Missouri Car and Foundry Company', 470.21, 210066);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 607');

-- Assigned to Train 52
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (608, 'tank car', 'Missouri Car and Foundry Company', 784.48, 257766);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 608');

-- Kansas City, MO manufacturer --------------------------------------
-- Assigned to Train: 100
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (700, 'autorack', 'Butler Manufacturing Corporation', 500.20, 281318);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 700');

-- Assigned to Train: 701
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (701, 'boxcar', 'Butler Manufacturing Corporation', 832.57, 225164);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 701');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (702, 'caboose', 'Butler Manufacturing Corporation', 493.88, 198708);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 702');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (703, 'flatcar', 'Butler Manufacturing Corporation', 942.65, 235256);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 703');

-- Assigned to Train: 54
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (704, 'gondola', 'Butler Manufacturing Corporation', 776.40, 203159);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 704');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (705, 'hopper', 'Butler Manufacturing Corporation', 565.39, 257519);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 705');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (706, 'locomotive', 'Butler Manufacturing Corporation', 501.97, 163053);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 706');

-- Assigned to Train 55
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (707, 'spine car', 'Butler Manufacturing Corporation', 280.69, 298834);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 707');

-- Assigned to Train 55
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (708, 'tank car', 'Butler Manufacturing Corporation', 360.11, 172150);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 708');

-- San Francisco, CA manufacturer --------------------------------------
-- Assigned to Train: 110
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (800, 'autorack', 'Casebolt, Henry & Company', 330.03, 199924);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 800');

-- Assigned to Train: 56
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (801, 'boxcar', 'Casebolt, Henry & Company', 620.58, 202406);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 801');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (802, 'caboose', 'Casebolt, Henry & Company', 786.37, 216748);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 802');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (803, 'flatcar', 'Casebolt, Henry & Company', 353.28, 223859);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 803');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (804, 'gondola', 'Casebolt, Henry & Company', 958.06, 234722);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 804');

-- Assigned to Train: 57
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (805, 'hopper', 'Casebolt, Henry & Company', 817.18, 162693);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 805');

-- Assigned to Train: 57
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (806, 'locomotive', 'Casebolt, Henry & Company', 921.99, 272940);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 806');

-- Assigned to Train: 57
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (807, 'spine car', 'Casebolt, Henry & Company', 128.70, 185639);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 807');

-- Assigned to Train: 57
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (808, 'tank car', 'Casebolt, Henry & Company', 834.66, 272888);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 808');

-- Washington, OR manufacturer --------------------------------------
-- Assigned to Train: 103
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (900, 'autorack', 'Pacific Car and Foundry', 900.21, 241010);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 900');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (901, 'boxcar', 'Pacific Car and Foundry', 634.43, 285509);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 901');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (902, 'caboose', 'Pacific Car and Foundry', 440.74, 170541);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 902');

-- Assigned to Train: 58
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (903, 'flatcar', 'Pacific Car and Foundry', 169.82, 199974);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 903');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (904, 'gondola', 'Pacific Car and Foundry', 287.68, 168808);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 904');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (905, 'hopper', 'Pacific Car and Foundry', 718.94, 231285);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 905');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (906, 'locomotive', 'Pacific Car and Foundry', 363.25, 167448);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 906');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (907, 'spine car', 'Pacific Car and Foundry', 259.32, 231285);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 907');

-- Assigned to Train: 59
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (908, 'tank car', 'Pacific Car and Foundry', 113.70, 276416);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 908');

-- Portland, ME manufacturer --------------------------------------
-- Assigned to Train: 101
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1000, 'autorack', 'Portland Company', 940.40, 240770);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1000');

-- Assigned to Train: 60
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1001, 'boxcar', 'Portland Company', 792.58, 293586);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1001');

-- Assigned to Train 60
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1002, 'caboose', 'Portland Company', 382.28, 175018);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1002');

-- Assigned to Train 60
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1003, 'flatcar', 'Portland Company', 476.79, 208280);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1003');

-- Assigned to Train 60
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1004, 'gondola', 'Portland Company', 688.27, 251148);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1004');

-- Assigned to Train: 60
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1005, 'hopper', 'Portland Company', 443.02, 192514);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1005');

-- Assigned to Train: 60
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1006, 'locomotive', 'Portland Company', 796.10, 173719);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1006');

-- Assigned to Train: 60
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1007, 'spine car', 'Portland Company', 248.38, 218834);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1007');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1008, 'tank car', 'Portland Company', 631.21, 241400);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1008');

-- Waycross, GA manufacturer --------------------------------------
-- Assigned to Train: 11
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1100, 'autorack', 'South Atlantic Car & Manufacturing Company', 200.99, 179754);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1100');

-- Assigned to Train: 61
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1101, 'boxcar', 'South Atlantic Car & Manufacturing Company', 100.74, 227293);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1101');

-- Assigned to Train: 61
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1102, 'caboose', 'South Atlantic Car & Manufacturing Company', 126.36, 212883);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1102');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1103, 'flatcar', 'South Atlantic Car & Manufacturing Company', 705.49, 297263);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1103');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1104, 'gondola', 'South Atlantic Car & Manufacturing Company', 326.23, 251464);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1104');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1105, 'hopper', 'South Atlantic Car & Manufacturing Company', 608.61, 161685);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1105');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1106, 'locomotive', 'South Atlantic Car & Manufacturing Company', 873.45, 234185);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1106');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1107, 'spine car', 'South Atlantic Car & Manufacturing Company', 616.19, 193192);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1107');

-- Assigned to Train: 62
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1108, 'tank car', 'South Atlantic Car & Manufacturing Company', 142.73, 271771);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1108');

-- Marshall, TX manufacturer --------------------------------------
-- Assigned to Train: 108
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1200, 'autorack', 'Marshall Car and Foundry Company', 807.46, 202582);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1200');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1201, 'boxcar', 'Marshall Car and Foundry Company', 165.86, 255263);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1201');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1202, 'caboose', 'Marshall Car and Foundry Company', 571.34, 194300);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1202');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1203, 'flatcar', 'Marshall Car and Foundry Company', 169.69, 271708);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1203');

-- Assigned to Train: 63
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1204, 'gondola', 'Marshall Car and Foundry Company', 681.75, 205030);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1204');

-- Assigned to Train: 63
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1205, 'hopper', 'Marshall Car and Foundry Company', 229.31, 267485);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1205');

-- Assigned to Train: 63
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1206, 'locomotive', 'Marshall Car and Foundry Company', 994.90, 217182);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1206');

-- Assigned to Train: 63
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1207, 'spine car', 'Marshall Car and Foundry Company', 960.75, 216401);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1207');

-- Assigned to Train: 63
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1208, 'tank car', 'Marshall Car and Foundry Company', 348.64, 203710);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1208');

-- Kansas City, KS manufacturer --------------------------------------
-- Assigned to Train: 106
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1300, 'autorack', 'Darby Corporation', 680.99, 251657);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1300');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1301, 'boxcar', 'Darby Corporation', 816.39, 298865);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1301');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1302, 'caboose', 'Darby Corporation', 992.34, 284776);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1302');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1303, 'flatcar', 'Darby Corporation', 447.04, 271059);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1303');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1304, 'gondola', 'Darby Corporation', 293.46, 258940);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1304');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1305, 'hopper', 'Darby Corporation', 191.70, 292722);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1305');

-- Assigned to Train: 64
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1306, 'locomotive', 'Darby Corporation', 926.83, 272860);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1306');

-- Assigned to Train: 64
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1307, 'spine car', 'Darby Corporation', 989.38, 279900);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1307');

-- Assigned to Train: 64
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1308, 'tank car', 'Darby Corporation', 248.62, 175697);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1308');

-- Fort Lupton, CO manufacturer --------------------------------------
-- Assigned to Train: 107
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1400, 'autorack', 'Colorado Railcar Manufacturing', 420.20, 207621);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1400');

-- Assigned to Train: 65
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1401, 'boxcar', 'Colorado Railcar Manufacturing', 157.08, 272356);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1401');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1402, 'caboose', 'Colorado Railcar Manufacturing', 556.24, 197818);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1402');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1403, 'flatcar', 'Colorado Railcar Manufacturing', 470.47, 263467);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1403');

-- Assigned to Train: 66
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1404, 'gondola', 'Colorado Railcar Manufacturing', 621.05, 174039);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1404');

-- Assigned to Train: 66
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1405, 'hopper', 'Colorado Railcar Manufacturing', 910.93, 2414448);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1405');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1406, 'locomotive', 'Colorado Railcar Manufacturing', 790.77, 264688);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1406');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1407, 'spine car', 'Colorado Railcar Manufacturing', 358.75, 211556);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1407');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1408, 'tank car', 'Colorado Railcar Manufacturing', 447.71, 175156);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1408');

-- St. Charles, MO manufacturer --------------------------------------
-- Assigned to Train: 102
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1500, 'autorack', 'St. Charles Car Company', 770.05, 213068);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1500');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1501, 'boxcar', 'St. Charles Car Company', 361.13, 191604);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1501');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1502, 'caboose', 'St. Charles Car Company', 838.83, 298888);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1502');

-- Assigned to Train: 67
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1503, 'flatcar', 'St. Charles Car Company', 459.97, 292746);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1503');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1504, 'gondola', 'St. Charles Car Company', 245.65, 279950);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1504');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1505, 'hopper', 'St. Charles Car Company', 953.76, 249438);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1505');

-- Assigned to Train: 68
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1506, 'locomotive', 'St. Charles Car Company', 296.29, 266562);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1506');

-- Assigned to Train: 68
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1507, 'spine car', 'St. Charles Car Company', 358.93, 186955);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1507');

-- Assigned to Train: 68
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1508, 'tank car', 'St. Charles Car Company', 524.20, 221484);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1508');

-- Armourdale, MO manufacturer --------------------------------------
-- Assigned to Train: 109
-- Status: Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1600, 'autorack', 'Kansas City & Wheel Company', 100.07, 196986);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1600');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1601, 'boxcar', 'Kansas City & Wheel Company', 221.64, 285750);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1601');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1602, 'caboose', 'Kansas City & Wheel Company', 574.19, 296062);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1602');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1603, 'flatcar', 'Kansas City & Wheel Company', 150.61, 215797);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1603');

-- Assigned to Train: 69
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1604, 'gondola', 'Kansas City & Wheel Company', 366.27, 224625);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1604');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1605, 'hopper', 'Kansas City & Wheel Company', 473.18, 255670);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1605');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1606, 'locomotive', 'Kansas City & Wheel Company', 900.39, 238412);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1606');

-- Assigned to Train: 3381 (MASTER TRAIN)
-- Status: N/A
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1607, 'spine car', 'Kansas City & Wheel Company', 432.38, 282383);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1607');

-- Assigned to Train: 70
-- Status: Not Reserved
INSERT INTO Equipment (SerialNumber, Type, Manufacturer, Price, Capacity) VALUES (1608, 'tank car', 'Kansas City & Wheel Company', 424.49, 263291);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateEquipment 1608');

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- TRAINS --
-- INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (, '', '');
-- INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (, '', );
-- INSERT INTO Destination (Zip, Address, TrainNumber) Values (, '', );
-- INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (, );
-- INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('', );
-- INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('', );
-- INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('', '', , , '');

-- Arranged by before / after date & ascending TrainNumber

-- Trains before 2017-04-24 --------------------------------------

-- Train 1 departing from Chicago, IL at 09:00:00 on 2017-01-01 arriving to Jacksonville, FL
-- Equipment car(s): 501, 502, 503
-- Engineers: cdayz, spiderman 
-- Conductor(s): JohannTheConductor
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (1, '09:00:00', '2017-01-01');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (60606, '225 South Canal Street', 1);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (32216, '6140 Philips Hwy', 1);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (501, 1);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (502, 1);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (503, 1);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('cdayz', 1);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('spiderman', 1);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('JohannTheConductor', 1);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 1');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 1, cdayz');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 1, spiderman');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 1, JohannTheConductor');

-- Train 2 departing from Chicago, IL at 10:00:00 on 2017-01-03 arriving to Denver, CO
-- Equipment car(s): 506, 507, 508
-- Engineers: Jbake64
-- Conductor(s): PyotrTchaikovsky
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (2, '10:00:00', '2017-01-03');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (60606, '225 South Canal Street', 2);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (80202, '1701 Wynkoop Street', 2);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (506, 2);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (507, 2);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (508, 2);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Jbake64', 2);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('vincentmiller', 2);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('PyotrTchaikovsky', 2);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 2');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 2, Jbake64');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 2, vincentmiller');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 2, PyotrTchaikovsky');

-- Train 3 departing from St. Lousis, MO at 11:30:00 on 2017-01-05 arriving to Rusk, TX
-- Equipment car(s): 603
-- Engineers: WardP, MarcosA52
-- Conductor(s): CnD
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (3, '11:30:00', '2017-01-05');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (63103, '430 South 15th Street', 3);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (75785, '535 Park Road 76', 3);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (603, 3);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('WardP', 3);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MarcosA52', 3);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('CnD', 3);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 3');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 3, WardP');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 3, MarcosA52');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 3, CnD');

-- Train 4 departing from St. Louis, MO at 12:15:00 on 2017-01-07 arriving to Portland, ME
-- Equipment car(s): 604, 605
-- Engineers: samanthaXOXO, Jake
-- Conductor(s): SnoopLiszt
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (4, '12:15:00', '2017-01-07');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (63103, '430 South 15th Street', 4);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (04102, '100 Thompsons Point Road', 4);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (604, 4);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (605, 4);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('samanthaXOXO', 4);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Jake', 4);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('SnoopLiszt', 4);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 4');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 4, samanthaXOXO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 4, Jake');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 4, SnoopLiszt');

-- Train 5 departing from Kansas City, MO at 12:30:00 on 2017-01-09 arriving to Lincoln, NE
-- Equipment car(s) 702, 703
-- Engineers: Jake, AlJo4
-- Conductor(s): lilBrahms
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (5, '12:30:00', '2017-01-09');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (64108, '30 West Pershing Road', 5);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (68508, '277 Pinnacle Arena Drive', 5);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (702, 5);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (703, 5);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Jake', 5);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('AlJo4', 5);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('lilBrahms', 5);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 5');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 5, Jake');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 5, AlJo4');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 5, lilBrahms');

-- Train 6 departing from Kansas City, MO at 13:15:00 on 2017-01-11 arriving to Chicago, IL
-- Equipment car(s): 705, 706
-- Engineers: mkt008, MBate
-- Conductor(s): Schub3rtV
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (6, '13:15:00', '2017-01-11');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (64108, '30 West Pershing Road', 6);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (60606, '225 South Canal Street', 6);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (705, 6);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (706, 6);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('mkt008', 6);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MBate', 6);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('Schub3rtV', 6);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 6');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 6, mkt008');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 6, MBate');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 6, Schub3rtV');

-- Train 7 departing from Los Angeles, CA at 13:45:00 on 2017-01-13 arriving to Jacksonville, FL
-- Equipment car(s): 802, 803, 804
-- Engineers: spiderman, RaineTrain
-- Conductor(s): DrWagner
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (7, '13:45:00', '2017-01-13');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (90012, '801 Vignes Street', 7);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (32216, '6140 Philips Hwy', 7);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (802, 7);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (803, 7);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (804, 7);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('spiderman', 7);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('RaineTrain', 7);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('DrWagner', 7);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 7');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 7, spiderman');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 7, RaineTrain');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 7, DrWagner');

-- Train 8 departing from Seattle, WA at 14:00:00 on 2017-01-15 arriving to Little Rock, AR
-- Equipment car(s): 901, 902
-- Engineers: Yoshi17, Jbake64
-- Conductor(s): 10ChopChop
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (8, '14:00:00', '2017-01-15');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (98104, '303 South Jackson Street', 8);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (72201, '1400 W Markham Street', 8);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (901, 8);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (902, 8);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Yoshi17', 8);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Jbake64', 8);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('10ChopChop', 8);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 8');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 8, Yoshi17');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 8, Jbake64');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 8, 10ChopChop');

-- Train 9 departing from Seattle, WA at St. Louis, MO on 2017-01-17 arriving to Portland, ME
-- Equipment car(s): 904, 905, 906, 907
-- Engineers: RTOWN, WardP
-- Conductor(s): SteveR89
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (9, '14:30:00', '2017-01-17');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (98104, '303 South Jackson Street', 9);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (04102, '100 Thompsons Point Road', 9);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (904, 9);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (905, 9);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (906, 9);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (907, 9);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('RTOWN', 9);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('WardP', 9);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('SteveR89', 9);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 9');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 9, RTOWN');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 9, WardP');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 9, SteveR89');

-- Train 10 departing from Portland, ME at 14:45:00 on 2017-01-19 arriving to Rusk, TX
-- Equipment car(s): 1008
-- Engineers: vincentmiller, Jake
-- Conductor(s): FelMendel
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (10, '14:45:00', '2017-01-19');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (04102, '100 Thompsons Point Road', 10);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (75785, '535 Park Road 76', 10);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1008, 10);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('vincentmiller', 10);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Jake', 10);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('FelMendel', 10);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 10');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 10, vincentmiller');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 10, Jake');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 10, FelMendel');

-- Train 11 departing from Jacksonville, FL at 15:00:00 on 2017-01-19 arriving to Little Rock, AR
-- Equipment car(s): 1103, 1104, 1105, 1106, 1107
-- Engineers: MarcosA52, cdayz
-- Conductor(s): GiaComo
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (11, '15:00:00', '2017-01-19');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (32216, '6140 Philips Hwy', 11);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (72201, '1400 W Markham Street', 11);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1103, 11);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1104, 11);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1105, 11);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1106, 11);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1107, 11);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MarcosA52', 11);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('cdayz', 11);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('GiaComo', 11);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 11');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 11, MarcosA52');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 11, cdayz');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 11, GiaComo');

-- Train 12 departing from Rusk, TX at 15:30:00 on 2017-01-21 arriving to Chicago, IL
-- Equipment car(s): 1201, 1202, 1203
-- Engineers: MBate, spiderman
-- Conductor(s): bigmahl
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (12, '15:30:00', '2017-01-21');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (75785, '535 Park Road 76', 12);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (60606, '225 South Canal Street', 12);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1201, 12);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1202, 12);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1203, 12);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MBate', 12);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('spiderman', 12);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('bigmahl', 12);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 12');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 12, MBate');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 12, spiderman');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 12, bigmahl');

-- Train 13 departing from Lincoln, NE at 15:45:00 on 2017-01-23 arriving to Los Angeles, CA
-- Equipment car(s): 1301, 1302, 1303, 1304, 1305
-- Engineers: AlJo4, samanthaXOXO
-- Conductor(s): VivaldiSouth
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (13, '15:45:00', '2017-01-23');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (68508, '277 Pinnacle Arena Drive', 13);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (90012, '801 Vignes Street', 13);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1301, 13);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1302, 13);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1303, 13);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1304, 13);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1305, 13);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('AlJo4', 13);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('samanthaXOXO', 13);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('VivaldiSouth', 13);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 13');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 13, AlJo4');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 13, samanthaXOXO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 13, VivaldiSouth');

-- Train 14 departing from Denver, CO at 16:00:00 on 2017-01-25 arriving to St. Louis, MO
-- Equipment car(s): 1402, 1403
-- Engineers: RaineTrain, JG
-- Conductor(s): 25Strav
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (14, '16:00:00', '2017-01-25');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (80202, '1701 Wynkoop Street', 14);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (63103, '430 South 15th Street', 14);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1402, 14);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1403, 14);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('RaineTrain', 14);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('JG', 14);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('25Strav', 14);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 14');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 14, RaineTrain');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 14, JG');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 14, 25Strav');

-- Train 15 departing from Denver, CO at 16:45:00 on 2017-01-27 arriving to Portland, ME
-- Equipment car(s): 1406, 1407, 1408
-- Engineers: JG, mkt008
-- Conductor(s): JohannTheConductor
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (15, '16:45:00', '2017-01-27');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (80202, '1701 Wynkoop Street', 15);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (04102, '100 Thompsons Point Road', 15);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1406, 15);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1407, 15);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1408, 15);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('JG', 15);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('mkt008', 15);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('JohannTheConductor', 15);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 15');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 15, JG');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 15, mkt008');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 15, JohannTheConductor');

-- Train 16 departing from Little Rock, AR at 17:15:00 on 2017-01-29 arriving to Lincoln, NE
-- Equipment car(s): 1501, 1502
-- Engineers: WardP, RTOWN
-- Conductor(s): YoungBeet
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (16, '17:15:00', '2017-01-29');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (72201, '1400 W Markham Street', 16);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (68508, '277 Pinnacle Arena Drive', 16);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1501, 16);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1502, 16);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('WardP', 16);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('RTOWN', 16);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('YoungBeet', 16);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 16');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 16, WardP');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 16, RTOWN');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 16, YoungBeet');

-- Train 17 departing from Little Rock, AR at 17:45:00 on 2017-01-31 arriving to Kansas City, MO
-- Equipment car(s): 1504, 1505
-- Engineers: Yoshi17, MBate
-- Conductor(s): PyotrTchaikovsky
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (17, '17:45:00', '2017-01-31');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (72201, '1400 W Markham Street', 17);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (64108, '30 West Pershing Road', 17);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1504, 17);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1505, 17);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Yoshi17', 17);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MBate', 17);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('PyotrTchaikovsky', 17);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 17');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 17, Yoshi17');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 17, MBate');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 17, PyotrTchaikovsky');

-- Train 18 departing from Kansas City, MO at 18:30:00 on 2017-02-01 arriving to Denver, CO
-- Equipment car(s): 1601, 1602, 1603
-- Engineers: Jake, cdayz
-- Conductor(s): DrWagner
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (18, '18:30:00', '2017-02-01');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (64108, '30 West Pershing Road', 18);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (80202, '1701 Wynkoop Street', 18);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1601, 18);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1602, 18);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1603, 18);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Jake', 18);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('cdayz', 18);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('DrWagner', 18);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 18');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 18, Jake');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 18, cdayz');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 18, DrWagner');

-- Train 19 departing from Little Rock, AR at 19:00:00 on 2017-02-03 arriving to Los Angeles, CA
-- Equipment car(s): 1605, 1606, 1607
-- Engineers: vincentmiller, AlJo4
-- Conductor(s): MozFart
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (19, '19:00:00', '2017-02-03');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (72201, '1400 W Markham Street', 19);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (90012, '801 Vignes Street', 19);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1605, 19);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1606, 19);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1607, 19);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('vincentmiller', 19);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('AlJo4', 19);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('MozFart', 19);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 19');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 19, vincentmiller');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 19, AlJo4');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 19, MozFart');

-- Trains after 2017-04-24 --------------------------------------------------

-- MASTER DELIVERY TRAIN
-- Train 3381 departing from Columbia, MO at 17:00:00 on 2017-04-25 arriving to Columbia, MO
-- Equipment car(s):
-- Engineers: WardP, JG
-- Conductor(s): VivaldiSouth
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (3381, '17:00:00', '2017-04-25');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (65201, '101 Rail Street', 3381);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (65201, '101 Rail Street', 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (501, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (502, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (503, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (506, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (507, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (508, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (603, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (604, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (605, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (703, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (705, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (706, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (802, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (803, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (804, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (901, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (902, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (904, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (905, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (906, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (907, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1008, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1103, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1104, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1105, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1106, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1107, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1201, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1202, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1203, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1301, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1302, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1303, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1304, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1305, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1402, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1403, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1406, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1407, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1408, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1501, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1502, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1504, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1505, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1601, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1602, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1605, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1606, 3381);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1607, 3381);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MBate', 3381);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('cdayz', 3381);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('VivaldiSouth', 3381);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 3381');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 3381, WardP');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 3381, JG');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 3381, VivaldiSouth'); 

-- Train 50 departing from Chicago, IL at 06:15:00 on 2017-04-25 arriving to Denver, CO
-- Equipment car(s): 504, 505
-- Engineers: MBate, cdayz
-- Conductor(s): 10ChopChop
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (50, '06:15:00', '2017-04-25');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (60606, '225 South Canal Street', 50);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (80202, '1701 Wynkoop Street', 50);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (504, 50);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (505, 50);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MBate', 50);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('cdayz', 50);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('10ChopChop', 50);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 50');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 50, MBate');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 50, cdayz');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 50, 10ChopChop');

-- Train 51 departing from St. Louis, MO at 06:30:00 on 2017-04-26 arriving to Rusk, TX
-- Equipment car(s): 601, 602
-- Engineers: RaineTrain, MarcosA52
-- Conductor(s): SnoopLiszt
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (51, '06:30:00', '2017-04-26');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (63103, '430 South 15th Street', 51);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (75785, '535 Park Road 76', 51);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (601, 51);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (602, 51);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('RaineTrain', 51);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MarcosA52', 51);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('SnoopLiszt', 51);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 51');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 51, RaineTrain');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 51, MarcosA52');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 51, SnoopLiszt');

-- Train 52 departing from St. Louis, MO at 06:45:00 on 2017-04-27 arriving to Portland, ME
-- Equipment car(s): 606, 607, 608
-- Engineers: Yoshi17, vincentmiller
-- Conductor(s): 25Strav
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (52, '06:45:00', '2017-04-27');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (63103, '430 South 15th Street', 52);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (04102, '100 Thompsons Point Road', 52);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (606, 52);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (607, 52);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (608, 52);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Yoshi17', 52);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('vincentmiller', 52);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('25Strav', 52);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 52');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 52, Yoshi17');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 52, vincentmiller');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 52, 25Strav');

-- Train 53 departing from kansas City, MO at 07:00:00 on 2017-04-28 arriving to Lincoln, NE
-- Equipment car(s): 701
-- Engineers: cdayz, JG
-- Conductor(s): YoungBeet
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (53, '07:00:00', '2017-04-28');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (64108, '30 West Pershing Road', 53);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (68508, '277 Pinnacle Arena Drive', 53);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (701, 53);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('cdayz', 53);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('JG', 53);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('YoungBeet', 53);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 53');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 53, cdayz');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 53, JG');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 53, YoungBeet');

-- Train 54 departing from Kansas City, MO at 07:30:00 on 2017-04-29 arriving to Little Rock, AR
-- Equipment car(s): 704
-- Engineers: samanthaXOXO, RTOWN
-- Conductor(s): CnD
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (54, '07:30:00', '2017-04-29');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (64108, '30 West Pershing Road', 54);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (72201, '1400 W Markham Street', 54);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (704, 54);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('samanthaXOXO', 54);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('RTOWN', 54);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('CnD', 54);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 54');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 54, samanthaXOXO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 54, RTOWN');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 54, CnD');

-- Train 55 departing from Kansas City, MO at 08:00:00 on 2017-04-30 arriving to St. Louis, MO
-- Equipment car(s): 707, 708
-- Engineers: MarcosA52, WardP
-- Conductor(s): PyotrTchaikovsky
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (55, '08:00:00', '2017-04-30');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (64108, '30 West Pershing Road', 55);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (63103, '430 South 15th Street', 55);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (707, 55);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (708, 55);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MarcosA52', 55);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('WardP', 55);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('PyotrTchaikovsky', 55);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 55');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 55, MarcosA52');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 55, WardP');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 55, PyotrTchaikovksy');

-- Train 56 departing from Los Angeles, CA at 08:45:00 on 2017-05-01 arriving to Searrle, WA
-- Equipment Car(s): 801
-- Engineers: JG, mkt008
-- Conductor(s): lilBrahms
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (56, '08:45:00', '2017-05-01');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (90012, '801 Vignes Street', 56);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (98104, '303 South Jackson Street', 56);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (801, 56);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('JG', 56);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('mkt008', 56);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('lilBrahms', 56);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 56');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 56, JG');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 56, mkt008');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 56, lilBrahms');

-- Train 57 departing from Los Angeles, CA at 09:15:00 on 2017-05-02 arriving to Rusk, TX
-- Equipment car(s): 805, 806, 807, 808
-- Engineers: mkt008, MBate
-- Conductor(s): GiaComo
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (57, '09:15:00', '2017-05-02');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (90012, '801 Vignes Street', 57);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (75785, '535 Park Road 76', 57);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (805, 57);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (806, 57);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (807, 57);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (808, 57);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('mkt008', 57);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MBate', 57);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('GiaComo', 57);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 57');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 57, mkt008');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 57, MBate');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 57, GiaComo');

-- Train 58 departing from Seattle, WA at 09:30:00 on 2017-05-03 arriving to Chicago, IL
-- Equipment car(s): 903
-- Engineers: vincentmiller, spiderman
-- Conductor(s): bigmahl
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (58, '09:30:00', '2017-05-02');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (98104, '303 South Jackson Street', 58);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (60606, '225 South Canal Street', 58);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (903, 58);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('vincentmiller', 58);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('spiderman', 58);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('bigmahl', 58);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 58');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 58, vincentmiller');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 58, spiderman');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 58, bigmahl');

-- Train 59 departing from Seattle, WA at 10:00:00 on 2017-05-03 arriving to St. Louis, MO
-- Equipment car(s): 908
-- Engineers: RTOWN, RaineTrain
-- Conductor(s): VivaldiSouth
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (59, '10:00:00', '2017-05-03');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (98104, '303 South Jackson Street', 59);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (63103, '430 South 15th Street', 59);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (908, 59);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('RTOWN', 59);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('RaineTrain', 59);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('VivaldiSouth', 59);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 59');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 59, RTOWN');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 59, RaineTrain');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 59, VivaldiSouth');

-- Train 60 departing from Portland, ME at 10:30:00 on 2017-05-04 arriving to Denver, CO
-- Equipment car(s): 1001, 1002, 1003, 1004, 1005, 1006, 1007
-- Engineers: spiderman, cdayz
-- Conductor(s): DrWagner
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (60, '10:30:00', '2017-05-04');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (04102, '100 Thompsons Point Road', 60);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (80202, '1701 Wynkoop Street', 60);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1001, 60);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1002, 60);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1003, 60);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1004, 60);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1005, 60);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1006, 60);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1007, 60);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('spiderman', 60);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('cdayz', 60);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('DrWagner', 60);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 60');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 60, spiderman');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 60, cdayz');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 60, DrWagner');

-- Train 61 departing from Jacksonville FL at 11:15:00 on 2017-05-05 arriving to Kansas City MO
-- Equipment car(s): 1101, 1102
-- Engineers: Yoshi17, samanthaXOXO
-- Conductor(s): YoungBeet
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (61, '11:15:00', '2017-05-05');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (32216, '6140 Philips Hwy', 61);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (64108, '30 West Pershing Road', 61);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1101, 61);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1102, 61);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Yoshi17', 61);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('samanthaXOXO', 61);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('YoungBeet', 61);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 61');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 61, Yoshi17');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 61, samanthaXOXO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 61, YoungBeet');

-- Train 62 departing from Jacksonville, FL at 11:45:00 on 2017-05-06 arriving to Lincoln, NE
-- Equipment car(s): 1108
-- Engineers: spiderman, vincentmiller
-- Conductor(s): GiaComo
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (62, '11:45:00', '2017-05-06');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (32216, '6140 Philips Hwy', 62);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (68508, '277 Pinnacle Arena Drive', 62);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1108, 62);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('spiderman', 62);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('vincentmiller', 62);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('GiaComo', 62);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 62');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 62, spiderman');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 62, vincentmiller');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 62, GiaComo');

-- Train 63 departing from Rusk, TX at 12:00:00 on 2017-05-07 arriving to Seattle, WA
-- Equipment car(s): 1204, 1205, 1206, 1207, 1208
-- Engineers: WardP, Yoshi17
-- Conductor(s): SnoopLiszt
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (63, '12:00:00', '2017-05-07');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (75785, '535 Park Road 76', 63);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (98104, '303 South Jackson Street', 63);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1204, 63);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1205, 63);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1206, 63);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1207, 63);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1208, 63);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('WardP', 63);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Yoshi17', 63);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('SnoopLiszt', 63);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 63');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 63, WardP');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 63, Yoshi17');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 63, SnoopLiszt');

-- Train 64 departing from Lincoln, NE at 12:30:00 on 2017-05-08 arriving to Los Angeles, CA
-- Equipment car(s): 1306, 1307, 1308
-- Engineers: RTOWN, JG
-- Conductor(s): Schub3rtV
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (64, '12:30:00', '2017-05-09');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (68508, '277 Pinnacle Arena Drive', 64);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (90012, '801 Vignes Street', 64);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1306, 64);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1307, 64);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1308, 64);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('RTOWN', 64);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('JG', 64);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('Schub3rtV', 64);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 64');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 64, RTOWN');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 64, JG');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 64, Schub3rtV');

-- Train 65 departing from Denver, CO at 13:00:00 on 2017-05-10 arriving to Kansas City, MO
-- Equipment car(s): 1401
-- Engineers: MBate, MarcosA52
-- Conductor(s): FelMendel
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (65, '13:00:00', '2017-05-10');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (80202, '1701 Wynkoop Street', 65);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (64108, '30 West Pershing Road', 65);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1401, 65);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MBate', 65);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MarcosA52', 65);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('FelMendel', 65);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 65');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 65, MBate');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 65, MarcosA52');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 65, FelMendel');

-- Train 66 departing from Denver, CO at 13:45:00 on 2017-05-11 arriving to St. Louis, MO
-- Equipment car(s): 1404, 1405
-- Engineers: RaineTrain, samanthaXOXO
-- Conductor(s): Youngbeet
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (66, '13:45:00', '2017-05-12');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (80202, '1701 Wynkoop Street', 66);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (63103, '430 South 15th Street', 66);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1404, 66);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1405, 66);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('RaineTrain', 66);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('samanthaXOXO', 66);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('Youngbeet', 66);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 66');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 66, RaineTrain');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 66, samanthaXOXO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 66, YoungBeet');

-- Train 67 departing from Little Rock, AR at 14:15:00 on 2017-05-13 arriving to Chicago, IL
-- Equipment car(s): 1503
-- Engineers: cdayz, WardP
-- Conductor(s): SteveR89
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (67, '14:15:00', '2017-05-13');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (72201, '1400 W Markham Street', 67);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (60606, '225 South Canal Street', 67);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1503, 67);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('cdayz', 67);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('WardP', 67);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('SteveR89', 67);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 67');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 67, cdayz');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 67, WardP');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 67, SteveR89');

-- Train 68 departing from Little Rock, AR at 15:00:00 on 2017-05-14 arriving to Portland, ME
-- Equipment car(s): 1506, 1507, 1508
-- Engineers: samanthaXOXO, MarcosA52
-- Conductor(s): CnD
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (68, '15:00:00', '2017-05-14');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (72201, '1400 W Markham Street', 68);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (04102, '100 Thompsons Point Road', 68);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1506, 68);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1507, 68);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1508, 68);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('samanthaXOXO', 68);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MarcosA52', 68);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('CnD', 68);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 68');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 68, samanthaXOXO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 68, MarcosA52');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 68, CnD');

-- Train 69 departing from Kansas City, MO at 15:15:00 on 2017-05-15 arriving to Jacksonville, FL
-- Equipment car(s): 1604
-- Engineers: JG, Yoshi17
-- Conductor(s): 10ChopChop
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (69, '15:15:00', '2017-05-15');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (64108, '30 West Pershing Road', 69);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (32216, '6140 Philips Hwy', 69);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1604, 69);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('JG', 69);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Yoshi17', 69);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('10ChopChop', 69);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 69');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 69, JG');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 69, Yoshi17');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 69, 10ChopChop');

-- Train 70 departing from Little Rock, AR at 16:30:00 on 2017-05-16 arriving to Los Angeles, CA
-- Equipment car(s): 1608
-- Engineers: MarcosA52, cdayz
-- Conductor(s): PyotrTchaikovsky
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (70, '16:30:00', '2017-05-16');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (72201, '1400 W Markham Street', 70);
INSERT INTO Destination (Zip, Address, TrainNumber) Values (90012, '801 Vignes Street', 70);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1608, 70);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MarcosA52', 70);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('cdayz', 70);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('PyotrTchaikovsky', 70);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 70');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 70, MarcosA52');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 70, cdayz');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 70, PyotrTchaikovsky');

-- Train 100 departing from Kansas City, MO at 08:00:00 on 2017-06-24 arriving to Los Angeles, CA
-- Equipment car(s): 700
-- Engineers: MBate
-- Conductor(s): SteveR89
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (100, '08:00:00', '2017-06-24');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (64108, '30 West Pershing Road', 100);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (90012, '801 Vignes Street', 100);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (700, 100);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('MBate', 100);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('samanthaXOXO', 100);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('SteveR89', 100);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 100');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 100, MBate');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 100, samanthaXOXO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 100, SteveR89');

-- Train 101 departing from Portland, ME at 09:00:00 on 2017-06-25 arriving to Rusk, TX
-- Equipment car(s): 1000
-- Engineers: WardP, vincentmiller
-- Conductor(s): 10ChopChop
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (101, '09:00:00', '2017-06-25');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (04102, '100 Thompsons Point Road', 101);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (75785, '535 Park Road 76', 101);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1000, 101);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('WardP', 101);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('vincentmiller', 101);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('10ChopChop', 101);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 101');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 101, WardP');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 101, vincentMiller');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 101, 10ChopChop');

-- Train 102 departing from Lincoln, NE at 10:00:00 on 2017-06-26 arriving to Little Rock, AR
-- Equipment car(s): 1500
-- Engineers: cdayz, mkt008
-- Conductor(s): YoungBeet
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (102, '10:00:00', '2017-06-26');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (68508, '277 Pinnacle Arena Drive', 102);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (72201, '1400 W Markham Street', 102);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1500, 102);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('cdayz', 102);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('mkt008', 102);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('YoungBeet', 102);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 102');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 102, cdayz');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 102, mkt008');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 102, YoungBeet');

-- Train 103 departing from Seattle, WA at 11:00:00 on 2017-06-27 arriving to Denver, CO
-- Equipment car(s): 900
-- Engineers: RaineTrain, JG
-- Conductor(s): lilBrahms
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (103, '11:00:00', '2017-06-27');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (98104, '303 South Jackson Street', 103);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (80202, '1701 Wynkoop Street', 103);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (900, 103);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('RaineTrain', 103);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('JG', 103);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('lilBrahms', 103);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 103');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 103, RaineTrain');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 103, JG');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 103, lilBrahms');

-- Train 104 departing from St. Louis, MO at 12:00:00 on 2017-06-28 arriving to  Lincoln, NE
-- Equiment car(s): 600
-- Engineers: Yoshi17, WardP
-- Conductor(s): PyotTchaikovsky
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (104, '12:00:00', '2017-06-28');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (63103, '430 South 15th Street', 104);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (68508, '277 Pinnacle Arena Drive', 104);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (600, 104);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('Yoshi17', 104);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('WardP', 104);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('PyotrTchaikovsky', 104);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 104');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 104, Yoshi17');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 104, WardP');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 104, PyotrTchaikovsky');

-- Train 105 departing from Chicago, IL at 13:00:00 on 2017-06-29 arriving to St. Louis, MO
-- Equipment car(s): 500
-- Engineers: mkt008, spiderman
-- Conductor(s): CnD
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (105, '13:00:00', '2017-06-29');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (60606, '225 South Canal Street', 105);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (63103, '430 South 15th Street', 105);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (500, 105);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('mkt008', 105);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('spiderman', 105);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('CnD', 105);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 105');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 105, mkt008');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 105, spiderman');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 105, CnD');

-- Train 106 departing from Kansas City, MO at 14:00:00 on 2017-06-30 arriving to Portland, ME
-- Equipment car(s): 1300
-- Engineers: JG, MBate
-- Conductor(s): Schub3rtV
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (106, '14:00:00', '2017-06-30');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (64108, '30 West Pershing Road', 106);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (04102, '100 Thompsons Point Road', 106);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1300, 106);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('JG', 106);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MBate', 106);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('Schub3rtV', 106);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 106');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 106, JG');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 106, MBate');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 106, Schub3rtV');

-- Train 107 departing from Denver, CO at 15:00:00 on 2017-07-01 arriving to Jacksonville, FL
-- Equipment car(s): 1400
-- Engineers: vincentmiller, cdayz
-- Conductor(s): SnoopLiszt
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (107, '15:00:00', '2017-07-01');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (80202, '1701 Wynkoop Street', 107);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (32216, '6140 Philips Hwy', 107);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1400, 107);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('vincentmiller', 107);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('cdayz', 107);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('SnoopLiszt', 107);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 107');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 107, vincent');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 107, cdayz');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 107, SnoopLiszt');

-- Train 108 departing from Rusk, TX at 16:00:00 on 2017-07-02 arriving to Los Angeles, CA
-- Equipment car(s): 1200
-- Engineers: RTOWN, RaineTrain
-- Conductor(s): DrWagner
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (108, '16:00:00', '2017-07-02');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (75785, '535 Park Road 76', 108);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (90012, '801 Vignes Street', 108);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1200, 108);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('RTOWN', 108);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('RaineTrain', 108);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('DrWagner', 108);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 108');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 108, RTOWN');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 108, RaineTrain');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 108, DrWagner');

-- Train 109 departing from Little Rock, AR at 17:00:00 on 2017-07-03 arriving to Kansas City, MO
-- Equipment car(s): 1600
-- Engineers: spiderman, Yoshi17
-- Conductor(s): 25Strav
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (109, '17:00:00', '2017-07-03');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (72201, '1400 W Markham Street', 109);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (64108, '30 West Pershing Road', 109);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1600, 109);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('spiderman', 109);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('Yoshi17', 109);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('25Strav', 109);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 109');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 109, spiderman');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 109, Yoshi17');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 109, 25Strav');

-- Train 110 departing from Jacksonville, FL at 18:00:00 on 2017-07-04 arriving to Chicago, IL
-- Equipment car(s): 800
-- Engineers: samathaXOXO, MBate
-- Conductor(s): FelMendel
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (110, '18:00:00', '2017-07-04');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (32216, '6140 Philips Hwy', 110);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (60606, '225 South Canal Street', 110);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (800, 110);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('samanthaXOXO', 110);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('MBate', 110);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('FelMendel', 110);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 110');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 110, samanthaXOXO');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 110, MBate');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 110, FelMendel');

-- Train 111 departing from Jacksonville, FL at 19:00:00 on 2017-07-05 arriving to Los Angeles, CA
-- Equipment car(s): 1100
-- Engineers: RTOWN, WardP
-- Conductor(s): VivaldiSouth
INSERT INTO Train (TrainNumber, DepartureTime, DepartureDate) VALUES (111, '19:00:00', '2017-07-05');
INSERT INTO Departure (Zip, Address, TrainNumber) VALUES (32216, '6140 Philips Hwy', 111);
INSERT INTO Destination (Zip, Address, TrainNumber) VALUES (90012, '801 Vignes Street', 111);
INSERT INTO EngineHistory (SerialNumber, TrainNumber) VALUES (1100, 111);
INSERT INTO EngineerHistory (UserID, TrainNumber) VALUES ('RTOWN', 111);
INSERT INTO EngineerHistory (UserId, TrainNumber) VALUES ('WardP', 111);
INSERT INTO ConductorHistory (UserID, TrainNumber) VALUES ('VivaldiSouth', 111);
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateTrain 111');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 111, RTOWN');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'EngineerHistoryCreated 111, WardP');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'ConductorHistoryCreated 111, VivaldiSouth');

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- RESERVATIONS --
-- INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (, , '', '');
-- INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('', '', , , '');

-- Arranged by before/after date & ascending Equipment SerialNumber 

-- Reservations before 2017-04-24 -------------------------------
--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (1, 502, 'PalmTomm', 'Electronics');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 1, 502');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (1, 503, 'PalmTomm', 'Electronics');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 1, 503');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (2, 507, '57jpat', 'Clothing');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 2, 507');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (4, 604, 'Bsbt47', 'Hardware');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 3, 604');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (5, 702, 'IMorgan07', 'Tires');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 5, 702');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (5, 703, 'WaltGisney', 'Offfice Supplies');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 5, 703');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (7, 802, 'HersheyAndy', 'Kitchenware');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 7, 802');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (7, 803, 'HersheyAndy', 'Groceries');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 7, 803');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (7, 804, 'bhoagie', 'Cardboard');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 7, 804');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (8, 901, 'LSquared2', 'Groceries');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 8, 901');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (8, 902, 'LSquared2', 'Groceries');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 8, 902');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (10, 1008, 'bill1337', 'Computer Parts');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 10, 1008');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (11, 1103, 'monicaJ91', 'Hardware');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 11, 1103');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (11, 1104, 'monicaJ91', 'Cables');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 11, 1104');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (11, 1106, 'OliveTea35', 'Phone Parts');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 11, 1106');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (11, 1107, 'PalmTomm', 'Electronics');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 11, 1107');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (12, 1201, '57jpat', 'Tools');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 12, 1201');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (12, 1202, '57jpat', 'Health Care');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 12, 1203');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (13, 1301, 'Tdogg05', 'Clothing');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 13, 1301');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (13, 1302, 'Tdogg05', 'Groceries');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 13, 1302');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (13, 1305, '57jpat', 'Clothing');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 13, 1305');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (14, 1402, 'Bsbt47', 'Electronics');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 14, 1402');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (14, 1403, 'OliveTea35', 'Phone Parts');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 14, 1403');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (15, 1407, 'WaltGisney', 'Animation Tools');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 15, 1407');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (15, 1408, 'bhoagie', 'Office Supplies');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 15, 1408');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (16, 1501, 'HersheyAndy', 'Kitchenware');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 16, 1501');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (16, 1502, 'Tdogg05', 'Office Supplies');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 16, 1502');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (17, 1504, 'monicaJ91', 'Computers');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 17, 1504');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (18, 1602, 'LSquared2', 'Groceries');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 18, 1602');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (19, 1605, 'Slove1', 'Coffee');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 19, 1605');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (19, 1606, 'Slove1', 'Kitchen Supplies');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 19, 1606');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (19, 1607, 'Slove1', 'Beverage Tools');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 19, 1607');

-- Reservations after 2017-04-24 -------------------------------

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (52, 608, 'bhoagie', 'Office Supplies');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 52, 608');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (55, 707, 'HersheyAndy', 'Baking Supply');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 55, 707');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (55, 708, 'HersheyAndy', 'Kitchenware');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 55, 708');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (60, 1002, 'OliveTea35', 'Phone Parts');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 60, 1002');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (60, 1003, 'PalmTomm', 'Phone Parts');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 60, 1003');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (60, 1004, 'monicaJ91', 'Electronics');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 60, 1004');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (63, 1206, 'LSquared2', 'Food');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 63, 1206');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (63, 1207, 'Tdogg05', 'Personal Hygiene');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 63, 1207');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (63, 1208, '57jpat', 'Toys');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 63, 1208');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (67, 1503, 'Bsbt47', 'Hardware');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 67, 1503');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (68, 1507, 'IMorgan07', 'Auto Parts');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 68, 1507');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (69, 1508, 'TDogg05', 'Home Decor');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 69, 1508');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (105, 500, 'LSquared2', 'Groceries');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 105, 500');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (104, 600, 'OliveTea35', 'Cables');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 104, 600');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (100, 700, 'Tdogg05', 'Groceries');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 100, 700');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (110, 800, 'bill1337', 'Hardware');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 110, 800');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (103, 900, 'IMorgan07', 'Auto Parts');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 103, 900');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (101, 1000, 'PalmTomm', 'Electronics');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 101, 1000');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (108, 1200, 'bhoagie', 'Office Supplies');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 108, 1200');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (106, 1300, 'Bsbt47', 'Hardware');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 106, 1300');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (107, 1400, 'monicaJ91', 'Electronics');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 107, 1400');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (102, 1500, '57jpat', 'Clothing');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 102, 1500');

--
INSERT INTO Reservation (TrainNumber, SerialNumber, UserID, Cargo) VALUES (109, 1600, 'HersheyAndy', 'Baking Supplies');
INSERT INTO LogEntry (UserID, IP, LogDate, LogTime, ActionKey) VALUES ('admin', 'localhost', CURDATE(), CURTIME(), 'CreateReservation 109, 1600');
