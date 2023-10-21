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


INSERT INTO _SELLER(Sellerid, Name, Venue, Email) VALUES
(1, 'TechStore', 'Online', 'techstore@gmail.com'),
(2, 'FashionHub', 'Downtown Mall', 'fashionhub@gmail.com'),
(3, 'BookWorld', 'City Center', 'bookworld@gmail.com'),
(4, 'HomeDecor', 'Uptown Plaza', 'homedecor@gmail.com'),
(5, 'ShoeMart', 'Main Street', 'shoemart@gmail.com'),
(6, 'GroceryGiant', 'Local Market', 'grocerygiant@gmail.com'),
(7, 'ToyLand', 'Mall of City', 'toyland@gmail.com'),
(8, 'ElectroShop', 'Online', 'electroshop@gmail.com'),
(9, 'GadgetZone', 'Tech Park', 'gadgetzone@gmail.com'),
(10, 'SportsGear', 'Stadium Outlet', 'sportsgear@gmail.com'),
(11, 'MovieMaze', 'Film Street', 'moviemaze@gmail.com'),
(12, 'AutoParts', 'Industrial Zone', 'autoparts@gmail.com'),
(13, 'MusicVibe', 'Downtown Mall', 'musicvibe@gmail.com'),
(14, 'JewelCrest', 'Elite Plaza', 'jewelcrest@gmail.com'),
(15, 'FoodieFiesta', 'Food Lane', 'foodiefiesta@gmail.com'),
(16, 'PetPalace', 'Animal Market', 'petpalace@gmail.com'),
(17, 'TravelTales', 'Online', 'traveltales@gmail.com'),
(18, 'FitnessFreak', 'Gym Street', 'fitnessfreak@gmail.com'),
(19, 'BeautyBliss', 'Fashion Avenue', 'beautybliss@gmail.com'),
(20, 'CraftCave', 'Artists Alley', 'craftcave@gmail.com');
INSERT INTO _SELLER (Sellerid, Name, Venue, Email) VALUES (21, 'SellerA', 'Venue1', 'sellerA@email.com');
INSERT INTO _SELLER (Sellerid, Name, Venue, Email) VALUES (22, 'SellerB', 'Venue2', 'sellerB@email.com');
 
 

INSERT INTO PRODUCT(Productid, Name, Description, Price, Sellerid, Category) VALUES
(1, 'Laptop', '15-inch with 8GB RAM', 800.00, 1, 'Electronics'),
(2, 'Running Shoes', 'Comfortable sports shoes', 50.00, 5, 'Footwear'),
(3, 'Novel - The Mountains', 'Bestseller Fiction', 10.00, 3, 'Books'),
(4, 'Wall Clock', 'Vintage wall clock', 25.00, 4, 'Home Decor'),
(5, 'Summer Dress', 'Cotton, Medium Size', 30.00, 2, 'Apparel'),
(6, 'Headphones', 'Wireless with Noise Cancellation', 120.00, 1, 'Electronics'),
(7, 'Desk Lamp', 'LED Adjustable', 40.00, 4, 'Home Decor'),
(8, 'Football', 'FIFA Approved Size', 20.00, 5, 'Sports'),
(9, 'Guitar', 'Acoustic with Metal Strings', 150.00, 1, 'Music Instruments'),
(10, 'Handbag', 'Leather', 70.00, 2, 'Accessories'),
(11, 'Sunglasses', 'UV Protected', 60.00, 2, 'Accessories'),
(12, 'Novel - The Sea', 'Adventure Fiction', 11.00, 3, 'Books'),
(13, 'Wrist Watch', 'Analog with Leather Strap', 55.00, 4, 'Accessories'),
(14, 'Keyboard', 'Mechanical RGB', 65.00, 1, 'Electronics'),
(15, 'Bike Helmet', 'For Safety', 35.00, 5, 'Sports'),
(16, 'Painting Kit', 'Watercolors with Brushes', 20.00, 3, 'Arts & Crafts'),
(17, 'Yoga Mat', 'Non-slippery Surface', 25.00, 5, 'Fitness'),
(18, 'Bluetooth Speaker', 'Waterproof Portable', 80.00, 1, 'Electronics'),
(19, 'Camera', 'DSLR with 1080p Video', 450.00, 1, 'Electronics'),
(20, 'Perfume', 'Floral Scent', 45.00, 2, 'Beauty');

