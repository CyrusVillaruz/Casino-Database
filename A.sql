DROP TABLE IF EXISTS [EMP_TRAIN_SESSION];
DROP TABLE IF EXISTS [SHIFT_INVENTORY];
DROP TABLE IF EXISTS [WRITTEN_WARNING];
DROP TABLE IF EXISTS [LEAVE];
DROP TABLE IF EXISTS [INVENTORY];
DROP TABLE IF EXISTS [TRAINING_SESSION];
DROP TABLE IF EXISTS [DEPARTMENT_HISTORY];
DROP TABLE IF EXISTS [EMP_ROLE_CERT];
DROP TABLE IF EXISTS [CERTIFICATION];
DROP TABLE IF EXISTS [SECT_SKILLS];
DROP TABLE IF EXISTS [SECTION];
DROP TABLE IF EXISTS [SKILLS];
DROP TABLE IF EXISTS [SHIFT];
DROP TABLE IF EXISTS [SCHEDULE];
DROP TABLE IF EXISTS [EMPLOYEE];
DROP TABLE IF EXISTS [DEPARTMENT];
DROP TABLE IF EXISTS [EMPLOYEE_ROLE];

IF DB_ID ('CasinoDatabase') IS NOT NULL
    DROP DATABASE CasinoDatabase;

CREATE DATABASE CasinoDatabase;

USE CasinoDatabase;

CREATE TABLE SKILLS (
    SKILL_ID INT PRIMARY KEY IDENTITY(1,1),
    SKILL_NAME VARCHAR(100) NOT NULL UNIQUE,
);

