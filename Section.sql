CREATE TABLE SECTION (
    SECT_CODE INT NOT NULL UNIQUE,
    SECT_NAME VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (SECT_CODE)
);