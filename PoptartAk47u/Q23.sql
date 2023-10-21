CREATE TABLE _SELLER ( -- 1

    Sellerid INT PRIMARY KEY NOT NULL,
	Name Varchar(255) ,
	Venue Varchar(255) ,
	Email NChar(255)UNIQUE NOT NULL,
	);
	
CREATE TABLE PRODUCT ( -- 3

	Productid INT PRIMARY KEY NOT NULL,
	Name VARCHAR(255) ,
	Description TEXT,
	Category VARCHAR(255),
	Price DECIMAL(10,2),
	Sellerid INT,
	FOREIGN KEY (Sellerid) References _SELLER (Sellerid)

);

ALTER TABLE PRODUCT
ADD Quantity INT;
CREATE TABLE CUSTOMER (-- 3
	
	Custid INT PRIMARY KEY NOT NULL,
	Address VARCHAR(255),
	Fname VARCHAR(255),
	Lname VARCHAR (255),
	Email VARCHAR(255)UNIQUE NOT NULL,
	Address1 VARCHAR(255),
    Address2 VARCHAR(255)

);

CREATE TABLE ORDER_ ( -- 4

	Orderid INT PRIMARY KEY NOT NULL,
	Creationtimestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
	TotalAmount DECIMAL (10,2),
	Custid INT,
	FOREIGN KEY (Custid) REFERENCES CUSTOMER (Custid)

);

CREATE TABlE ORDERITEM ( -- 5

	Orderitemid INT PRIMARY KEY NOT NULL,
	Quantity INT,
	Orderid INT,
	Productid INT,
	FOREIGN KEY (Orderid) REFERENCES ORDER_ (Orderid),
	FOREIGN KEY (Productid) REFERENCES PRODUCT (Productid)

);


CREATE TABLE PAYMENT ( -- 6

	Paymentid INT PRIMARY KEY NOT NULL,
	Creationtimestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
	TotalAmount DECIMAL (10,2),
	Method VARCHAR(255) NOT NULL,
	Orderid INT ,
	FOREIGN KEY (Orderid) REFERENCES ORDER_ (Orderid)

);


CREATE TABLE ADDRESS ( --7
    AddressID INT PRIMARY KEY NOT NULL ,
    AddressLine1 VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Zip VARCHAR(10),
    Country VARCHAR(255),
    Custid INT,
    FOREIGN KEY (Custid) REFERENCES CUSTOMER(Custid)
);


CREATE TABLE SHOPPINGCART ( --8
    ShoppingCartID INT PRIMARY KEY NOT NULL,
    Custid INT,
    FOREIGN KEY (Custid) REFERENCES CUSTOMER(Custid)
);

CREATE TABLE CARTITEMS ( --9
    CartItemID INT PRIMARY KEY NOT NULL,
    ShoppingCartID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ShoppingCartID) REFERENCES SHOPPINGCART(ShoppingCartID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);

CREATE TABLE REVIEW ( -- 10
    ReviewID INT PRIMARY KEY NOT NULL,
    ProductID INT,
    CustomerID INT,
    Content TEXT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(Custid)
);

CREATE TABLE INVENTORY ( --11
    InventoryID INT PRIMARY KEY ,
    ProductID INT,
    StockQuantity INT,
    LastStockUpdate DATETIME DEFAULT CURRENT_TIMESTAMP,
    ReorderThreshold INT,
    UnitCost DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);




INSERT INTO _SELLER (Sellerid, Name, Venue, Email) VALUES
(1, 'Seller One', 'Online', 'sellerone@email.com'),
(2, 'Seller Two', 'Physical Store', 'sellertwo@email.com'),
(3, 'Seller Three', 'Both', 'sellerthree@email.com');

