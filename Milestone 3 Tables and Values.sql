USE master;
GO

IF EXISTS(SELECT * FROM sys.databases WHERE name='CasinoDatabase')
BEGIN
	ALTER DATABASE CasinoDatabase SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE CasinoDatabase;
END


CREATE DATABASE CasinoDatabase;
GO

USE CasinoDatabase;
GO

CREATE TABLE SKILLS (
    SKILL_ID INT PRIMARY KEY IDENTITY(1,1),
    SKILL_NAME VARCHAR(100) NOT NULL UNIQUE,
);

CREATE TABLE SECTION (
    SECT_CODE INT PRIMARY KEY IDENTITY(1,1),
    SECT_NAME VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE SECTION_SKILLS (
    SKILL_ID INT NOT NULL,
    SECT_CODE INT NOT NULL,
    PRIMARY KEY (SKILL_ID, SECT_CODE),
    FOREIGN KEY (SKILL_ID) REFERENCES SKILLS (SKILL_ID),
    FOREIGN KEY (SECT_CODE) REFERENCES SECTION (SECT_CODE)
);

CREATE TABLE EMPLOYEE_ROLE(
    ROLE_CODE INT PRIMARY KEY IDENTITY(1,1),
    ROLE_TITLE VARCHAR(100) NOT NULL,
    ROLE_DESCRIPTION VARCHAR(1000) NOT NULL
);

CREATE TABLE CERTIFICATION (
    CERT_CODE INT PRIMARY KEY IDENTITY(1,1),
    CERT_NAME VARCHAR(100) NOT NULL,
    CERT_VALID_FOR DATE NOT NULL,
    CERT_ISSUED_BY VARCHAR(100) NOT NULL
);

CREATE TABLE EMP_ROLE_CERT (
    ROLE_CODE INT NOT NULL,
    CERT_CODE INT NOT NULL,
    PRIMARY KEY (ROLE_CODE, CERT_CODE),
    FOREIGN KEY (ROLE_CODE) REFERENCES EMPLOYEE_ROLE(ROLE_CODE),
    FOREIGN KEY (CERT_CODE) REFERENCES CERTIFICATION(CERT_CODE)
);

CREATE TABLE DEPARTMENT	(
	DEPT_ID INT PRIMARY KEY IDENTITY(1,1),
	DEPT_NAME VARCHAR(100) NOT NULL
);

CREATE TABLE EMPLOYEE (
    EMP_ID INT PRIMARY KEY IDENTITY(1,1),
    EMP_FNAME VARCHAR(100) NOT NULL,
    EMP_LNAME VARCHAR(100) NOT NULL,
    EMP_GENDER VARCHAR(100) NOT NULL,
    EMP_STREET VARCHAR(100) NOT NULL,
    EMP_CITY VARCHAR(100) NOT NULL,
    EMP_PROVINCE VARCHAR(100) NOT NULL,
    EMP_ZIP VARCHAR(100) NOT NULL,
    EMP_DOB DATE NOT NULL,
    EMP_HIRE_DATE DATE NOT NULL,
    EMP_FIRE_DATE DATE,
    EMP_DEPART_DATE DATE,
    EMP_LOCKER INT,
    EMP_PAY_RATE DECIMAL(8,2) NOT NULL,
    EMP_VACATION_ENTITLEMENT INT NOT NULL,
    EMP_SICK_DAYS_ENTITLEMENT INT NOT NULL,
    DEPT_ID INT NOT NULL,
    ROLE_CODE INT NOT NULL,
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID),
    FOREIGN KEY (ROLE_CODE) REFERENCES EMPLOYEE_ROLE(ROLE_CODE)
);

CREATE TABLE SCHEDULE (
  SCH_ID INT PRIMARY KEY IDENTITY(1,1),
  SCH_DATE DATE NOT NULL,
  EMP_ID INT NOT NULL,
  FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE (EMP_ID)
);

