CREATE TABLE CERTIFICATION (
    CERT_CODE INT NOT NULL UNIQUE,
    CERT_NAME VARCHAR(50) NOT NULL, 
    CERT_VALID_FOR DATE NOT NULL CHECK (CERT_VALID_FOR >= GETDATE()),
    CERT_ISSUED_BY VARCHAR(50) NOT NULL,
    PRIMARY KEY (CERT_CODE)
);



--REQUIRED UNIQUE--