INSERT INTO PRODUCT (Productid, Name, Description, Price, Sellerid, Quantity,Category) VALUES
(1, 'Laptop', 'Gaming laptop', 1000.00, 1, 10,'Electronics'),
(2, 'Headphones', 'Noise cancelling', 200.00, 1, 50,'Electronics'),
(3, 'Smartphone', 'Latest model', 800.00, 2, 25,'Electronics'),
(4, 'Keyboard', 'Gaming ', 1000.00, 1, 10,'Electronics'),
(5, 'MIC', 'Noise cancelling', 200.00, 1, 50,'Electronics'),
(6, 'FANS', 'Latest model', 800.00, 2, 25,'Electronics'),
(7, 'MOUSE', 'Gaming ', 1000.00, 1, 10,'Electronics'),
(8, 'BAT', 'GOOD QUALITIY', 200.00, 1, 50,'Sports'),
(9, 'ALEX', 'THE KING', 800.00, 2, 25,'BOOK');

INSERT INTO CUSTOMER (Custid, Address, Fname, Lname, Email, Address1, Address2) VALUES
(1, '123 Street', 'John', 'Doe', 'johndoe@email.com', '123 Street', 'Apt 4B'),
(2, '456 Avenue', 'Jane', 'Smith', 'janesmith@email.com', '456 Avenue', 'Apt 6C'),
(3, '456 Avenue', 'Jane', 'Smith', 'janesmith@email.com', '456 Avenue', 'Apt 6C'),
(4, '123 Street', 'John', 'Doe', '123@email.com', '123 Street', 'Apt 4B'),
(5, '456 Avenue', 'Jane', 'Smith', '45h@email.com', '456 Avenue', 'Apt 6C'),
(6, '456 Avenue', 'Jane', 'Smith', '65@email.com', '456 Avenue', 'Apt 6C'),
(7, '456 Avenue', 'Jane', 'Smith', '43@email.com', '456 Avenue', 'Apt 6C');

INSERT INTO ORDER_ (Orderid, TotalAmount, Custid) VALUES
(5, 4000.00, 5),
(6, 2000.00, 6),
(7, 3000.00, 7);
INSERT INTO ORDERITEM (Orderitemid, Quantity, Orderid, Productid) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 3, 2),
(4, 6, 3, 4),
(5, 5, 2, 5),
(6, 8, 1, 6),
(7, 10, 2, 7);


INSERT INTO PAYMENT (Paymentid, TotalAmount, Method, Orderid) VALUES
(1, 1200.00, 'Credit Card', 1),
(2, 1000.00, 'Debit Card', 2);


INSERT INTO ADDRESS (AddressID, AddressLine1, City, State, Zip, Country, Custid) VALUES
(1, '123 Street', 'CityOne', 'StateOne', '12345', 'CountryOne', 1),
(2, '456 Avenue', 'CityTwo', 'StateTwo', '67890', 'CountryTwo', 2);


INSERT INTO SHOPPINGCART (ShoppingCartID, Custid) VALUES
(1, 1),
(2, 2);


INSERT INTO CARTITEMS (CartItemID, ShoppingCartID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 1);


INSERT INTO REVIEW (ReviewID, ProductID, CustomerID, Content, Rating) VALUES
(1, 1, 1, 'Great product!', 5),
(2, 3, 2, 'Good but expensive.', 4);



INSERT INTO INVENTORY (InventoryID, ProductID, StockQuantity, ReorderThreshold, UnitCost) VALUES
(1, 1, 10, 5, 950.00),
(2, 2, 50, 20, 180.00),
(3, 3, 25, 10, 750.00);




--Q23--

SELECT 
    p.Productid,
    p.Name AS ProductName,
    p.Category,
    COALESCE(oi.Quantity, 0) AS OrderQuantity,
    p.Price AS OrderPrice,
    COALESCE(oi.Quantity * p.Price, 0) AS TotalRevenue
FROM 
    PRODUCT p
LEFT JOIN 
    ORDERITEM oi ON p.Productid = oi.Productid
WHERE 
    p.Category = 'Electronics' AND 
    (oi.Quantity BETWEEN 5 AND 10 OR oi.Quantity IS NULL)
ORDER BY 
    TotalRevenue DESC;