CREATE TABLE DEPARTMENT_HISTORY (
    HIST_ID INT PRIMARY KEY IDENTITY(1,1),
    HIST_START_DATE DATE NOT NULL,
    HIST_END_DATE DATE NOT NULL,
    DEPT_ID INT NOT NULL,
    EMP_ID INT NOT NULL,
    ROLE_CODE INT NOT NULL,
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
    FOREIGN KEY (ROLE_CODE) REFERENCES EMPLOYEE_ROLE(ROLE_CODE)
);

CREATE TABLE TRAINING_SESSION (
TRAIN_ID INT PRIMARY KEY IDENTITY(1,1),
TRAIN_DATE DATE NOT NULL,
TRAIN_START_TIME TIME NOT NULL,
TRAIN_END_TIME TIME NOT NULL,
CERT_CODE INT NOT NULL UNIQUE,
FOREIGN KEY (CERT_CODE) REFERENCES CERTIFICATION (CERT_CODE)
);

CREATE TABLE EMP_TRAIN_SESSION (
    TRAIN_ID INT NOT NULL,
    EMP_ID INT NOT NULL,
    EMP_TRAIN_ROLE VARCHAR(100) NOT NULL ,
    TRAIN_OUTCOME VARCHAR(4) NOT NULL,
    TRAIN_EXPIRY_DATE DATE NOT NULL,
    PRIMARY KEY (Train_ID, EMP_ID),
	FOREIGN KEY (TRAIN_ID) REFERENCES TRAINING_SESSION (TRAIN_ID),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE (EMP_ID)
);

CREATE TABLE INVENTORY (
	INV_ID INT PRIMARY KEY IDENTITY(1,1),
	INV_TITLE VARCHAR(100) NOT NULL,
	INV_PRICE DECIMAL(8,2) NOT NULL,
	INV_QNTY INT NOT NULL,
);

CREATE TABLE LEAVE (
	LEAVE_ID INT PRIMARY KEY IDENTITY(1,1),
	LEAVE_TYPE VARCHAR(100) NOT NULL,
	LEAVE_START DATE NOT NULL,
	LEAVE_END DATE,
	LEAVE_COMMENTS VARCHAR(1000),
	EMP_ID INT NOT NULL,
	FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
);

CREATE TABLE WRITTEN_WARNING (
	WW_ID INT PRIMARY KEY IDENTITY(1,1),
	WW_DATE DATE NOT NULL,
	WW_OFFENCE VARCHAR(100) NOT NULL,
	WW_COMMENTS VARCHAR(1000) NOT NULL,
	EMP_ID INT NOT NULL,
	FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
);

CREATE TABLE SHIFT(
    SHIFT_ID INT PRIMARY KEY IDENTITY(1,1),
    SHIFT_START DATETIME NOT NULL,
    SHIFT_END DATETIME NOT NULL,
    SECT_CODE INT NOT NULL,
    EMP_ID INT NOT NULL,
    SCH_ID INT NOT NULL,
    FOREIGN KEY (SCH_ID) REFERENCES SCHEDULE(SCH_ID),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
    FOREIGN KEY (SECT_CODE) REFERENCES SECTION(SECT_CODE)
);

CREATE TABLE SHIFT_INVENTORY (
    SHIFT_ID INT NOT NULL,
    INV_ID INT NOT NULL,
    PRIMARY KEY (SHIFT_ID, INV_ID),
    FOREIGN KEY (SHIFT_ID) REFERENCES SHIFT(SHIFT_ID),
    FOREIGN KEY (INV_ID) REFERENCES INVENTORY(INV_ID)
);

INSERT INTO SKILLS (SKILL_NAME) VALUES
('Gambling Practices'),
('Customer Service'),
('Gaming Regulations and Laws'),
('Conflict Resolution'),
('Security and Safety Procedures'),
('Emergency Protocols and First Aid'),
('Alcohol Awareness'),
('Fraud Detection and Prevention'),
('Accounting'),
('Anti-Money Laundering Laws and Procedures');

INSERT INTO SECTION (SECT_NAME) VALUES ('NORTH'), ('SOUTH'), ('EAST'), ('WEST'), ('HIGH LIMIT AREA');

