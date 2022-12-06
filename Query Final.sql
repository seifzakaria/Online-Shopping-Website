CREATE DATABASE Project;

CREATE TABLE Users (
username VARCHAR(20),
password VARCHAR(20),
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(50),
Constraint pk_users PRIMARY KEY (username));

CREATE TABLE User_mobile_numbers(
mobile_number VARCHAR(20),
username VARCHAR(20),
Constraint pk_mobile PRIMARY KEY (mobile_number, username),
Constraint fk_mobile FOREIGN KEY (username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE User_Addresses(
address VARCHAR(100),
username VARCHAR(20),
Constraint pk_addresses PRIMARY KEY (address, username),
Constraint fk_addresses FOREIGN KEY (username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Customer (
username VARCHAR(20),
points INTEGER DEFAULT 0,
Constraint pk_customer PRIMARY KEY (username),
Constraint fk_customer FOREIGN KEY (username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Admins (
username VARCHAR(20),
Constraint pk_admins PRIMARY KEY (username),
Constraint fk_admins FOREIGN KEY (username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Vendor (
username VARCHAR(20),
activated BIT DEFAULT 0,
company_name VARCHAR(20),
bank_acc_no VARCHAR(20),
admin_username VARCHAR(20),
Constraint pk_vendor PRIMARY KEY (username),
Constraint fk1_vendor FOREIGN KEY (username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk2_vendor FOREIGN KEY (admin_username) REFERENCES Admins);

CREATE TABLE Delivery_Person (
username VARCHAR(20),
is_activated BIT DEFAULT 0,
Constraint pk_deliveryp PRIMARY KEY (username),
Constraint fk_deliveryp FOREIGN KEY (username) REFERENCES Users ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Credit_Card (
number VARCHAR(20),
expiry_date DATETIME,
cvv_code VARCHAR(20),
Constraint pk_credit_card PRIMARY KEY (number));

CREATE TABLE Giftcard (
code VARCHAR(10),
expiry_date DATE,
amount INTEGER,
username VARCHAR(20),
Constraint pk_Giftcard PRIMARY KEY (code),
Constraint fk_Giftcard FOREIGN KEY (username) REFERENCES Admins ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Delivery (
id INTEGER IDENTITY,
type VARCHAR(20),
time_duration INTEGER,
fees DECIMAL(5,3),
username VARCHAR(20)
Constraint pk_delivery PRIMARY KEY (id),
Constraint fk_delivery FOREIGN KEY (username) REFERENCES Admins ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Orders (
order_no INTEGER IDENTITY, 
order_date DATETIME,
total_amount DECIMAL (10,2),
cash_amount DECIMAL (10,2),
credit_amount DECIMAL (10,2),
payment_type VARCHAR(20),
order_status VARCHAR(20),
remaining_days INTEGER,
time_limit VARCHAR(20),
gift_card_code_used VARCHAR(10),
customer_name VARCHAR(20),
delivery_id INTEGER,
creditCard_number VARCHAR(20),
Constraint pk_orders PRIMARY KEY (order_no),
Constraint fk1_orders FOREIGN KEY (customer_name) REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk2_orders FOREIGN KEY (delivery_id) REFERENCES Delivery,
Constraint fk3_orders FOREIGN KEY (creditCard_number) REFERENCES Credit_Card,
Constraint fk4_orders FOREIGN KEY (gift_card_code_used) REFERENCES Giftcard);

CREATE TABLE Product (
serial_no INTEGER IDENTITY,
product_name VARCHAR(20),
category VARCHAR(20),
product_description TEXT,
price DECIMAl(10,2),
final_price DECIMAl(10,2),
color VARCHAR(20),
available BIT,
rate INTEGER,
vendor_username VARCHAR(20),
customer_username VARCHAR(20),
customer_order_id INTEGER,
Constraint pk_product PRIMARY KEY (serial_no),
Constraint fk1_product FOREIGN KEY (vendor_username) REFERENCES Vendor ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk2_product FOREIGN KEY (customer_order_id) REFERENCES Orders,
Constraint fk3_product FOREIGN KEY (customer_username) REFERENCES Customer);

CREATE TABLE CustomerAddsCartProduct (
serial_no INTEGER,
customer_name VARCHAR(20),
Constraint pk_CustomerAddsCartProduct PRIMARY KEY (serial_no, customer_name),
Constraint fk1_CustomerAddsCartProduct FOREIGN KEY (serial_no) REFERENCES Product ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk2_CustomerAddsCartProduct FOREIGN KEY (customer_name) REFERENCES Customer);

CREATE TABLE Todays_Deals (
deal_id INTEGER IDENTITY,
deal_amount INTEGER,
expiry_date DATE,
admin_username VARCHAR(20),
Constraint pk_deals PRIMARY KEY (deal_id),
Constraint fk_deals FOREIGN KEY (admin_username) REFERENCES Admins ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Todays_Deals_Product (
deal_id INTEGER,
serial_no INTEGER,
Constraint pk_deals_product PRIMARY KEY (deal_id, serial_no),
Constraint fk1_deals_product FOREIGN KEY (deal_id) REFERENCES Todays_Deals ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk2_deals_product FOREIGN KEY (serial_no) REFERENCES Product);

CREATE TABLE offer (
offer_id INTEGER IDENTITY,
offer_amount INTEGER,
expiry_date DATETIME
Constraint pk_offer PRIMARY KEY (offer_id));


CREATE TABLE offersOnProduct (
offer_id INTEGER,
serial_no INTEGER,
Constraint pk_offerOnProduct PRIMARY KEY (offer_id, serial_no),
Constraint fk1_offerOnProduct FOREIGN KEY (offer_id) REFERENCES offer ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk2_offerOnProduct FOREIGN KEY (serial_no) REFERENCES Product);

CREATE TABLE Customer_Question_Product (
serial_no INTEGER,
customer_name VARCHAR(20),
question VARCHAR(50),
answer TEXT,
Constraint pk_Customer_Question_Product PRIMARY KEY (serial_no, customer_name),
Constraint fk1_Customer_Question_Product FOREIGN KEY (serial_no) REFERENCES Product ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk2_Customer_Question_Product FOREIGN KEY (customer_name) REFERENCES Customer);

CREATE TABLE Wishlist (
username VARCHAR(20),
name VARCHAR(20),
Constraint pk_Wishlist PRIMARY KEY (username, name),
Constraint fk_Wishlist FOREIGN KEY (username) REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Wishlist_Product (
username VARCHAR(20),
wish_name VARCHAR(20),
serial_no INTEGER,
Constraint pk_Wishlist_Product PRIMARY KEY (username, wish_name, serial_no),
Constraint fk1_Wishlist_Product FOREIGN KEY (username, wish_name) REFERENCES Wishlist ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk2_Wishlist_Product FOREIGN KEY (serial_no) REFERENCES Product);

CREATE TABLE Admin_Customer_Giftcard (
code VARCHAR(10),
customer_name VARCHAR(20),
admin_username VARCHAR(20),
remaining_points INTEGER,
Constraint pk_Admin_Customer_Giftcard PRIMARY KEY (code, customer_name, admin_username),
Constraint fk1_Admin_Customer_Giftcard FOREIGN KEY (code) REFERENCES Giftcard ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk2_Admin_Customer_Giftcard FOREIGN KEY (customer_name) REFERENCES Customer,
Constraint fk3_Admin_Customer_Giftcard FOREIGN KEY (admin_username) REFERENCES Admins);

CREATE TABLE Admin_Delivery_Order(
delivery_username VARCHAR(20),
order_no INTEGER,
admin_username VARCHAR(20),
delivery_window VARCHAR(50),
Constraint pk_Admin_Delivery_Order PRIMARY KEY (delivery_username, order_no),
Constraint fk1_Admin_Delivery_Order FOREIGN KEY (delivery_username) REFERENCES Delivery_person ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk2_Admin_Delivery_Order FOREIGN KEY (order_no) REFERENCES orders,
Constraint fk3_Admin_Delivery_Order FOREIGN KEY (admin_username) REFERENCES Admins);

CREATE TABLE Customer_CreditCard (
customer_name VARCHAR(20),
cc_number VARCHAR(20),
Constraint pk_Customer_CreditCard PRIMARY KEY (customer_name, cc_number),
Constraint fk1_Customer_CreditCard FOREIGN KEY (customer_name) REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk2_Customer_CreditCard FOREIGN KEY (cc_number) REFERENCES Credit_Card);

go 
CREATE PROC customerRegister
@username VARCHAR(20),
@first_name VARCHAR(20),
@last_name VARCHAR(20),
@password VARCHAR(20),
@email VARCHAR(50)
AS
INSERT INTO Users VALUES(@username, @password, @first_name, @last_name, @email)
INSERT INTO Customer VALUES (@username, 0)

go 
CREATE PROC vendorRegister
@username VARCHAR(20),
@first_name VARCHAR(20),
@last_name VARCHAR(20),
@password VARCHAR(20),
@email VARCHAR(50),
@company_name VARCHAR(20),
@banc_acc_no VARCHAR(20)
AS
INSERT INTO Users VALUES (@username, @password, @first_name, @last_name, @email)
INSERT INTO Vendor VALUES (@username, 0, @company_name, @banc_acc_no, null)

go 
CREATE PROC userLogin
@username VARCHAR(20),
@password VARCHAR(20),
@success BIT OUTPUT,
@type INTEGER OUTPUT
AS
IF EXISTS (SELECT username FROM Users WHERE (username = @username AND password = @password)) 
SET @success = 1
ELSE
SET @success = 0

IF @success = 1 AND EXISTS (SELECT username FROM Customer WHERE username = @username)
SET @type = 0
ELSE IF @success = 1 AND EXISTS (SELECT username FROM Vendor WHERE username = @username)
SET @type = 1
ELSE IF @success = 1 AND EXISTS (SELECT username FROM Admins WHERE username = @username)
SET @type = 2
ELSE IF @success = 1 AND EXISTS (SELECT username FROM Delivery_Person WHERE username = @username)
SET @type = 3
ELSE 
SET @type = -1

go 
CREATE PROC addMobile
@username VARCHAR(20),
@mobile_number VARCHAR(20)
AS
INSERT INTO User_mobile_numbers VALUES (@mobile_number, @username)

go 
CREATE PROC addAddress
@username VARCHAR(20),
@address VARCHAR(100)
AS
INSERT INTO User_Addresses VALUES (@address, @username)

go 
CREATE PROC showProducts 
AS
SELECT *
FROM Product
WHERE available = '1'

go
CREATE PROC ShowProductsbyPrice
AS
SELECT *
FROM Product
WHERE available = '1'
ORDER BY price

go 
CREATE PROC searchbyname
@text VARCHAR(20)
AS
SELECT *
FROM Product
WHERE product_name LIKE '%[@text]%' AND available = '1'

go 
CREATE PROC AddQuestion
@serial INTEGER,
@customer VARCHAR(20),
@Question VARCHAR(50)
AS
INSERT INTO Customer_Question_Product VALUES (@serial, @customer, @Question, null)

go 
CREATE PROC addToCart
@customername VARCHAR(20),
@serial INTEGER
AS
INSERT INTO CustomerAddsCartProduct VALUES (@serial, @customername)

go 
CREATE PROC removefromCart
@customername VARCHAR(20),
@serial INTEGER
AS
DELETE FROM CustomerAddsCartProduct WHERE (serial_no = @serial AND customer_name = @customername)

go 
CREATE PROC createWishlist
@customername VARCHAR(20),
@name VARCHAR(20)
AS
INSERT INTO Wishlist VALUES (@customername, @name)

go 
CREATE PROC AddtoWishlist
@customername VARCHAR(20),
@wishistname VARCHAR(20),
@serial INTEGER
AS
INSERT INTO Wishlist_Product VALUES (@customername, @wishistname, @serial)

go 
CREATE PROC removefromWishlist
@customername VARCHAR(20),
@wishistname VARCHAR(20),
@serial INTEGER
AS
DELETE FROM Wishlist_Product WHERE (username = @customername AND wish_name = @wishistname AND serial_no = @serial)

go 
CREATE PROC showWishlistProduct
@customername VARCHAR(20),
@name VARCHAR(20)
AS
SELECT P.*
FROM Wishlist_Product W INNER JOIN Product P ON W.serial_no = P.serial_no
WHERE username = @customername AND wish_name = @name

go 
CREATE PROC viewMyCart
@customer VARCHAR(20)
AS
SELECT P.*
FROM CustomerAddsCartProduct C INNER JOIN Product P ON C.serial_no = P.serial_no
WHERE customer_name = @customer

go 
CREATE PROC calculatepriceOrder
@customername VARCHAR(20),
@sum DECIMAL(10,2) OUTPUT
AS
SELECT @sum = SUM(P.price)
FROM CustomerAddsCartProduct C INNER JOIN Product P ON C.serial_no = P.serial_no
WHERE customer_name = @customername

go 
CREATE PROC productsinorder
@customername VARCHAR(20),
@orderID INTEGER
AS
UPDATE Product
SET available = '0', customer_username = @customername, customer_order_id = @orderID
WHERE serial_no IN (SELECT P.serial_no 
					FROM CustomerAddsCartProduct C INNER JOIN Product P 
					ON C.serial_no = P.serial_no 
					WHERE customer_name = @customername)

DELETE FROM CustomerAddsCartProduct 
WHERE serial_no IN (SELECT P.serial_no 
					FROM CustomerAddsCartProduct C INNER JOIN Product P 
					ON C.serial_no = P.serial_no 
					WHERE customer_name = @customername) 
					AND customer_name <> @customername

go 
CREATE PROC emptyCart
@customername VARCHAR(20)
AS
DELETE FROM CustomerAddsCartProduct WHERE customer_name = @customername

go 
CREATE PROC makeOrder
@customername VARCHAR(20),
@total1 DECIMAL(10,2) OUTPUT,
@id INTEGER OUTPUT
AS

DECLARE @total DECIMAL(10,2)
EXEC calculatepriceOrder @customername, @total OUTPUT
SET @total1 = @total

INSERT INTO Orders VALUES (CURRENT_TIMESTAMP, @total, null, null, null, 'not processed', null, null, null, @customername, null, null)

SELECT @id = SCOPE_IDENTITY()
FROM Orders

EXEC productsinorder @customername, @id
EXEC emptyCart @customername

go
CREATE PROC cancelOrder
@orderid INTEGER,
@success BIT OUTPUT
AS
IF EXISTS (SELECT order_no FROM Orders WHERE order_no = @orderid AND (order_status = 'not processed' OR order_status = 'in process'))
BEGIN
	SET @success = 1
	IF EXISTS (SELECT gift_card_code_used FROM Orders WHERE order_no = @orderid)
	BEGIN
		DECLARE @gcard_code VARCHAR(20)
		SELECT @gcard_code = G.code
		FROM Orders O INNER JOIN Giftcard G ON O.gift_card_code_used = G.code
		WHERE O.order_no = @orderid

		DECLARE @total VARCHAR(20)
		SELECT @total = total_amount
		FROM Orders
		WHERE order_no = @orderid

		DECLARE @points_used VARCHAR(20)

		IF CURRENT_TIMESTAMP < (SELECT expiry_date
								FROM Giftcard
								WHERE code = @gcard_code)
		BEGIN
		UPDATE Admin_Customer_Giftcard
		SET remaining_points = remaining_points + @points_used
		WHERE code = @gcard_code

		UPDATE Customer
		SET points = points + @points_used
		WHERE username IN (SELECT customer_name
						   FROM Orders
						   WHERE order_no = @orderid)
		END
	END
	UPDATE Product
	SET available = '1', customer_username = null, customer_order_id = null
	WHERE customer_order_id = @orderid
	DELETE FROM Orders WHERE order_no = @orderid
END

go 
CREATE PROC returnProduct
@serialno INTEGER,
@orderid INTEGER
AS
UPDATE Product
SET available = '1', customer_username = null, customer_order_id = null
WHERE serial_no = @serialno

DECLARE @product_price DECIMAL(10,2)
SELECT @product_price = final_price
FROM Product
WHERE serial_no = @serialno

IF EXISTS (SELECT gift_card_code_used FROM Orders WHERE order_no = @orderid)
BEGIN
	DECLARE @gcard_code VARCHAR(20)
	SELECT @gcard_code = gift_card_code_used
	FROM Orders
	WHERE order_no = @orderid

	DECLARE @total VARCHAR(20)
	SELECT @total = total_amount
	FROM Orders
	WHERE order_no = @orderid

	DECLARE @points_used INTEGER
	
	IF EXISTS (SELECT cash_amount FROM Orders WHERE order_no = @orderid)
	BEGIN
		DECLARE @cash DECIMAL(10,2)
		SELECT @cash = cash_amount FROM Orders WHERE order_no = @orderid
		SET @points_used = @total - @product_price
	END
	ELSE
	BEGIN
		DECLARE @credit DECIMAL(10,2)
		SELECT @credit = credit_amount FROM Orders WHERE order_no = @orderid
		SET @points_used = @total - @credit
	END

	IF CURRENT_TIMESTAMP < (SELECT expiry_date
							FROM Giftcard
							WHERE code = @gcard_code)
	BEGIN
		DECLARE @returned_points INTEGER

		IF @product_price > @points_used OR @product_price = @points_used 
		SET @returned_points = @points_used
		
		ELSE
		SET @returned_points = @product_price

		UPDATE Admin_Customer_Giftcard
		SET remaining_points = remaining_points + @returned_points
		WHERE code = @gcard_code

		UPDATE Customer
		SET points = points + @returned_points
		WHERE username IN (SELECT customer_name
						   FROM Orders
						   WHERE order_no = @orderid)
	END
END

UPDATE Orders
SET total_amount = total_amount - @product_price
WHERE order_no = @orderid

go 
CREATE PROC ShowproductsIbought
@customername VARCHAR(20)
AS
SELECT P.*
FROM Orders O INNER JOIN Product P ON O.order_no = P.customer_order_id
WHERE O.customer_name = @customername

EXEC ShowproductsIbought 'ahmed.ashraf'


go 
CREATE PROC rate
@serialno INTEGER,
@rate INTEGER,
@customername VARCHAR(20)
AS

IF @serialno IN (SELECT P.serial_no
				  FROM Orders O INNER JOIN Product P ON O.order_no = P.customer_order_id
				  WHERE O.customer_name = @customername)
BEGIN
UPDATE Product
SET rate = @rate
WHERE serial_no = @serialno AND customer_username = @customername
END

go
CREATE PROC SpecifyAmount
@customername VARCHAR(20),
@orderID INTEGER,
@cash DECIMAL(10,2),
@credit DECIMAL(10,2)
AS

DECLARE @total DECIMAL(10,2)
SELECT @total = total_amount
FROM Orders
WHERE order_no = @orderID

IF @cash = @total OR @credit = @total
BEGIN
	IF @cash IS NULL
	BEGIN
	UPDATE Orders
	SET cash_amount = @cash, credit_amount = @credit, payment_type = 'credit'
	WHERE order_no = @orderID
	END
	ELSE
	BEGIN
	UPDATE Orders
	SET cash_amount = @cash, credit_amount = @credit, payment_type = 'cash'
	WHERE order_no = @orderID
	END
END

ELSE
BEGIN
	DECLARE @gcard_code VARCHAR(20)
	SELECT @gcard_code = code
	FROM Admin_Customer_Giftcard
	WHERE customer_name = @customername 

	IF @cash IS NULL
	BEGIN
	UPDATE Orders
	SET cash_amount = @cash, credit_amount = @credit, payment_type = 'credit', gift_card_code_used = @gcard_code
	WHERE order_no = @orderID
	UPDATE Admin_Customer_Giftcard
	SET remaining_points = @total-@credit
	WHERE code = @gcard_code
	UPDATE Customer
	SET points = @total-@credit
	WHERE username = @customername
	END
	ELSE IF @credit IS NULL
	BEGIN
	UPDATE Orders
	SET cash_amount = @cash, credit_amount = @credit, payment_type = 'cash', gift_card_code_used = @gcard_code
	WHERE order_no = @orderID
	UPDATE Admin_Customer_Giftcard
	SET remaining_points = remaining_points - (@total-@cash)
	WHERE code = @gcard_code
	UPDATE Customer
	SET points = points - (@total-@cash)
	WHERE username = @customername
	END
END

go 
CREATE PROC AddCreditCard
@creditcardnumber VARCHAR(20),
@expirydate DATE,
@cvv VARCHAR(4),
@customername VARCHAR(20)
AS
INSERT INTO Credit_Card VALUES (@creditcardnumber, @expirydate, @cvv)
INSERT INTO Customer_CreditCard VALUES (@customername, @creditcardnumber)

go 
CREATE PROC ChooseCreditCard
@creditcard VARCHAR(20), 
@orderid INTEGER
AS

UPDATE Orders
SET creditCard_number = @creditcard
WHERE order_no = @orderid

go 
CREATE PROC vewDeliveryTypes
AS
SELECT *
FROM Delivery

go 
CREATE PROC specifydeliverytype
@orderID INTEGER,
@deliveryID INTEGER
AS
DECLARE @days INTEGER
SELECT @days = time_duration
FROM Delivery
WHERE id = @deliveryID

UPDATE Orders
SET delivery_id = @deliveryID, remaining_days = @days, time_limit = @days
WHERE order_no = @orderID

go 
CREATE PROC trackRemainingDays
@orderid INTEGER,
@customername VARCHAR(20),
@days INTEGER OUTPUT
AS
DECLARE @order_date DATETIME
SELECT @order_date = order_date
FROM Orders
WHERE order_no = @orderid AND customer_name = @customername

DECLARE @del_days INTEGER
SELECT @del_days = D.time_duration
FROM Orders O INNER JOIN Delivery D ON O.delivery_id = D.id
WHERE order_no = @orderid AND customer_name = @customername

SET @days = @del_days - DATEDIFF(DAY, @order_date, CURRENT_TIMESTAMP)

UPDATE Orders
SET remaining_days = @days
WHERE order_no = @orderid AND customer_name = @customername

go 
CREATE PROC recommend
@customername VARCHAR(20)
AS
SELECT *
FROM Product
WHERE serial_no IN ((SELECT TOP 3 P.serial_no
					FROM Wishlist_Product W INNER JOIN Product P ON W.serial_no = P.serial_no
					WHERE W.username <> @customername AND
						  P.category IN (SELECT TOP 3 P.category
										 FROM CustomerAddsCartProduct C INNER JOIN Product P ON C.serial_no = P.serial_no
										 WHERE customer_name = @customername
										 GROUP BY P.category
										 ORDER BY COUNT(*) DESC) AND
						  P.serial_no NOT IN (SELECT serial_no
											  FROM CustomerAddsCartProduct
											  WHERE customer_name = @customername)
					GROUP BY P.serial_no
					ORDER BY COUNT(*) DESC 
					)
					UNION
					(SELECT TOP 3 P.serial_no
					FROM Wishlist_Product W INNER JOIN Product P ON W.serial_no = P.serial_no
					WHERE W.username <> @customername AND
						  W.username IN (SELECT TOP 3 customer_name
										 FROM CustomerAddsCartProduct
										 WHERE serial_no IN (SELECT serial_no
															 FROM CustomerAddsCartProduct
															 WHERE customer_name = @customername
															 ) AND
											   customer_name <> @customername
										 GROUP BY customer_name
										 ORDER BY COUNT(*) DESC
										 )
					      AND P.serial_no NOT IN (SELECT serial_no
											      FROM CustomerAddsCartProduct
											      WHERE customer_name = @customername)
					GROUP BY P.serial_no
					ORDER BY COUNT(*) DESC
				   ))

go 
CREATE PROC postProduct
@vendorUsername VARCHAR(20),
@product_name VARCHAR(20),
@category VARCHAR(20), 
@product_description TEXT, 
@price DECIMAL(10,2),
@color VARCHAR(20)
AS
INSERT INTO Product VALUES (@product_name, @category, @product_description, @price, null, @color, 1, null, @vendorUsername, null, null)

go
CREATE PROC vendorviewProducts
@vendorname VARCHAR(20)
AS
SELECT *
FROM Product
WHERE vendor_username = @vendorname

go
CREATE PROC EditProduct
@vendorname VARCHAR(20),
@serialnumber INTEGER,
@product_name VARCHAR(20),
@category VARCHAR(20),
@product_description TEXT,
@price DECIMAL(10,2),
@color VARCHAR(20)
AS
IF EXISTS (SELECT * FROM Product WHERE vendor_username = @vendorname AND serial_no = @serialnumber)
BEGIN
	IF @product_name IS NOT NULL
	UPDATE Product
	SET product_name = @product_name
	WHERE serial_no = @serialnumber AND vendor_username = @vendorname

	IF @category IS NOT NULL
	UPDATE Product
	SET category = @category
	WHERE serial_no = @serialnumber AND vendor_username = @vendorname

	IF @product_description IS NOT NULL
	UPDATE Product
	SET product_description = @product_description
	WHERE serial_no = @serialnumber AND vendor_username = @vendorname

	IF @price IS NOT NULL
	UPDATE Product
	SET price = @price
	WHERE serial_no = @serialnumber AND vendor_username = @vendorname

	IF @color IS NOT NULL
	UPDATE Product
	SET color = @color
	WHERE serial_no = @serialnumber AND vendor_username = @vendorname
END

go
CREATE PROC deleteProduct
@vendorname VARCHAR(20),
@serialnumber INTEGER
AS
DELETE FROM Product WHERE serial_no = @serialnumber AND vendor_username = @vendorname

go
CREATE PROC viewQuestions
@vendorname VARCHAR(20)
AS
SELECT Q.*
FROM Product P INNER JOIN Customer_Question_Product Q ON P.serial_no = Q.serial_no
WHERE vendor_username = @vendorname

go
CREATE PROC answerQuestions
@vendorname VARCHAR(20),
@serialno INTEGER,
@customername VARCHAR(20),
@answer TEXT
AS
IF @vendorname IN (SELECT vendor_username FROM Product WHERE serial_no = @serialno)
BEGIN
UPDATE Customer_Question_Product
SET answer = @answer
WHERE serial_no = @serialno AND customer_name = @customername
END

go 
CREATE PROC addOffer
@offeramount INTEGER,
@expiry_date DATETIME
AS
INSERT INTO offer VALUES (@offeramount, @expiry_date)

go
CREATE PROC checkOfferonProduct
@serial INTEGER,
@activeoffer BIT OUTPUT
AS
IF EXISTS (SELECT offer_id FROM offersOnProduct WHERE serial_no = @serial)
SET @activeoffer = 1
ELSE
SET @activeoffer = 0

go
CREATE PROC checkandremoveExpiredoffer
@offerid INTEGER
AS

IF CURRENT_TIMESTAMP > ALL (SELECT expiry_date FROM offer WHERE offer_id = @offerid)
BEGIN
DECLARE @discount DECIMAL(10,2)
SELECT @discount = offer_amount
FROM offer
WHERE offer_id = @offerid

UPDATE Product
SET final_price = final_price+ (price*(@discount/100))
WHERE serial_no IN (SELECT serial_no FROM offersOnProduct WHERE offer_id = @offerid)

DELETE FROM offer WHERE offer_id = @offerid AND CURRENT_TIMESTAMP > expiry_date
END

go
CREATE PROC applyOffer
@vendorname VARCHAR(20),
@offerid INTEGER,
@serial INTEGER
AS

DECLARE @active BIT
EXEC checkOfferonProduct @serial, @active OUTPUT

DECLARE @expire DATETIME
SELECT @expire = expiry_date
FROM offer
WHERE offer_id = @offerid

IF @active = 0
BEGIN
	IF CURRENT_TIMESTAMP > @expire
	EXEC checkandremoveExpiredoffer @offerid
	ELSE
	BEGIN
		INSERT INTO offersOnProduct VALUES (@offerid, @serial)

		DECLARE @price DECIMAL(10,2)
		SELECT @price = price
		FROM Product
		WHERE serial_no = @serial AND vendor_username = @vendorname

		DECLARE @discount DECIMAL(10,2)
		SELECT @discount = offer_amount
		FROM offer
		WHERE offer_id = @offerid

		UPDATE Product
		SET final_price = final_price - (price*(@discount/100))
		WHERE serial_no = @serial AND vendor_username = @vendorname
	END
END
ELSE IF @active = 1
BEGIN
	IF CURRENT_TIMESTAMP > ALL (SELECT expiry_date 
								FROM offersOnProduct P INNER JOIN offer O ON P.offer_id = O.offer_id
								WHERE P.serial_no = @serial)
	BEGIN
		DECLARE @old_offer INTEGER
		SELECT @old_offer = offer_id
		FROM offer
		WHERE offer_id = @offerid

		EXEC checkandremoveExpiredoffer @old_offer

		UPDATE Product
		SET final_price = final_price - (price*(@discount/100))
		WHERE serial_no = @serial AND vendor_username = @vendorname

		INSERT INTO offersOnProduct VALUES (@offerid, @serial)
	END
	ELSE
	PRINT 'The product has an active offer'
END

go
CREATE PROC activateVendors
@admin_username VARCHAR(20),
@vendor_username VARCHAR(20)
AS
UPDATE Vendor
SET activated = 1, admin_username = @admin_username
WHERE username = @vendor_username

go
CREATE PROC inviteDeliveryPerson
@delivery_username VARCHAR(20),
@delivery_email VARCHAR(50)
AS
INSERT INTO Users VALUES (@delivery_username, null, null, null, @delivery_email)
INSERT INTO Delivery_Person VALUES (@delivery_username, 0)

go
CREATE PROC reviewOrders
AS
SELECT *
FROM Orders

go
CREATE PROC updateOrderStatusInProcess
@order_no INTEGER
AS
UPDATE Orders
SET order_status = 'in process'
WHERE order_no = @order_no

go
CREATE PROC addDelivery
@delivery_type VARCHAR(20),
@time_duration INTEGER,
@fees DECIMAL(5,3),
@admin_username VARCHAR(20)
AS
INSERT INTO Delivery VALUES (@delivery_type, @time_duration, @fees, @admin_username)

go
CREATE PROC assignOrdertoDelivery
@delivery_username VARCHAR(20),
@order_no INTEGER,
@admin_username VARCHAR(20)
AS
INSERT INTO Admin_Delivery_Order VALUES (@delivery_username, @order_no, @admin_username, null)

go
CREATE PROC createTodaysDeal
@deal_amount INTEGER,
@admin_username VARCHAR(20),
@expiry_date DATETIME
AS
INSERT INTO Todays_Deals VALUES (@deal_amount, @expiry_date, @admin_username)

go
CREATE PROC checkTodaysDealOnProduct
@serial_no INTEGER,
@activeDeal BIT OUTPUT
AS
IF EXISTS (SELECT deal_id FROM Todays_Deals_Product WHERE serial_no = @serial_no)
SET @activeDeal = 1
ELSE
SET @activeDeal = 0

go
CREATE PROC removeExpiredDeal
@deal_iD INTEGER
AS
IF CURRENT_TIMESTAMP > ALL (SELECT expiry_date FROM Todays_Deals WHERE deal_id = @deal_iD)
BEGIN

DECLARE @discount DECIMAL(10,2)
SELECT @discount = deal_amount
FROM Todays_Deals
WHERE deal_id = @deal_iD

UPDATE Product
SET final_price = final_price + (price*(@discount/100))
WHERE serial_no IN (SELECT serial_no FROM Todays_Deals_Product WHERE deal_id = @deal_iD)

DELETE FROM Todays_Deals WHERE deal_id = @deal_iD
END

go
CREATE PROC addTodaysDealOnProduct
@deal_id INTEGER, 
@serial_no INTEGER
AS

DECLARE @active BIT
EXEC checkTodaysDealOnProduct @serial_no, @active OUTPUT

DECLARE @expire DATETIME
SELECT @expire = expiry_date
FROM Todays_Deals
WHERE deal_id = @deal_id

IF @active = 0
BEGIN
	IF CURRENT_TIMESTAMP > @expire
	EXEC removeExpiredDeal @deal_id
	ELSE
	BEGIN
		INSERT INTO Todays_Deals_Product VALUES (@deal_id, @serial_no)

		DECLARE @price DECIMAL(10,2)
		SELECT @price = price
		FROM Product
		WHERE serial_no = @serial_no

		DECLARE @discount DECIMAL(10,2)
		SELECT @discount = deal_amount
		FROM Todays_Deals
		WHERE deal_id = @deal_id

		UPDATE Product
		SET final_price = @price-(price*(@discount/100))
		WHERE serial_no = @serial_no
	END
END
ELSE IF @active = 1
BEGIN
	IF CURRENT_TIMESTAMP > ALL (SELECT expiry_date 
								FROM Todays_Deals_Product P INNER JOIN Todays_Deals D ON P.deal_id = D.deal_id
								WHERE P.serial_no = @serial_no)
	BEGIN
		DECLARE @old_deal INTEGER
		SELECT @old_deal = deal_id
		FROM Todays_Deals_Product
		WHERE serial_no = @serial_no

		EXEC removeExpiredDeal @old_deal

		UPDATE Product
		SET final_price = final_price - (price*(@discount/100))
		WHERE serial_no = @serial_no

		INSERT INTO Todays_Deals_Product VALUES (@deal_id, @serial_no)
	END
	ELSE
	PRINT 'The product has an active deal'
END 

go
CREATE PROC createGiftCard
@code VARCHAR(10),
@expiry_date DATETIME,
@amount INTEGER,
@admin_username VARCHAR(20)
AS
INSERT INTO Giftcard VALUES (@code, @expiry_date, @amount, @admin_username)

go
CREATE PROC removeExpiredGiftCard
@code VARCHAR(10)
AS
IF CURRENT_TIMESTAMP > ALL (SELECT expiry_date FROM Giftcard WHERE code = @code)
BEGIN

DECLARE @card_points INTEGER
SELECT @card_points = amount
FROM Giftcard
WHERE code = @code

UPDATE Customer
SET points = points-@card_points
WHERE username IN (SELECT customer_name FROM Admin_Customer_Giftcard WHERE code = @code)

DELETE FROM Giftcard WHERE code = @code
END

go
CREATE PROC checkGiftCardOnCustomer
@code VARCHAR(10),
@activeGiftCard BIT OUTPUT
AS
IF EXISTS (SELECT customer_name FROM Admin_Customer_Giftcard WHERE code = @code)
SET @activeGiftCard = 1
ELSE
SET @activeGiftCard = 0

go
CREATE PROC giveGiftCardtoCustomer
@code VARCHAR(10),
@customer_name VARCHAR(20),
@admin_username VARCHAR(20)
AS
DECLARE @card_points INTEGER
SELECT @card_points = amount
FROM Giftcard
WHERE code = @code

UPDATE Customer
SET points = points + @card_points
WHERE username = @customer_name

INSERT INTO Admin_Customer_Giftcard VALUES (@code, @customer_name, @admin_username, @card_points)

go
CREATE PROC acceptAdminInvitation
@delivery_username VARCHAR(20)
AS
UPDATE Delivery_Person
SET is_activated = 1
WHERE username = @delivery_username

go
CREATE PROC deliveryPersonUpdateInfo
@username VARCHAR(20),
@first_name VARCHAR(20),
@last_name VARCHAR(20),
@password VARCHAR(20),
@email VARCHAR(50)
AS
UPDATE Users
SET first_name = @first_name, last_name = @last_name, password = @password, email = @email
WHERE username = @username

go
CREATE PROC viewmyorders
@deliveryperson VARCHAR(20)
AS
SELECT O.*
FROM Orders O INNER JOIN Admin_Delivery_Order D ON O.order_no = D.order_no 
WHERE D.delivery_username = @deliveryperson

go
CREATE PROC specifyDeliveryWindow
@delivery_username VARCHAR(20),
@order_no INTEGER,
@delivery_window VARCHAR(50)
AS
UPDATE Admin_Delivery_Order
SET delivery_window = @delivery_window
WHERE delivery_username = @delivery_username AND order_no = @order_no

go
CREATE PROC updateOrderStatusOutforDelivery
@order_no INTEGER
AS
UPDATE Orders
SET order_status = 'Out for delivery'
WHERE order_no = @order_no

go
CREATE PROC updateOrderStatusDelivered
@order_no INTEGER
AS
UPDATE Orders
SET order_status = 'Delivered'
WHERE order_no = @order_no


/*Inserts

INSERT INTO Users VALUES ('hana.aly', 'pass1', 'hana', 'aly', 'hana.aly@guc.edu.eg')
INSERT INTO Users VALUES ('ammar.yasser', 'pass4', 'ammar', 'yasser', 'ammar.yasser@guc.edu.eg')
INSERT INTO Users VALUES ('nada.sharaf', 'pass7', 'nada', 'sharaf', 'nada.sharaf@guc.edu.eg')
INSERT INTO Users VALUES ('hadeel.adel', 'pass13', 'hadeel', 'adel', 'hadeel.adel@guc.edu.eg')
INSERT INTO Users VALUES ('mohamed.tamer', 'pass16', 'mohamed', 'tamer', 'mohamed.tamer@guc.edu.eg')

INSERT INTO Admins VALUES ('hana.aly')
INSERT INTO Admins VALUES ('nada.sharaf')

INSERT INTO Customer VALUES ('ammar.yasser', 15)

INSERT INTO Vendor VALUES ('hadeel.adel', 1, 'Dello', '47449349234', 'hana.aly')

INSERT INTO Delivery_Person VALUES ('mohamed.tamer', 1)

INSERT INTO User_Addresses VALUES ('Heliopolis', 'hana.aly')
INSERT INTO User_Addresses VALUES ('New Cairo', 'hana.aly')

INSERT INTO User_mobile_numbers VALUES ('01111111111', 'hana.aly') 
INSERT INTO User_mobile_numbers VALUES ('1211555411', 'hana.aly')

INSERT INTO Credit_Card VALUES ('4444-5555-6666-8888', '2028-10-19', '232')

INSERT INTO Delivery VALUES ('pick-up', 7, 10, null)
INSERT INTO Delivery VALUES ('regular', 14, 30, null)
INSERT INTO Delivery VALUES ('speedy', 1, 50, null)

INSERT INTO Product VALUES ('Bag', 'Fashion', 'backbag', 100, 100, 'yellow', 1, 0, 'hadeel.adel', null, null)
INSERT INTO Product VALUES ('Blue pen', 'stationary', 'useful pen', 10, 10, 'Blue', 1, 0, 'hadeel.adel', null, null)
INSERT INTO Product VALUES ('Blue pen', 'stationary', 'useful pen', 10, 10, 'Blue', 0, 0, 'hadeel.adel', null, null)

INSERT INTO CustomerAddsCartProduct VALUES (1, 'ammar.yasser')

INSERT INTO Todays_Deals VALUES (30, '2019-11-30', 'hana.aly')
INSERT INTO Todays_Deals VALUES (40, '2019-11-18', 'hana.aly')
INSERT INTO Todays_Deals VALUES (50, '2019-12-12', 'hana.aly')

INSERT INTO offer VALUES (50, '2019-11-30')

INSERT INTO Wishlist VALUES ('ammar.yasser', 'fashion')

INSERT INTO Wishlist_Product VALUES ('ammar.yasser', 'fashion', 2)

INSERT INTO Giftcard VALUES ('G101', '2019-11-18', 100, null)

INSERT INTO Customer_CreditCard VALUES ('ammar.yasser', '4444-5555-6666-8888')
*/

/*test cases

EXEC customerRegister 'ahmed.ashraf', 'ahmed', 'ashraf', 'pass123', 'ahmed@yahoo.com'
EXEC vendorRegister 'eslam.mahmod', 'eslam', 'mahmod', 'pass1234', 'hopa@gmail.com', 'Market', '132132513'

DECLARE @success BIT, @type INTEGER
--EXEC userLogin 'eslam.mahmod', 'pass123', @success OUTPUT, @type OUTPUT
--EXEC userLogin 'eslam.mahmod', 'pass1234', @success OUTPUT, @type OUTPUT
--EXEC userLogin 'ahmed.ashraf', 'pass123', @success OUTPUT, @type OUTPUT
EXEC userLogin 'ahmed.ashraf', 'pass', @success OUTPUT, @type OUTPUT
Print 'success --> ' + CAST(@success AS VARCHAR) + ' , type --> ' + CAST(@type AS VARCHAR)

EXEC addMobile 'ahmed.ashraf', '01111211122'
EXEC addMobile 'ahmed.ashraf', '0124262652'
EXEC addAddress 'ahmed.ashraf', 'nasr city'
EXEC showProducts
EXEC ShowProductsbyPrice
EXEC searchbyname 'blue'
EXEC AddQuestion 1, 'ahmed.ashraf', 'size?'
EXEC addToCart 'ahmed.ashraf', 1
EXEC addToCart 'ahmed.ashraf', 2
EXEC removefromCart 'ahmed.ashraf', 2
EXEC createWishlist 'ahmed.ashraf', 'fashion'
EXEC AddtoWishlist 'ahmed.ashraf', 'fashion', 1
EXEC AddtoWishlist 'ahmed.ashraf', 'fashion', 2
EXEC removefromWishlist 'ahmed.ashraf', 'fashion', 1
EXEC showWishlistProduct 'ahmed.ashraf', 'fashion'
EXEC viewMyCart 'ahmed.ashraf'

DECLARE @sum DECIMAL(10,2)
EXEC calculatepriceOrder 'ahmed.ashraf', @sum OUTPUT
PRINT @sum

EXEC emptyCart 'ahmed.ashraf'
EXEC makeOrder 'ahmed.ashraf'
EXEC productsInOrder 'ahmed.ashraf', 1
EXEC cancelOrder 1
EXEC returnProduct 1, 1
EXEC rate 1, 3, 'ahmed.ashraf'
EXEC SpecifyAmount 'ahmed.ashraf', 1, null, 100
EXEC SpecifyAmount 'ahmed.ashraf', 1, 95, null
EXEC AddCreditCard '4444-5555-6666-8888 ', '2028-10-19', 232, 'ahmed.ashraf'
EXEC ChooseCreditCard '4444-5555-6666-8888', 1
EXEC vewDeliveryTypes
EXEC specifydeliverytype 1, 1

DECLARE @days INTEGER
EXEC trackRemainingDays 1, 'ahmed.ashraf', @days OUTPUT
PRINT @days

EXEC recommend 'ahmed.ashraf'
EXEC postProduct 'eslam.mahmod', 'pencil', 'stationary', 'HB0.7', 10, 'red'
EXEC vendorviewProducts 'eslam.mahmod'
EXEC EditProduct 'eslam.mahmod', 4, null, null, null, null, 'blue'
EXEC deleteProduct 'eslam.mahmod', 4
EXEC viewQuestions 'hadeel.adel'
EXEC answerQuestions 'hadeel.adel', 1, 'ahmed.ashraf', '40'
EXEC addOffer 50, '11/10/2019'


DECLARE @active BIT
EXEC checkOfferonProduct 1, @active OUTPUT
PRINT @active

EXEC checkandremoveExpiredoffer 1
EXEC applyOffer 'hadeel.adel', 1, 1
EXEC activateVendors 'hana.aly', 'eslam.mahmod'
EXEC inviteDeliveryPerson 'mohamed.tamer', 'moha@gmail.com'
EXEC reviewOrders
EXEC updateOrderStatusInProcess 1
EXEC addDelivery 'pick-up', 7, 10, 'hana.aly'
EXEC assignOrdertoDelivery 'mohamed.tamer', 1, 'hana.aly'
EXEC createTodaysDeal 30, 'hana.aly', '11/30/2019'

DECLARE @active BIT
EXEC checkTodaysDealOnProduct 2, @active OUTPUT
PRINT @active

EXEC removeExpiredDeal 1
EXEC addTodaysDealOnProduct 1, 2

DECLARE @active BIT
EXEC checkGiftCardOnCustomer 'G101', @active OUTPUT
PRINT @active

EXEC giveGiftCardtoCustomer 'G102', 'ahmed.ashraf', 'hana.aly'
EXEC acceptAdminInvitation 'mohamed.tamer'
EXEC updateOrderStatusOutforDelivery 1
*/


/* drop all tables and procedures
EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"
*/

/* drop all procedures

DECLARE @DeleteProcCommand NVARCHAR(500)

DECLARE Syntax_Cursor CURSOR
FOR
SELECT 'DROP PROCEDURE ' + p.NAME
FROM sys.procedures p

OPEN Syntax_Cursor

FETCH NEXT FROM Syntax_Cursor

INTO @DeleteProcCommand

WHILE (@@FETCH_STATUS = 0)
BEGIN

EXEC (@DeleteProcCommand)

FETCH NEXT FROM Syntax_Cursor
INTO @DeleteProcCommand

END

CLOSE Syntax_Cursor

DEALLOCATE Syntax_Cursor
*/