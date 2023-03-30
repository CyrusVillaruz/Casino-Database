CREATE TABLE DEPARTMENT_HISTORY (
    HIST_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    HIST_START_DATE DATE NOT NULL,
    HIST_END_DATE DATE NOT NULL,
    DEPT_ID INT NOT NULL,
    EMP_ID INT NOT NULL,
    ROLE_CODE INT NOT NULL,
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
    FOREIGN KEY (ROLE_CODE) REFERENCES EMPLOYEE_ROLE(ROLE_CODE)
)