INSERT INTO SECTION_SKILLS (SKILL_ID, SECT_CODE) VALUES
(1,1), (2,2), (3,3), (4,4),
(5,1), (6,2), (7,3), (8,4),
(9,1), (10,2);

INSERT INTO EMPLOYEE_ROLE (ROLE_TITLE, ROLE_DESCRIPTION) VALUES
('Director of Operations', 'The Director of Operations manages the ' +
                           'Slot Floor and a diverse team to achieve company objectives, ' +
                           'responsible for profit and loss, customer service scores, and ' +
                           'floor quality. They coordinate with various teams, lead status ' +
                           'update meetings, set clear goals, and provide guidance to shift ' +
                           'managers and support staff. They oversee regional area operations, ' +
                           'including adherence to project deadlines, budgets, quality, and ' +
                           'customer satisfaction. The role requires attendance at mandatory ' +
                           'outside trainings.'),
('Shift manager', 'The Shift Manager is responsible for the overall management ' +
                  'of the casino floor, including hiring and firing employees, ' +
                  'ensuring that gaming regulations and laws are followed, and ' +
                  'handling high-profile customers. They oversee employee training ' +
                  'and development, create and maintain tracking logs, and handle ' +
                  'customer complaints escalated from the supervisor level. ' +
                  'Additionally, they manage money and games and provide discipline ' +
                  'and development plans for employees.'),
('Floor Supervisor', 'The Floor Supervisor is responsible for overseeing and ' +
                     'managing Slot Attendants by providing on-the-job training, ' +
                     'guidance, and resources to ensure adequate job performance. ' +
                     'They also schedule and conduct in-house trainings and monitor ' +
                     'staff schedules. The Floor Supervisor is responsible for ' +
                     'maintaining a clean, safe, friendly and fun environment for ' +
                     'guests and employees and ensuring superior guest service. ' +
                     'They conduct pre-shift meetings with slot attendants and schedule ' +
                     'mandatory regulatory online certification/re-certification for them.'),
('Slot Attendance', 'The Slot Attendance is responsible for providing customer ' +
                    'service in a casino''s slot machine section. ' +
                    'Their responsibilities include ensuring that slot ' +
                    'machines are functioning properly, promoting special ' +
                    'programs offered by the casino, making change for customers, ' +
                    'and reserving slots for customers. They are also responsible for ' +
                    'balancing the float at the end of the day and attending in-house ' +
                    'and online trainings. A valid government-issued certification is ' +
                    'required for this position.'),
('Human Resources', 'The Human Resources department is responsible ' +
                    'for various tasks related to employee management, ' +
                    'including maintaining employee records and discipline ' +
                    'records, creating letters of employment, issuing records ' +
                    'of employment to departing employees, and tracking vacation ' +
                    'and sick leave. It may also handle payroll.');

INSERT INTO CERTIFICATION (CERT_NAME, CERT_VALID_FOR, CERT_ISSUED_BY) VALUES
('Responsible Gambling', '2023-01-20', 'British Columbia Government'),
('Anti-Money Laundering', '2024-05-31', 'British Columbia Government'),
('Food Safe', '2025-08-31', 'British Columbia Government'),
('Serving It Right', '2024-10-31', 'British Columbia Government'),
('Occupational First Aid Level 1', '2026-03-31', 'British Columbia Government'),
('WHMIS', '2023-02-14', 'British Columbia Government'),
('Respectful Workplace', '2025-04-30', 'British Columbia Government'),
('Problem Gambling', '2024-09-30', 'British Columbia Government'),
('Crisis Management', '2023-12-31', 'British Columbia Government'),
('Code of Conduct', '2023-04-30', 'British Columbia Government');

INSERT INTO EMP_ROLE_CERT (ROLE_CODE, CERT_CODE) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10),
(3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10),
(5, 1), (5, 2), (5, 3), (5, 4), (5, 5);

INSERT INTO DEPARTMENT (DEPT_NAME) VALUES ('Administration'),
('Finance'),
('Human Resources'),
('Entertainment'),
('Maintenance'),
('Security'),
('Marketing and Promotions'),
('Housekeeping'),
('Food and Beverage'),
('Gaming');