INSERT INTO PRODUCT (Productid, Name, Description, Price, Sellerid) VALUES (21, 'ProductA1', 'DescriptionA1', 10.00, 1);
INSERT INTO PRODUCT (Productid, Name, Description, Price, Sellerid) VALUES (22, 'ProductA2', 'DescriptionA2', 15.00, 1);
INSERT INTO PRODUCT (Productid, Name, Description, Price, Sellerid) VALUES (23, 'ProductB1', 'DescriptionB1', 20.00, 2);


INSERT INTO CUSTOMER(Custid, Address, Fname, Lname, Email, Address1, Address2) VALUES
(1, '123 Tech St', 'Alice', 'Brown', 'alice@gmail.com', '123 Tech St', NULL),
(2, '456 Book Rd', 'Bob', 'Smith', 'bob@gmail.com', '456 Book Rd', 'Apt 4B'),
(3, '789 Fashion Ave', 'Charlie', 'Green', 'charlie@gmail.com', '789 Fashion Ave', NULL),
(4, '101 Home Ln', 'David', 'White', 'david@gmail.com', '101 Home Ln', NULL),
(5, '202 Shoe Blvd', 'Eva', 'Black', 'eva@gmail.com', '202 Shoe Blvd', 'Unit 5A'),
(6, '303 Sport St', 'Frank', 'Gray', 'frank@gmail.com', '303 Sport St', 'Apt 2C'),
(7, '404 Music Rd', 'Grace', 'Harris', 'grace@gmail.com', '404 Music Rd', NULL),
(8, '505 Craft Ave', 'Henry', 'Johnson', 'henry@gmail.com', '505 Craft Ave', 'Unit 10D'),
(9, '606 Travel Ln', 'Irene', 'King', 'irene@gmail.com', '606 Travel Ln', NULL),
(10, '707 Art Blvd', 'Jack', 'Lopez', 'jack@gmail.com', '707 Art Blvd', 'Apt 7F'),
(11, '808 Food St', 'Kara', 'Mills', 'kara@gmail.com', '808 Food St', NULL),
(12, '909 Party Rd', 'Liam', 'Nelson', 'liam@gmail.com', '909 Party Rd', 'Apt 1B'),
(13, '1010 Study Ave', 'Mia', 'Ortiz', 'mia@gmail.com', '1010 Study Ave', NULL),
(14, '1111 Work Ln', 'Noah', 'Peterson', 'noah@gmail.com', '1111 Work Ln', 'Unit 6G'),
(15, '1212 Relax Blvd', 'Olivia', 'Quinn', 'olivia@gmail.com', '1212 Relax Blvd', NULL),
(16, '1313 Hobby St', 'Peter', 'Russell', 'peter@gmail.com', '1313 Hobby St', 'Apt 8H'),
(17, '1414 Game Rd', 'Quincy', 'Stewart', 'quincy@gmail.com', '1414 Game Rd', NULL),
(18, '1515 Dance Ave', 'Rachel', 'Turner', 'rachel@gmail.com', '1515 Dance Ave', 'Unit 3J'),
(19, '1616 Sing Ln', 'Steve', 'Upton', 'steve@gmail.com', '1616 Sing Ln', NULL),
(20, '1717 Jump Blvd', 'Tina', 'Vance', 'tina@gmail.com', '1717 Jump Blvd', 'Apt 4K');
INSERT INTO CUSTOMER (Custid, Address, Fname, Lname, Email, Address1, Address2) VALUES (21, '123 Street', 'John', 'Doe', 'johndoe@email.com', 'Address line 1', NULL);


INSERT INTO ORDER_ (Orderid, TotalAmount, Custid) VALUES (21, 25.00, 21); 
INSERT INTO ORDER_ (Orderid, TotalAmount, Custid) VALUES (22, 20.00, 21); -- Price of ProductB1



INSERT INTO ORDERITEM (Orderitemid, Quantity, Orderid, Productid) VALUES (21, 1, 21, 1);
INSERT INTO ORDERITEM (Orderitemid, Quantity, Orderid, Productid) VALUES (22, 1, 22, 2);


