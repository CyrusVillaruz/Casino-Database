CREATE TABLE INVENTORY (
	INV_ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	INV_TITLE VARCHAR(20) NOT NULL,
	INV_PRICE DECIMAL(8,2) NOT NULL,
	INV_QNTY INT NOT NULL,
)