INSERT INTO EMPLOYEE (EMP_FNAME, EMP_LNAME, EMP_GENDER, EMP_STREET, EMP_CITY, EMP_PROVINCE, EMP_ZIP, EMP_DOB, EMP_HIRE_DATE, EMP_FIRE_DATE, EMP_DEPART_DATE, EMP_LOCKER, EMP_PAY_RATE, EMP_VACATION_ENTITLEMENT, EMP_SICK_DAYS_ENTITLEMENT, DEPT_ID, ROLE_CODE) VALUES
('John', 'Smith', 'M', '123 Main St', 'Toronto', 'Ontario', 'M1N 2P3', '1965-03-14', '2020-01-01', NULL, NULL, 1, 20.00, 5, 5, 1, 1),
('Sarah', 'Johnson', 'F', '456 Maple Ave', 'Vancouver', 'British Columbia', 'V6B 2G2', '1990-06-22', '2018-06-01', NULL, NULL, 2, 25.00, 5, 5, 2, 2),
('David', 'Lee', 'M', '789 Oak St', 'Montreal', 'Quebec', 'H4C 2S2', '1988-12-05', '2019-05-15', NULL, NULL, 3, 22.50, 5, 5, 1, 2),
('Emily', 'Chen', 'F', '321 Elm Rd', 'Calgary', 'Alberta', 'T2N 1R5', '1995-09-30', '2021-02-15', NULL, NULL, 4, 18.00, 5, 5, 3, 1),
('Michael', 'Wang', 'M', '654 Cedar Blvd', 'Halifax', 'Nova Scotia', 'B3H 1K8', '1992-11-12', '2017-01-01', NULL, NULL, 5, 30.00, 5, 5, 2, 1),
('Turtino', 'Turtledino', 'M', '4444 Turtle Street', 'Turtinia City', 'Turtinia', 'A4N 3T1', '2004-04-19', '2023-3-31', NULL, NULL, 44, 44.44, 5, 5, 1, 1),
('Jones', 'Bob', 'M', '123 Main St', 'Anytown', 'BC', 'A1B 2C3', '1985-03-12', '2023-03-31', NULL, NULL, 33, 22.50, 5, 5, 3, 3),
('Smith', 'Samantha', 'M', '5678 Elm St', 'Sometown', 'BC', 'B4D 5E6', '1990-09-21', '2023-03-31', NULL, NULL, 25, 20.00, 5, 5, 1, 4),
('Garcia', 'Luis', 'F', '9876 Maple Ave', 'Anytown', 'BC', 'C7F 8G9', '1979-12-25', '2023-03-31', NULL, NULL, 42, 35.00, 5, 5, 2, 2),
('Nguyen', 'Trinh', 'M', '4321 Oak St', 'Sometown', 'BC', 'H1J 2K3', '1995-05-07', '2023-03-31', NULL, NULL, 28, 18.50, 5, 5, 10, 2),
('Brown', 'Andrew', 'M', '5555 Cypress Ave', 'Anytown', 'BC', 'M3N 4P5', '1988-08-16', '2023-03-31', NULL, NULL, 31, 27.00, 5, 5, 8, 1),
('Wang', 'Yan', 'M', '3216 Cedar St', 'Sometown', 'BC', 'R5T 6U7', '1992-11-02', '2023-03-31', NULL, NULL, 29, 24.50, 5, 5, 4, 4),
('Chen', 'Jin', 'M', '8888 Pine Ave', 'Anytown', 'BC', 'V9W 1X2', '1980-02-14', '2023-03-31', NULL, NULL, 41, 33.00, 5, 5, 6, 3),
('Lee', 'Kyung', 'M', '2468 Spruce Blvd', 'Sometown', 'BC', 'Y8Z 9A1', '1998-07-11', '2023-03-31', NULL, NULL, 23, 16.00, 5, 5, 9, 1),
('Taylor', 'Lauren', 'F', '1357 Birch Rd', 'Anytown', 'BC', 'B2C 3D4', '1993-04-30', '2023-03-31', NULL, NULL, 28, 21.50, 5, 5, 2, 4);