INSERT INTO ORDERITEM (Orderitemid, Quantity, Orderid, Productid) VALUES (23, 1, 2, 3);


INSERT INTO ORDER_(Orderid, TotalAmount, Custid) VALUES
(1, 830.00, 1),
(2, 60.00, 2),
(3, 10.00, 3),
(4, 55.00, 4),
(5, 30.00, 5),
(6, 140.00, 6),  
(7, 90.00, 7),    
(8, 75.00, 8),
(9, 110.00, 9),
(10, 65.00, 10),
(11, 130.00, 11),
(12, 85.00, 12),
(13, 100.00, 13),
(14, 150.00, 14),
(15, 120.00, 15),
(16, 70.00, 16),
(17, 95.00, 17),
(18, 80.00, 18),
(19, 105.00, 19),
(20, 135.00, 20);

INSERT INTO ORDERITEM(Orderitemid, Quantity, Orderid, Productid) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 5, 5),
(6, 2, 6, 6),  
(7, 3, 7, 7),
(8, 1, 8, 8),
(9, 1, 9, 9),
(10, 2, 10, 10),
(11, 1, 11, 6), 
(12, 3, 12, 7),
(13, 1, 13, 8),
(14, 2, 14, 9),
(15, 1, 15, 10),
(16, 2, 16, 6),
(17, 1, 17, 7),
(18, 3, 18, 8),
(19, 1, 19, 9),
(20, 2, 20, 10);


INSERT INTO PAYMENT(Paymentid, TotalAmount, Method, Orderid) VALUES
(1, 830.00, 'Credit Card', 1),
(2, 60.00, 'Debit Card', 2),
(3, 10.00, 'PayPal', 3),
(4, 55.00, 'Credit Card', 4),
(5, 30.00, 'Debit Card', 5),
(6, 140.00, 'Debit Card', 6),
(7, 90.00, 'PayPal', 7),
(8, 75.00, 'Credit Card', 8),
(9, 110.00, 'Debit Card', 9),
(10, 65.00, 'PayPal', 10),
(11, 130.00, 'Credit Card', 11),
(12, 85.00, 'Debit Card', 12),
(13, 100.00, 'PayPal', 13),
(14, 150.00, 'Credit Card', 14),
(15, 120.00, 'Debit Card', 15),
(16, 70.00, 'PayPal', 16),
(17, 95.00, 'Credit Card', 17),
(18, 80.00, 'Debit Card', 18),
(19, 105.00, 'PayPal', 19),
(20, 135.00, 'Credit Card', 20);


INSERT INTO ADDRESS(AddressID, AddressLine1, City, State, Zip, Country, Custid) VALUES
(1, '123 Tech St', 'TechCity', 'CA', '12345', 'USA', 1),
(2, '456 Book Rd', 'ReadTown', 'NY', '45678', 'USA', 2),
(3, '789 Fashion Ave', 'StyleCity', 'TX', '78901', 'USA', 3),
(4, '101 Home Ln', 'DecorTown', 'OH', '10111', 'USA', 4),
(5, '202 Shoe Blvd', 'ShoeCity', 'FL', '20222', 'USA', 5),
(6, '303 Tech Plaza', 'CompCity', 'GA', '30333', 'USA', 6),
(7, '404 Book Park', 'LibraTown', 'CO', '40444', 'USA', 7),
(8, '505 Fashion Street', 'GlamCity', 'WA', '50555', 'USA', 8),
(9, '606 Home Gardens', 'PeaceTown', 'UT', '60666', 'USA', 9),
(10, '707 Shoe Lane', 'FootCity', 'TN', '70777', 'USA', 10),
(11, '808 Tech Tower', 'InnovCity', 'PA', '80888', 'USA', 11),
(12, '909 Book Bridge', 'WriteTown', 'NM', '90999', 'USA', 12),
(13, '1010 Fashion Drive', 'ChicCity', 'AZ', '10101', 'USA', 13),
(14, '1111 Home Heights', 'EleganceTown', 'NV', '11112', 'USA', 14),
(15, '1212 Shoe Square', 'StrideCity', 'NJ', '12123', 'USA', 15),
(16, '1313 Tech Tunnel', 'ElectroCity', 'VA', '13134', 'USA', 16),
(17, '1414 Book Boulevard', 'LiteraryLands', 'OR', '14145', 'USA', 17),
(18, '1515 Fashion Freeway', 'VogueVillage', 'KS', '15156', 'USA', 18),
(19, '1616 Home Harbor', 'LushLane', 'OK', '16167', 'USA', 19),
(20, '1717 Shoe Shore', 'WalkwayCity', 'LA', '17178', 'USA', 20);


