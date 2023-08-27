CREATE TABLE Customer
(
		customerId		INTEGER(2),
		address			VARCHAR(20) NOT NULL,
		customerName    VARCHAR(20) NOT NULL,
		phoneNo			VARCHAR(20) NOT NULL,
		dob				VARCHAR(20) NOT NULL,
		emailAddress 	VARCHAR(20) NOT NULL,
		CONSTRAINT c_cid_pk  PRIMARY KEY (customerId)
);

CREATE TABLE "Sets"
(
		setId			INTEGER(2),
		setName    		VARCHAR(20) NOT NULL,
		setNo			INTEGER(10) NOT NULL,
		setQuantity		INTEGER(10) NOT NULL,
		setPrice	 	DECIMAL(8,2) NOT NULL,
		CONSTRAINT s_sid_pk  PRIMARY KEY (setId)
);

CREATE TABLE Suppliers
(
		supplierId		INTEGER(2),
		supplierName    VARCHAR(20) NOT NULL,
		supplierNo		VARCHAR(20) NOT NULL,
		CONSTRAINT s_sid_pk  PRIMARY KEY (supplierId)
);

CREATE TABLE Customer
(
		customerId		INTEGER(2),
		address			VARCHAR(20) NOT NULL,
		customerName    VARCHAR(20) NOT NULL,
		phoneNo			VARCHAR(20) NOT NULL,
		dob				VARCHAR(20) NOT NULL,
		emailAddress 	VARCHAR(20) NOT NULL,
		CONSTRAINT c_cid_pk  PRIMARY KEY (customerId)
);

CREATE TABLE Staff
(
		staffId		 	INTEGER(2),
		staffAddress	VARCHAR(20) NOT NULL,
		staffName     	VARCHAR(20) NOT NULL,
		phoneNo			VARCHAR(20) NOT NULL,
		dob				VARCHAR(20) NOT NULL,
		CONSTRAINT s_sid_pk  PRIMARY KEY (staffId)
);

CREATE TABLE Customer
(
		customerId		INTEGER(2),
		address			VARCHAR(20) NOT NULL,
		customerName    VARCHAR(20) NOT NULL,
		phoneNo			VARCHAR(20) NOT NULL,
		dob				VARCHAR(20) NOT NULL,
		emailAddress 	VARCHAR(20) NOT NULL,
		CONSTRAINT c_cid_pk  PRIMARY KEY (customerId)
); 

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress)
VALUES   (12, "en6 4hr", "jacob", "06464535323", "10/03/2001", "something@ss.com");	

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress)
VALUES   (12, "en6 4hr", "jacob", "06464535323", "10/03/2001", "something@ss.com");

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress)
VALUES   (12, "en6 4hr", "jacob", "06464535323", "10/03/2001", "something@ss.com");

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress)
VALUES   (12, "en6 4hr", "jacob", "06464535323", "10/03/2001", "something@ss.com");

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress)
VALUES   (12, "en6 4hr", "jacob", "06464535323", "10/03/2001", "something@ss.com");	