INSERT INTO SCHEDULE (SCH_DATE, EMP_ID) VALUES
('2023-04-02', 1),
('2023-01-19', 2),
('2023-01-26', 3),
('2023-02-02', 4),
('2023-02-09', 5),
('2023-02-16', 6),
('2023-02-23', 7),
('2023-04-01', 8),
('2023-03-12', 9),
('2023-03-19', 10);

INSERT INTO SCHEDULE (SCH_DATE, EMP_ID) VALUES ('2023-04-02', 11);

INSERT INTO DEPARTMENT_HISTORY (HIST_START_DATE, HIST_END_DATE, DEPT_ID, EMP_ID, ROLE_CODE) VALUES
('2023-01-12', '2023-01-19', 1, 1, 1),
('2023-01-19', '2023-01-26', 2, 2, 2),
('2023-01-26', '2023-02-02', 3, 3, 2),
('2023-02-02', '2023-02-09', 4, 4, 2),
('2023-02-09', '2023-02-16', 5, 5, 3),
('2023-02-16', '2023-02-23', 6, 6, 3),
('2023-02-23', '2023-03-05', 7, 7, 4),
('2023-03-05', '2023-03-12', 8, 8, 3),
('2023-03-12', '2023-03-19', 9, 9, 3),
('2023-03-19', '2023-03-31', 10, 10, 4);

INSERT INTO TRAINING_SESSION (TRAIN_DATE, TRAIN_START_TIME, TRAIN_END_TIME, CERT_CODE) VALUES
('2023-3-20', '07:00:00', '12:00:00', 7),
('2023-3-20', '13:00:00', '16:00:00', 1),
('2023-3-21', '11:00:00', '13:00:00', 3),
('2023-3-21', '14:00:00', '16:00:00', 8),
('2023-3-22', '08:00:00', '12:00:00', 5),
('2023-3-22', '14:00:00', '17:00:00', 10),
('2023-3-23', '09:30:00', '12:30:00', 2),
('2023-3-23', '13:45:00', '16:15:00', 4),
('2023-3-24', '09:00:00', '11:30:00', 9),
('2023-3-24', '13:30:00', '16:15:00', 6);

INSERT INTO EMP_TRAIN_SESSION (TRAIN_ID, EMP_ID, EMP_TRAIN_ROLE, TRAIN_OUTCOME, TRAIN_EXPIRY_DATE) VALUES (1, 1, 'Trainer', 'Pass', '2023-03-20'),
(2, 5, 'Trainer', 'Pass', '2022-03-20'),
(3, 7, 'Trainee', 'Fail', '2022-03-20'),
(4, 2, 'Trainee', 'Pass', '2022-03-20'),
(5, 4, 'Trainer', 'Pass', '2022-03-20'),
(6, 3, 'Trainee', 'Pass', '2022-03-20'),
(7, 10, 'Trainee', 'Fail', '2023-03-20'),
(8, 9, 'Trainer', 'Pass', '2023-03-20'),
(9, 6, 'Trainer', 'Pass', '2023-03-20'),
(10, 8, 'Trainee', 'Fail', '2023-03-20');

INSERT INTO INVENTORY (INV_TITLE, INV_PRICE, INV_QNTY) VALUES
('Uniform', 20.0, 15),
('Deck of Playing Cards', 5.0, 20),
('Gaming Chips', 1.0, 100),
('Security Cameras', 100.0, 5),
('First Aid Kit', 20.0, 25),
('Dice', 2.0, 50),
('Cash Registers', 100.0, 10),
('Decorations', 65.0, 15),
('Furniture', 100.0, 25),
('Cleaning Supplies', 35.0, 30);

