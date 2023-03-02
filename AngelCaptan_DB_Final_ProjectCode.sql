DROP DATABASE IF EXISTS `ShiftingGears`;
CREATE database `ShiftingGears`;
USE `ShiftingGears`;


#Normalised Tables

CREATE TABLE `LearnerType` (
    learner_type int(1) auto_increment,
    learner_type_program varchar(25),
    PRIMARY KEY (learner_type)
);

CREATE TABLE `VehicleType` (
    vehicle_type int(1) auto_increment,
    vehicle_type_name varchar(12),
    PRIMARY KEY (vehicle_type)
);

CREATE TABLE `LessonType` (
    lesson_type int(1) auto_increment,
    lesson_type_name varchar(25),
    PRIMARY KEY (lesson_type)
);

#Entity Table Creation

CREATE TABLE `Learner` (
`learner_id` int(11) auto_increment NOT NULL,
`last_name` varchar(30) NOT NULL,
`first_name` varchar(30) NOT NULL,
`gender` varchar(1) NOT NULL CHECK ( gender = 'M' or gender = 'F' ),
`date_of_birth` date NOT NULL,
`address` varchar(200) NOT NULL,
`contact` varchar(15) UNIQUE NOT NULL,
`email_address` varchar(50) UNIQUE NOT NULL,
`learner_type` int(1) NOT NULL,
PRIMARY KEY (learner_id),
FOREIGN KEY (learner_type) REFERENCES LearnerType(learner_type)
);


CREATE TABLE `Instructor` (
`instructor_id` int(11) auto_increment NOT NULL,
`last_name` varchar(30) NOT NULL,
`first_name` varchar(30) NOT NULL,
`gender` varchar(1) NOT NULL CHECK ( gender = 'M' or gender = 'F' ),
`date_of_birth` date NOT NULL,
`contact` varchar(15)  UNIQUE NOT NULL,
PRIMARY KEY (instructor_id)
);



CREATE TABLE `Vehicles` (
`vehicle_id` int(11) auto_increment NOT NULL,
`license_plate` varchar(10) NOT NULL,
`vehicle_name` varchar(12) NOT NULL,
`vehicle_model` varchar(15) NOT NULL,
`vehicle_type` int(1) NOT NULL,
PRIMARY KEY (vehicle_id),
FOREIGN KEY (vehicle_type) REFERENCES VehicleType (vehicle_type)
);



CREATE TABLE `Lessons` (
`lessons_id` int(11) auto_increment NOT NULL,
`lesson_name` varchar(50) NOT NULL,
`description` varchar(255) NOT NULL,
`no_of_days` int(2) NOT NULL,
`lesson_type` int(1) NOT NULL,
PRIMARY KEY (lessons_id),
FOREIGN KEY (lesson_type) REFERENCES LessonType (lesson_type)
);



CREATE TABLE `Timetable` (
`timetable_id` int(11) auto_increment NOT NULL,
`vehicle_id` int(11) NOT NULL,
`instructor_id` int(11) NOT NULL,
`lessons_id` int(11) NOT NULL,
`amount` float NOT NULL,
`starttime` time NOT NULL,
`endtime` time NOT NULL,
PRIMARY KEY (timetable_id),
FOREIGN KEY (vehicle_id) REFERENCES Vehicles (vehicle_id),
FOREIGN KEY (instructor_id) REFERENCES Instructor (instructor_id),
FOREIGN KEY (lessons_id) REFERENCES Lessons (lessons_id)
);



CREATE TABLE `Enrollment` (
`date` date NOT NULL,
`enrollment_id` int(11) auto_increment NOT NULL,
`timetable_id` int(11) NOT NULL,
`learner_id` int(11) NOT NULL,
`firsttime_enrollment` bool NOT NULL,
`paid` bool NOT NULL,
PRIMARY KEY (enrollment_id),
FOREIGN KEY (timetable_id) REFERENCES Timetable(timetable_id),
FOREIGN KEY (learner_id) REFERENCES Learner(learner_id)
);



CREATE TABLE `Performance_Report` (
`learner_id` int(11) NOT NULL,
`instructor_id` int(11) NOT NULL,
`lessons_id` int(2) NOT NULL,
`raw_score` float NOT NULL,
`remarks` varchar(255) NOT NULL,
FOREIGN KEY (learner_id) REFERENCES Learner(learner_id),
FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id),
FOREIGN KEY (lessons_id) REFERENCES Lessons(lessons_id)
);



#Data Population

INSERT INTO Learnertype (`learner_type_program`)
VALUES  ('Premium'),
		('Standard');


    
INSERT INTO VehicleType (`vehicle_type_name`)
VALUES  ('Car'),
		('Motorbike'),
        ('Bus'),
        ('Truck');
        
