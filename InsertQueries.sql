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

INSERT INTO EMPLOYEE VALUES ('Tino', 'Tinia', '255 Turtle Street')