INSERT INTO LEAVE (LEAVE_TYPE, LEAVE_START, LEAVE_END, LEAVE_COMMENTS, EMP_ID) VALUES
('Vacation','2022-03-15', '2022-03-20', 'Vacation in Okinawa', 1),
('Wedding', '2022-06-01', '2022-06-03', 'Attending wedding out of town', 2),
('Family', '2022-07-12', '2022-07-16', 'Family vacation', 3),
('Sick', '2022-09-05', '2022-09-07', 'Sick day', 4),
('Holiday', '2022-12-24', '2022-12-25', 'Christmas holidays', 5),
('Holiday', '2022-12-31', '2023-01-01', 'New Years holidays', 6),
('Family', '2023-01-15', '2023-01-20', 'Family vacation', 7),
('Sick', '2023-02-01', '2023-02-03', 'Sick day', 8),
('Sick', '2023-03-01', '2023-03-03', 'Sick day', 9),
('Vacation', '2023-03-15', '2023-03-20', 'Vacation in Hawaii', 10);

INSERT INTO WRITTEN_WARNING (WW_DATE, WW_OFFENCE, WW_COMMENTS, EMP_ID) VALUES
('2022-01-01', 'Tardiness', 'Employee was 15 minutes late to their shift', 2),
('2022-03-05', 'Failure to follow dress code', 'Employee was not wearing proper uniform', 3),
('2022-04-10', 'Insubordination', 'Employee refused to follow supervisor instructions', 4),
('2022-05-15', 'Excessive absences', 'Employee has called in sick multiple times without proper documentation', 5),
('2022-07-20', 'Customer complaint', 'Employee was rude to a customer', 6),
('2022-08-25', 'Violence in the workplace', 'Employee got into a physical altercation with another employee', 7),
('2022-09-30', 'Harassment', 'Employee made inappropriate comments towards a coworker', 8),
('2022-11-03', 'Poor performance', 'Employee has not met performance expectations', 9),
('2022-12-08', 'Misuse of company property', 'Employee used company equipment for personal use', 10),
('2023-01-13', 'Safety violation', 'Employee did not follow safety protocols', 2);

INSERT INTO SHIFT (SHIFT_START, SHIFT_END, SECT_CODE, EMP_ID, SCH_ID) VALUES
('2023-04-01 08:00:00', '2023-04-01 16:00:00', 1, 1, 1),
('2023-04-01 17:00:00', '2023-04-01 01:00:00', 1, 2, 5),
('2023-04-02 09:00:00', '2023-04-02 17:00:00', 1, 2, 6),
('2023-04-02 10:00:00', '2023-04-02 18:00:00', 1, 2, 1),
('2023-04-03 10:00:00', '2023-04-03 18:00:00', 2, 3, 2),
('2023-04-04 11:00:00', '2023-04-04 19:00:00', 3, 4, 2),
('2023-04-05 12:00:00', '2023-04-05 20:00:00', 4, 5, 3),
('2023-04-06 13:00:00', '2023-04-06 21:00:00', 5, 6, 3),
('2023-04-07 14:00:00', '2023-04-07 22:00:00', 4, 7, 4),
('2023-04-08 15:00:00', '2023-04-08 23:00:00', 5, 8, 4),
('2023-04-09 07:00:00', '2023-04-09 16:00:00', 4, 1, 5),
('2023-04-10 01:00:00', '2023-04-10 23:00:00', 3, 10, 5),
('2023-03-09 16:00:00', '2023-03-09 16:15:00', 4, 1, 5),
('2023-03-10 16:00:00', '2023-03-10 16:30:00', 3, 10, 5),
('2023-03-15 16:00:00', '2023-03-15 17:15:00', 2, 9, 5),
('2023-04-12 16:00:00', '2023-04-12 16:31:00', 4, 10, 5),
('2023-04-02 08:00:00', '2023-04-02 08:15:00', 1, 11, 1),
('2023-04-03 08:15:00', '2023-04-03 09:15:00', 1, 11, 2),
('2023-04-09 09:15:00', '2023-04-09 09:30:00', 1, 11, 1),
('2023-03-09 09:15:00', '2023-03-09 09:30:00', 1, 11, 4),
('2023-04-03 10:30:00', '2023-04-03 10:45:00', 1, 11, 1),
('2023-03-09 09:15:00', '2023-03-09 09:15:00', 2, 11, 1);

INSERT INTO SHIFT_INVENTORY (SHIFT_ID, INV_ID) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(3, 3),
(3, 8),
(3, 9),
(3, 10);