INSERT INTO LessonType (`lesson_type_name`)
VALUES  ('Theory'),
        ('Practical');


INSERT INTO Learner (`last_name`,`first_name`,`gender`,`date_of_birth`,`address`,`contact`,`email_address`,`learner_type`)
VALUES  ('Jefferson', 'Nancy','F','2002-08-12','Emefs Lagoon View Estate, Lashibi, Ghana', '0203601135','pinkie_klein@hotmail.com','1'),
		('Alberto', 'Weiss','M','1978-04-16', 'Sakumono Beach Estate, Sakumono, Ghana', '0573487683', 'jevon_kuhic34@hotmail.com','2'),
		('Howe', 'Jeannine','F','1998-12-31', 'Regimmanuel Grey Estate , Spintex, Ghana', '0244670087', 'nyah78@yahoo.com','1'),
		('Campos', 'Margery','F','2002-04-10','Riverside Golf Estate, Community 16, Tema, Ghana', '020346789', 'margery23@gmail.com','2'),
		('Ruth', 'Barbera','F','1992-06-22',	'Airport Residential, Airport, Ghana', '0244580037', 'rahsaan96@gmail.com','1'),
		('Calvs', 'Jackson','M','2001-11-17','Butterfly Estate, Community 6, Tema', '0508740261', 'clementine_bailey95@gmail.com','2');


INSERT INTO Instructor (`last_name`,`first_name`,`gender`,`date_of_birth`,`contact`)
VALUES  ('Kwame', 'Eugene','M','1989-10-19', '02036457835'),
		('Lando', 'Norrisa','F','1979-11-26', '0579804683'),
		('Leclerc', 'Charles','M','1982-07-30', '0567670087'),
		('Sakodi', 'Brendan','M','1967-06-18', '0203302712'),
		('Poppins', 'Mary','F','1970-08-10','0244588639'), 
		('Diesel', 'Vin','M','1990-12-17','0886740261');
        
INSERT INTO Vehicles (`license_plate`,`vehicle_name`,`vehicle_model`,`vehicle_type`)
VALUES  ('7FHH588', 'Nissan','Altima','1'),
		('DCA143', 'Honda','Civic','1'),
		('6PTR818', 'Yamaha','YZ450F','2'),
		('7MNF936', 'Mercedes','O6600H','3'),
		('6HQB325', 'Kia','Morning','1'), 
		('6FJN484', 'MAN','TGX','4');
        
INSERT INTO Lessons (`lesson_name`,`description`,`no_of_days`,`lesson_type`)
VALUES  ('Car Knowledge & Maintenance', 'From Learning The Parts of a CAr to Checking the Engine Oil, Water, Tire Pressure and Changing a Tire is all Covered. ','3','1'),
		('Theoretical Lessons','Covers Everything That You Need to Know to Pass Road Science & Signs Theory Test','14','1'),
		('Parking', 'Parking a Vehicle in Parking Spaces Parallel To The Road, In Cramped Spaces & From Any Direction','3','2'),
		('Changing Gears','Teaching of What All The Gears Represent & How To  Use & Maintain Them.','1','2'),
        ('Mirrors & Signals','Teaching of How To Use The Mirrors and Signals of a Car Accurately','1','2'),
        ('Handling',' How Best To Handle a Car in Posture, Steering Wheel Handling, Start and Stopping','5','2');
        
INSERT INTO Timetable (`vehicle_id`,`instructor_id`,`lessons_id`,`amount`,`starttime`,`endtime`)
VALUES  ('1','1','1','5000.50','11:00:00','01:30:00'),
		('2','2','2','3500.50','11:00:00','01:30:00'),
		('3','3','3','5000.50','11:00:00','01:30:00'),
		('4','4','4','3500.50','04:00:00','06:30:00'),
		('5','5','5','5000.50','04:00:00','06:30:00'),
        ('6','6','6','3500.50','04:00:00','06:30:00'),
        ('1','1','5','5000.50','11:00:00','01:30:00'),
        ('2','2','4','3500.50','11:00:00','01:30:00');
        
INSERT INTO Enrollment (`date`,`timetable_id`,`learner_id`,`firsttime_enrollment`,`paid`)
VALUES  ('2022-12-13','1', '1',1,1),
		('2022-12-14','2', '2',1,1),
		('2022-12-15','3', '3',1,1),
		('2022-12-13','4', '4',1,1),
		('2022-12-14','5', '5',1,1), 
		('2022-12-15','6', '6',1,1),
        ('2022-12-16','7', '5',1,1),
		('2022-12-17','8', '4',1,1),
		('2022-12-18','1', '3',1,1),
		('2022-12-16','2', '2',1,1),
		('2022-12-17','3', '1',2,1), 
		('2022-12-18','4', '6',2,1);
        
