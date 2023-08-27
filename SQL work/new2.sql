CREATE TABLE Customer
(
		customerId		INTEGER(2),
		cStatus			VARCHAR(20) NOT NULL,
		address			VARCHAR(20),
		customerName    VARCHAR(30),
		phoneNo			VARCHAR(20),
		dob				VARCHAR(20),
		emailAddress 	VARCHAR(20),
		CONSTRAINT pk_customer_customerId  PRIMARY KEY (customerId),
		CONSTRAINT fk_Customer_cStatus FOREIGN KEY (cStatus) REFERENCES Systems (cStatus)
);

CREATE TABLE Setss 
( 
		setId 		INTEGER(2), 
		setName 	VARCHAR(20) NOT NULL,  
		setQuantity VARCHAR(10) NOT NULL, 
		CONSTRAINT s_id_pk PRIMARY KEY (setId) 

);

CREATE TABLE Suppliers
(		
		cStatus         VARCHAR(20) NOT NULL,
		supplierId		INTEGER(2),
		supplierName    VARCHAR(20) NOT NULL,
		supplierNo		VARCHAR(20) NOT NULL,
		CONSTRAINT s_sid_pk  PRIMARY KEY (supplierId),
		CONSTRAINT s_s_fk 	 FOREIGN KEY (cStatus) REFERENCES Systems (cStatus)
);

CREATE TABLE Product_Type
(		
		supplierId		INTEGER(2),
		itemId			VARCHAR(20) NOT NULL,
		CONSTRAINT pt_iid_pk  PRIMARY KEY (itemId),
		CONSTRAINT pt_sid_fk 	 FOREIGN KEY (supplierId) REFERENCES Suppliers (supplierId)
);

CREATE TABLE Product
(
		productId		INTEGER(2),
		itemId			VARCHAR(20) NOT NULL,
		productQuantity VARCHAR(20) NOT NULL,
		productName		VARCHAR(20) NOT NULL,
		productDesc		VARCHAR(40) NOT NULL,
		CONSTRAINT p_sid_pk  PRIMARY KEY (productId),
		CONSTRAINT p_iid_fk  FOREIGN KEY (itemId) REFERENCES Product_Type (itemId)
);

CREATE TABLE catalogue
(
		setId 			INTEGER(2),
		setPrice	    DECIMAL(8,2),
		catNo			VARCHAR(10) NOT NULL,
		catQuantity     VARCHAR(10) NOT NULL,
		CONSTRAINT pk_cat_setPrice  PRIMARY KEY (setPrice),
		CONSTRAINT fk_cat_setid  FOREIGN KEY (setId) REFERENCES Setss (setId)
);

CREATE TABLE Orderr
(
		orderId		 	INTEGER(6),
		paymentId		INTEGER(5),
		cStatus			VARCHAR(20) NOT NULL,
		customerId		INTEGER(2),
		orderDate		DATE NOT NULL,
		CONSTRAINT o_oid_pk  PRIMARY KEY (orderId), 
		CONSTRAINT o_pid_fk  FOREIGN KEY (paymentId) REFERENCES Paypal_Payment(paymentId),
		CONSTRAINT o_s_fk    FOREIGN KEY (cStatus) REFERENCES Systems (cstatus),
		CONSTRAINT o_cid_fk  FOREIGN KEY (customerId) REFERENCES  Customer (customerId)
);

CREATE TABLE Paypal_Payment
(
		paymentId		INTEGER(5),
		setPrice    	VARCHAR(20) NOT NULL,
		quantity		VARCHAR(20) NOT NULL,
		CONSTRAINT pp_pid_pk  PRIMARY KEY (paymentId)
);
		
CREATE TABLE Systems
(
		cStatus			VARCHAR(30) NOT NULL,		
		CONSTRAINT p_p_pk  PRIMARY KEY (cStatus)
		
);



INSERT INTO
Orderr(orderId,paymentId,customerId,cStatus,orderDate)
VALUES (654321,5555,3,"standard spender",'20-02-20');

INSERT INTO
Orderr(orderId,paymentId,customerId,cStatus,orderDate)
VALUES (123456,3452,52,"mid spender",'22-06-20');

INSERT INTO
Orderr(orderId,paymentId,customerId,cStatus,orderDate)
VALUES (987654, 9843,42,"highest spender",'15-02-21');

