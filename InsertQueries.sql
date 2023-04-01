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

INSERT INTO DEPARTMENT VALUES ('Administration');
INSERT INTO DEPARTMENT VALUES ('Food and Beverage');
INSERT INTO DEPARTMENT VALUES ('Housekeeping');
INSERT INTO DEPARTMENT VALUES ('Marketing and Promotions');
INSERT INTO DEPARTMENT VALUES ('Security');
INSERT INTO DEPARTMENT VALUES ('Maintenance');
INSERT INTO DEPARTMENT VALUES ('Entertainment');
INSERT INTO DEPARTMENT VALUES ('Human Resources');
INSERT INTO DEPARTMENT VALUES ('Finance');
INSERT INTO DEPARTMENT VALUES ('Administration');

INSERT INTO EMPLOYEE VALUES ('Turtino', 'Turtledino', '4444 Turtle Street', 'Turtinia City', 'Turtinia', 'A4N 3T1', '2004-04-19', '2023-3-31', NULL, NULL, 44, 44.44, 5, 2, 1, 1);
INSERT INTO EMPLOYEE VALUES ('Jones', 'Bob', '123 Main St', 'Anytown', 'BC', 'A1B 2C3', '1985-03-12', '2023-03-31', NULL, NULL, 33, 22.50, 10, 5, 3, 3);
INSERT INTO EMPLOYEE VALUES ('Smith', 'Samantha', '5678 Elm St', 'Sometown', 'BC', 'B4D 5E6', '1990-09-21', '2023-03-31', NULL, NULL, 25, 20.00, 8, 2, 1, 4);
INSERT INTO EMPLOYEE VALUES ('Garcia', 'Luis', '9876 Maple Ave', 'Anytown', 'BC', 'C7F 8G9', '1979-12-25', '2023-03-31', NULL, NULL, 42, 35.00, 6, 9, 2, 2);
INSERT INTO EMPLOYEE VALUES ('Nguyen', 'Trinh', '4321 Oak St', 'Sometown', 'BC', 'H1J 2K3', '1995-05-07', '2023-03-31', NULL, NULL, 28, 18.50, 4, 7, 10, 2);
INSERT INTO EMPLOYEE VALUES ('Brown', 'Andrew', '5555 Cypress Ave', 'Anytown', 'BC', 'M3N 4P5', '1988-08-16', '2023-03-31', NULL, NULL, 31, 27.00, 7, 3, 8, 1);
INSERT INTO EMPLOYEE VALUES ('Wang', 'Yan', '3216 Cedar St', 'Sometown', 'BC', 'R5T 6U7', '1992-11-02', '2023-03-31', NULL, NULL, 29, 24.50, 9, 4, 4, 4);
INSERT INTO EMPLOYEE VALUES ('Chen', 'Jin', '8888 Pine Ave', 'Anytown', 'BC', 'V9W 1X2', '1980-02-14', '2023-03-31', NULL, NULL, 41, 33.00, 5, 1, 6, 3);
INSERT INTO EMPLOYEE VALUES ('Lee', 'Kyung', '2468 Spruce Blvd', 'Sometown', 'BC', 'Y8Z 9A1', '1998-07-11', '2023-03-31', NULL, NULL, 23, 16.00, 3, 5, 9, 1);
INSERT INTO EMPLOYEE VALUES ('Taylor', 'Lauren', '1357 Birch Rd', 'Anytown', 'BC', 'B2C 3D4', '1993-04-30', '2023-03-31', NULL, NULL, 28, 21.50, 4, 8, 2, 4);