INSERT INTO Performance_Report (`learner_id`,`instructor_id`,`lessons_id`,`raw_score`,`remarks`)
VALUES  ('1','1','1','85','Focus On Online Research on Car Maintenance To Improve Grade'),
		('2','2','2','78','Read The DVLA Road Science Book In Freetime To Improve Grade'),
        ('3','3','3','67','Practice In More Tightly Cramped Parking Lots To Improve Parking Accuracy'),
        ('4','4','4','90.4','Research on How Not To Damage Gear Box In Order To Optimize Grade'),
        ('5','5','5','74',' Rely More On Side Mirrors Than Turning Your Whole Body to the Rear View Window When Reversing To Improve Grade'),
        ('6','6','6','69.5','Drive More & Improve Confidence In Order To Improve Handling Skills & Grade'),
        ('5','1','4','98.2','Stop Putting Handbrake On Before Putting Car in Park When You Come To A Stop, It Will Damage The Gearbox Overtime'),
        ('4','2','3','92.4','Learn To Move Slower When Parking In Order To Avoid Crashes.'),
        ('3','5','2','76.8','Take Time Out To Read Road Signs Pamphlet In Order To Identify Signs Better On The Road'),
        ('2','4','1','60.1','Reread the Maintenance pdf & Do Some Online Research in Order to Improve grade and Car knowledge..Extra Classes Encouraged');


#Queries

#School Wants A Specific Students name, address contact, whether they have paid, their date enrolled and what type of learner they are.
SELECT Learner.first_name , Learner.last_name , Learner.address , Learner.contact , Enrollment.paid , Enrollment.date , LearnerType.learner_type
FROM  LearnerType, Learner
inner join Enrollment
on Learner.learner_id = Enrollment.learner_id
WHERE first_name LIKE 'Margery%' AND
enrollment.learner_id = Learner.learner_id AND
Learner.learner_type = LearnerType.learner_type;
 
 
#Instructors will be able to view all practical specific driving lessons’, their descriptions, the number of days to complete those lessons and what vehicles are attached to them, set by the school .
SELECT LessonType.lesson_type , Lessons.lesson_name , Lessons.description , Lessons.no_of_days , Timetable.vehicle_id , Vehicles.vehicle_name , Vehicles.vehicle_model , VehicleType.vehicle_type_name
FROM LessonType, Vehicles , VehicleType, Lessons
left join Timetable
on Timetable.lessons_id = Lessons.lessons_id
WHERE Vehicles.vehicle_id = Timetable.vehicle_id AND
Vehicles.vehicle_type = VehicleType.vehicle_type AND
Lessons.lesson_type = LessonType.lesson_type AND
LessonType.lesson_type = 2 ;


#Number of vehicles the institution uses to teach the learners
SELECT COUNT(vehicle_id) as number_of_vehicles 
FROM Vehicles ;


#Learners will be able to view the course they took and their scores associated from that lesson
SELECT Lessons.lesson_name , Performance_Report.raw_score , Performance_Report.remarks
FROM  Learner , Lessons
left join Performance_Report
ON Lessons.lessons_id = Performance_Report.lessons_id 
WHERE Performance_Report.learner_id = Learner.learner_id AND
Learner.first_name LIKE 'Weiss%' ;



#School will be able to see an ordered score rankings of their learners to hold overall class performances
SELECT  Learner.first_name , Learner.last_name , Lessons.lesson_name , Performance_Report.raw_score , Learner.contact , Performance_Report.remarks
FROM  Learner , Lessons
left join Performance_Report
ON Lessons.lessons_id = Performance_Report.lessons_id 
WHERE Performance_Report.learner_id = Learner.learner_id
ORDER BY  Performance_Report.raw_score DESC;



#Find the learners in the practical session, the instructor that took them and the lesson they did.
SELECT CONCAT(Learner.first_name, ' ' ,  Learner.last_name) AS Learner_Name, Lessons.lesson_type, Lessons.lesson_name, CONCAT(Instructor.first_name, ' ' ,  Instructor.last_name) AS Instructor_Name
FROM Learner , Lessons , Instructor , LessonType , Timetable, Enrollment
WHERE LessonType.lesson_type = Lessons.lesson_type AND
Lessons.lessons_id = Timetable.lessons_id AND
Timetable.instructor_id = Instructor.instructor_id AND
Timetable.timetable_id = Enrollment.timetable_id AND
Enrollment.learner_id = Learner.learner_id AND
LessonType.lesson_type_name in('Practical');
