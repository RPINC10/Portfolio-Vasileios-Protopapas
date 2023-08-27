CREATE TABLE Customer
(
		customerId		INTEGER(2),
		status			VARCHAR(20) NOT NULL,
		address			VARCHAR(20) NOT NULL,
		customerName    VARCHAR(30) NOT NULL,
		phoneNo			VARCHAR(20) NOT NULL,
		dob				VARCHAR(20) NOT NULL,
		emailAddress 	VARCHAR(20) NOT NULL,
		CONSTRAINT c_cid_pk  PRIMARY KEY (customerId)
		CONSTRAINT c_s_fk 	 FOREIGN KEY (status),
		REFERENCES system (status)
);

CREATE TABLE Setss
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
		CONSTRAINT c_s_fk 	 FOREIGN KEY (status)
		REFERENCES system (status)
);

CREATE TABLE Product_Type
(
		itemId			VARCHAR(20) NOT NULL,
		CONSTRAINT p_tid_pk  PRIMARY KEY (itemId)
);

CREATE TABLE Product
(
		productId		INTEGER(2),
		itemId			VARCHAR(20) NOT NULL,
		supplierId		INTEGER(2),
		productQuantity VARCHAR(20) NOT NULL,
		productName		VARCHAR(20) NOT NULL,
		productDesc		VARCHAR(20) NOT NULL,
		CONSTRAINT s_sid_pk  PRIMARY KEY (supplierId)
		CONSTRAINT p_tid_fk  FOREIGN KEY (itemId)
		REFERENCES Product_Type (itemId)
);

CREATE TABLE Catalogue
(
		catNo			INTEGER(2),
		setNo			VARCHAR(20) NOT NULL,
		setQuantity     VARCHAR(20) NOT NULL,
		setPrice		VARCHAR(20) NOT NULL,
		CONSTRAINT c_cno_pk  PRIMARY KEY (catNo)
		CONSTRAINT c_sno_fk  FOREIGN KEY (setNo)
		CONSTRAINT c_sq_fk   FOREIGN KEY (setQuantity)
		CONSTRAINT c_sp_fk   FOREIGN KEY (setPrice)
		REFERENCES Setss (setNo)
		REFERENCES Setss (setQuantity)
		REFERENCES Setss (setPrice)
		
);

CREATE TABLE Orderr
(
		orderId		 	INTEGER(6),
		paymentId		INTEGER(5),
		status			VARCHAR(20) NOT NULL,
		customerId		VARCHAR(20) NOT NULL,
		orderDate		DATE NOT NULL,
		CONSTRAINT o_oid_pk  PRIMARY KEY (orderId)
		CONSTRAINT p_pid_fk  FOREIGN KEY (paymentId)
		CONSTRAINT s_s_fk    FOREIGN KEY (status)
		CONSTRAINT c_cid_fk  FOREIGN KEY (customerId)
		CONSTRAINT o_od_pk   PRIMARY KEY (orderDate)
		REFERENCES Customer (customerId)
		REFERENCES system	(status)
		REFERENCES Paypal_Payment (paymentId)
);

CREATE TABLE Paypal_Payment
(
		paymentId		INTEGER(5),
		customerId		VARCHAR(20) NOT NULL,
		setPrice    	VARCHAR(20) NOT NULL,
		setQuantity		VARCHAR(20) NOT NULL,
		CONSTRAINT p_pid_pk  PRIMARY KEY (paymentId)
		CONSTRAINT c_cid_fk  FOREIGN KEY (customerId)
		CONSTRAINT c_sq_fk   FOREIGN KEY (setQuantity)
		CONSTRAINT c_sp_fk   FOREIGN KEY (setPrice)
		REFERENCES Customer (customerId)
		REFERENCES Setss (setQuantity)
		REFERENCES Setss (setPrice)
);

CREATE TABLE system 
(
		status			VARCHAR(20) NOT NULL,
		customerId    	VARCHAR(20) NOT NULL,
	    salesNo			VARCHAR(20) NOT NULL,
		orderId			INTEGER(5),
		CONSTRAINT s_s_pk  PRIMARY KEY (status)
		CONSTRAINT c_cid_fk   FOREIGN KEY (customerId)
		CONSTRAINT s_sno_fk  FOREIGN KEY (salesNo)
		CONSTRAINT s_sno_fk  FOREIGN KEY (salesNo)
		REFERENCES Customer (customerId)
		REFERENCES Salesman (salesNo)
		REFERENCES Orderr (orderId)
); 

--For the customer table--
INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress)
VALUES   (12, "en6 4hr", "Jacob Mathews", "07464535323", "10/03/1982", "jac@gmail.com");	

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress)
VALUES   (1, "w5 4gr", "John Smith", "07465498776", "18/12/1989", "John76@gmail.com");

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress)
VALUES   (22, "en4 3sr", "Martha White", "073334228765", "21/02/1990", "MarthaW@hotmail.co.uk");

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress)
VALUES   (42, "sw2 1tr", "Sarah Mulligan", "07996555000", "28/03/1969", "SM@gmail.com");

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress)
VALUES   (52, "n7 1su", "Alan Small", "07459997700", "01/09/1970", "AlanS33@outlook.com");	

--For the 