INSERT INTO SHOPPINGCART(ShoppingCartID, Custid) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

INSERT INTO CARTITEMS(CartItemID, ShoppingCartID, ProductID, Quantity) VALUES
(1, 1, 2, 1),
(2, 2, 3, 1),
(3, 3, 4, 2),
(4, 4, 1, 1),
(5, 5, 5, 3),
(6, 6, 1, 1),
(7, 7, 2, 2),
(8, 8, 3, 1),
(9, 9, 4, 3),
(10, 10, 5, 2),
(11, 11, 1, 2),
(12, 12, 2, 1),
(13, 13, 3, 3),
(14, 14, 4, 1),
(15, 15, 5, 1),
(16, 16, 1, 3),
(17, 17, 2, 2),
(18, 18, 3, 2),
(19, 19, 4, 1),
(20, 20, 5, 3);


INSERT INTO REVIEW(ReviewID, ProductID, CustomerID, Content, Rating) VALUES
(1, 1, 2, 'Great laptop! Fast and reliable.', 5),
(2, 2, 3, 'The shoes are very comfortable.', 4),
(3, 3, 4, 'The book was an interesting read.', 4),
(4, 4, 1, 'Lovely decor piece, fits well in my living room.', 5),
(5, 5, 5, 'Fit was a bit tight but great quality.', 3),
(6, 1, 3, 'Battery life could be better.', 3),
(7, 2, 4, 'Great for daily runs!', 5),
(8, 3, 2, 'Took some time to get into, but worth it.', 4),
(9, 4, 5, 'Elegant and timeless piece.', 5),
(10, 5, 4, 'Beautiful design but slightly off in size.', 3),
(11, 2, 1, 'A bit too tight for my feet.', 2),
(12, 1, 5, 'Decent performance for the price.', 4),
(13, 3, 1, 'Could not put it down!', 5),
(14, 4, 3, 'Clock ticks a bit loudly.', 3),
(15, 5, 2, 'Stylish and summer-perfect!', 4);


INSERT INTO INVENTORY(InventoryID, ProductID, StockQuantity, ReorderThreshold, UnitCost) VALUES
(1, 1, 100, 10, 500.00),
(2, 2, 150, 15, 30.00),
(3, 3, 80, 5, 15.00),
(4, 4, 120, 10, 20.00),
(5, 5, 90, 5, 40.00),
(6, 2, 110, 10, 25.00),
(7, 3, 75, 5, 7.00),
(8, 4, 100, 15, 15.00),
(9, 1, 85, 10, 550.00),
(10, 5, 80, 5, 35.00),
(11, 1, 90, 10, 520.00),
(12, 2, 140, 15, 28.00),
(13, 3, 70, 10, 12.00),
(14, 4, 115, 5, 18.00),
(15, 5, 95, 10, 38.00);


ALTER TABLE PRODUCT
ADD Quantity INT;


INSERT INTO PRODUCT(Productid, Category, Name, Quantity) 
VALUES 
(331, 'Electronics', 'Phone', 10),
(332, 'Electronics', 'Laptop', 0),
(333, 'Home Decor', 'Vase', 20),
(334, 'Electronics', 'Camera', 15),
(335, 'Home Decor', 'Table Lamp', 25);

INSERT INTO REVIEW(ReviewId, Productid, Rating) 
VALUES 
(331, 2, 5),
(332, 4, 4),
(333, 4, 3),
(334, 1, 4),
(335, 1, 5);


SELECT 
    p.Productid,
    p.Name,
    p.Category,
    COALESCE(AVG(r.Rating), 0) AS AverageCategoryRating
FROM 
    PRODUCT p
LEFT JOIN 
    REVIEW r ON p.Productid = r.Productid
WHERE 
    p.Productid NOT IN (SELECT DISTINCT Productid FROM REVIEW)
    AND p.Quantity > 0
GROUP BY 
    p.Productid, p.Name, p.Category;