CREATE TABLE SECTION (
    SECT_CODE INT PRIMARY KEY IDENTITY(1,1),
    SECT_NAME VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE SECT_SKILLS (
    SKILL_ID INT,
    SECT_CODE INT,
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
    CERT_VALID_FOR DATE NOT NULL CHECK (CERT_VALID_FOR >= GETDATE()),
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
  SCH_ID INTEGER NOT NULL UNIQUE, 
  SCH_DATE DATE NOT NULL UNIQUE,
  EMP_ID INTEGER NOT NULL
  PRIMARY KEY (SCH_ID),
  FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE (EMP_ID)
);


CREATE TABLE DEPARTMENT_HISTORY (
    HIST_ID INT PRIMARY KEY,
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
SKILL_ID INT NOT NULL UNIQUE,
FOREIGN KEY (SKILL_ID) REFERENCES SKILLS (SKILL_ID)
);

CREATE TABLE EMP_TRAIN_SESSION (
    TRAIN_ID INT,
    EMP_ID INT,
    EMP_TRAIN_ROLE VARCHAR(100) NOT NULL ,
    TRAIN_OUTCOME VARCHAR(4) NOT NULL,
    TRAIN_EXPIRY_DATE DATE NOT NULL,
    PRIMARY KEY (Train_ID, EMP_ID),
	FOREIGN KEY (TRAIN_ID) REFERENCES TRAINING_SESSION (TRAIN_ID),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE (EMP_ID)
);

CREATE TABLE INVENTORY (
	INV_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	INV_TITLE VARCHAR(100) NOT NULL,
	INV_PRICE DECIMAL(8,2) NOT NULL,
	INV_QNTY INT NOT NULL,
);

CREATE TABLE LEAVE (
	LEAVE_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	LEAVE_START DATE NOT NULL,
	LEAVE_END DATE,
	LEAVE_COMMENTS VARCHAR(1000),
	EMP_ID INT NOT NULL,
	FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
);

CREATE TABLE WRITTEN_WARNING (
	WW_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	WW_DATE DATE NOT NULL,
	WW_OFFENCE VARCHAR(100) NOT NULL,
	WW_COMMENTS VARCHAR(1000) NOT NULL,
	EMP_ID INT NOT NULL,
	FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
	);

    CREATE TABLE SHIFT(
    SHIFT_ID INTEGER NOT NULL,
    SHIFT_START DATE NOT NULL, 
    SHIFT_END TIME NOT NULL,
    SECT_CODE INTEGER NOT NULL,
    SCH_ID INTEGER NOT NULL,
    PRIMARY KEY(SHIFT_ID),
    FOREIGN KEY (SCH_ID) REFERENCES SCHEDULE(SCH_ID)
);

CREATE TABLE SHIFT_INVENTORY (
    SHIFT_ID INT NOT NULL,
    INV_ID INT NOT NULL,
    PRIMARY KEY (SHIFT_ID, INV_ID),
    FOREIGN KEY (SHIFT_ID) REFERENCES SHIFT(SHIFT_ID),
    FOREIGN KEY (INV_ID) REFERENCES INVENTORY(INV_ID)
);

-- Populate Tables
INSERT INTO EMPLOYEE_ROLE VALUES (
                                  'Director of Operations',
                                  'The Director of Operations manages the ' +
                                  'Slot Floor and a diverse team to achieve company objectives, ' +
                                  'responsible for profit and loss, customer service scores, and ' +
                                  'floor quality. They coordinate with various teams, lead status ' +
                                  'update meetings, set clear goals, and provide guidance to shift ' +
                                  'managers and support staff. They oversee regional area operations, ' +
                                  'including adherence to project deadlines, budgets, quality, and ' +
                                  'customer satisfaction. The role requires attendance at mandatory ' +
                                  'outside trainings.');
INSERT INTO EMPLOYEE_ROLE VALUES ('Shift manager', 'The Shift Manager is responsible for the overall management ' +
                                                   'of the casino floor, including hiring and firing employees, ' +
                                                   'ensuring that gaming regulations and laws are followed, and ' +
                                                   'handling high-profile customers. They oversee employee training ' +
                                                   'and development, create and maintain tracking logs, and handle ' +
                                                   'customer complaints escalated from the supervisor level. ' +
                                                   'Additionally, they manage money and games and provide discipline ' +
                                                   'and development plans for employees.');
INSERT INTO EMPLOYEE_ROLE VALUES ('Floor Supervisor', 'The Floor Supervisor is responsible for overseeing and ' +
                                                      'managing Slot Attendants by providing on-the-job training, ' +
                                                      'guidance, and resources to ensure adequate job performance. ' +
                                                      'They also schedule and conduct in-house trainings and monitor ' +
                                                      'staff schedules. The Floor Supervisor is responsible for ' +
                                                      'maintaining a clean, safe, friendly and fun environment for ' +
                                                      'guests and employees and ensuring superior guest service. ' +
                                                      'They conduct pre-shift meetings with slot attendants and schedule ' +
                                                      'mandatory regulatory online certification/re-certification for them.');
INSERT INTO EMPLOYEE_ROLE VALUES ('Slot Attendance', 'The Slot Attendance is responsible for providing customer ' +
                                                     'service in a casino''s slot machine section. ' +
                                                     'Their responsibilities include ensuring that slot ' +
                                                     'machines are functioning properly, promoting special ' +
                                                     'programs offered by the casino, making change for customers, ' +
                                                     'and reserving slots for customers. They are also responsible for ' +
                                                     'balancing the float at the end of the day and attending in-house ' +
                                                     'and online trainings. A valid government-issued certification is ' +
                                                     'required for this position.');
INSERT INTO EMPLOYEE_ROLE VALUES ('Human Resources', 'The Human Resources department is responsible ' +
                                                        'for various tasks related to employee management, ' +
                                                        'including maintaining employee records and discipline ' +
                                                        'records, creating letters of employment, issuing records ' +
                                                        'of employment to departing employees, and tracking vacation ' +
                                                        'and sick leave. It may also handle payroll.');

INSERT INTO SKILLS VALUES ('Gambling Practices');
INSERT INTO SKILLS VALUES ('Customer Service');
INSERT INTO SKILLS VALUES ('Gaming Regulations and Laws');
INSERT INTO SKILLS VALUES ('Conflict Resolution');
INSERT INTO SKILLS VALUES ('Security and Safety Procedures');
INSERT INTO SKILLS VALUES ('Emergency Protocols and First Aid');
INSERT INTO SKILLS VALUES ('Alcohol Awareness');
INSERT INTO SKILLS VALUES ('Fraud Detection and Prevention');
INSERT INTO SKILLS VALUES ('Accounting');
INSERT INTO SKILLS VALUES ('Anti-Money Laundering Laws and Procedures');

INSERT INTO SECTION VALUES ('NORTH');
INSERT INTO SECTION VALUES ('SOUTH');
INSERT INTO SECTION VALUES ('EAST');
INSERT INTO SECTION VALUES ('WEST');

INSERT INTO INVENTORY VALUES ('Uniform', 20.0, 15);
INSERT INTO INVENTORY VALUES ('Deck of Playing Cards', 5.0, 20);
INSERT INTO INVENTORY VALUES ('Gaming Chips', 1.0, 100);
INSERT INTO INVENTORY VALUES ('Security Cameras', 100.0, 5);
INSERT INTO INVENTORY VALUES ('First Aid Kit', 20.0, 25);
INSERT INTO INVENTORY VALUES ('Dice', 2.0, 50);
INSERT INTO INVENTORY VALUES ('Cash Registers', 100.0, 10);
INSERT INTO INVENTORY VALUES ('Decorations', 65.0, 15);
INSERT INTO INVENTORY VALUES ('Furniture', 100.0, 25);
INSERT INTO INVENTORY VALUES ('Cleaning Supplies', 35.0, 30);

INSERT INTO TRAINING_SESSION VALUES ('2023-3-20', '07:00:00', '12:00:00', 7);
INSERT INTO TRAINING_SESSION VALUES ('2023-3-20', '13:00:00', '16:00:00', 1);
INSERT INTO TRAINING_SESSION VALUES ('2023-3-21', '11:00:00', '13:00:00', 3);
INSERT INTO TRAINING_SESSION VALUES ('2023-3-21', '14:00:00', '16:00:00', 8);
INSERT INTO TRAINING_SESSION VALUES ('2023-3-22', '08:00:00', '12:00:00', 5);
INSERT INTO TRAINING_SESSION VALUES ('2023-3-22', '14:00:00', '17:00:00', 10);
INSERT INTO TRAINING_SESSION VALUES ('2023-3-23', '09:30:00', '12:30:00', 2);
INSERT INTO TRAINING_SESSION VALUES ('2023-3-23', '13:45:00', '16:15:00', 4);
INSERT INTO TRAINING_SESSION VALUES ('2023-3-24', '09:00:00', '11:30:00', 9);
INSERT INTO TRAINING_SESSION VALUES ('2023-3-24', '13:30:00', '16:15:00', 6);