INSERT INTO
Orderr(orderId,paymentId,customerId,cStatus,orderDate)
VALUES (909876, 4321,12,"high spender",'24-01-19');

INSERT INTO
Paypal_Payment(paymentId,setPrice,quantity)
VALUES (3452, "50.00", "2");

INSERT INTO
Paypal_Payment (paymentId,setPrice,quantity)
VALUES (4321, "650.00", "1");

INSERT INTO
Paypal_Payment(paymentId,setPrice,quantity)
VALUES (9843, "1200.00", "2");

INSERT INTO
Paypal_Payment(paymentId,setPrice,quantity)
VALUES (5555, "25.00", "1");

INSERT INTO
catalogue(setPrice,setId,catNo,catQuantity)
VALUES (25.00,32,"01","20");

INSERT INTO
catalogue(setPrice, setId,catNo,catQuantity)
VALUES (650.00,25,"02","50");

INSERT INTO
Setss(setId,setName,setQuantity)
VALUES (25, "‘Deluxe Recreation", 20);

INSERT INTO
Setss(setId,setName,setQuantity)
VALUES (32, "Regular Care", 50);

INSERT INTO
Product(productId,itemId,productDesc,productName,productQuantity)
VALUES (22,"perfume_sets","selection of perfume kits","perfume","20");

INSERT INTO
Product(productId,itemId,productDesc,productName,productQuantity)
VALUES (11,"skincare_sets","selection of skin cream kits","skin cream","30");

INSERT INTO
Product(productId,itemId,productDesc,productName,productQuantity)
VALUES (02,"haircare_sets","selection of shampoo kits","hair shampoo","15");

INSERT INTO
Product(productId,itemId,productDesc,productName,productQuantity)
VALUES (34,"makeup_sets","selection of foundation kits","foundation","10");


INSERT INTO
Product_Type(supplierId,itemId)
VALUES (32,"makeup_sets");

INSERT INTO
Product_Type(supplierId,itemId)
VALUES (15,"perfume_sets");

INSERT INTO
Product_Type(supplierId,itemId)
VALUES (21,"skincare_sets");

INSERT INTO
Product_Type(supplierId,itemId)
VALUES (56,"haircare_sets");

INSERT INTO 
Suppliers (supplierId, cStatus, supplierNo, supplierName)
VALUES (32, "standard spender", "0330004456", "makeup. Ltd");

INSERT INTO 
Suppliers (supplierId, cStatus, supplierNo, supplierName)
VALUES (21, "mid spender", "033004446788", "comsetic looks");

INSERT INTO 
Suppliers (supplierId, cStatus, supplierNo, supplierName)
VALUES (15, "new spender", "020245563322", "aroma. Ltd");

INSERT INTO 
Suppliers (supplierId, cStatus, supplierNo, supplierName)
VALUES (56, "standard spender", "0208500663", "hairclip. Ltd");

INSERT INTO
Systems (cStatus)
VALUES  ("new spender");

INSERT INTO
Systems (cStatus)
VALUES  ("high spender");

INSERT INTO
Systems (cStatus)
VALUES  ("standard spender");

INSERT INTO
Systems (cStatus)
VALUES  ("mid spender");

INSERT INTO
Systems (cStatus)
VALUES  ("highest spender");

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress,cStatus)
VALUES   (12, "en6 4hr", "Jacob Mathews", "07464535323", "10/03/1982", "jac@gmail.com","high spender");	

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress,cStatus)
VALUES   (3, "w5 4gr", "John Smith", "07465498776", "18/12/1989", "John76@gmail.com","standard spender");

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress,cStatus)
VALUES   (22, "en4 3sr", "Martha White", "073334228765", "21/02/1990", "Martha@hotmail.co.uk","standard spender");

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress,cStatus)
VALUES   (42, "sw2 1tr", "Sarah Mulligan", "07996555000", "28/03/1969", "SM@gmail.com","highest spender");

INSERT INTO
Customer (customerId, address, customerName, phoneNo, dob, emailAddress,cStatus)
VALUES   (52, "n7 1su", "Alan Small", "07459997700", "01/09/1970", "AlanS33@outlook.com","mid spender");	