CREATE DATABASE flight_booking_system;
USE flight_booking_system;
CREATE TABLE initial_info_account (
    Username VARCHAR(20) PRIMARY KEY,
    Password VARCHAR(15)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE full_profile_account (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(20),
    Customer_State VARCHAR(15),
    Customer_Country VARCHAR(15),
    Customer_Pincode VARCHAR(10),
    Date_Of_Birth DATE,
    Customer_Gender VARCHAR(40),
    PhoneNumber VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE company (
    C_ID INT PRIMARY KEY,
    C_Name VARCHAR(25),
    C_Type VARCHAR(25)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE flights (
    F_ID INT PRIMARY KEY,
    F_Dept_Location VARCHAR(25) NOT NULL,
    F_Arr_Location VARCHAR(25) NOT NULL,
    F_Company VARCHAR(25) NOT NULL,
    F_Duration INT NOT NULL,
    F_Dept_Time DATETIME NOT NULL,
    F_Arr_Time DATETIME NOT NULL,
    F_Seats INT NOT NULL,
    C_ID INT,
    FOREIGN KEY (C_ID) REFERENCES company(C_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE cancellation (
    Canc_ID INT PRIMARY KEY,
    Canc_Payment_ID INT NOT NULL,
    Canc_Refund FLOAT NOT NULL,
    Canc_Date DATE NOT NULL,
    F_Company VARCHAR(25)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE payment (
    Payment_ID INT PRIMARY KEY,
    Payment_Customer_ID INT NOT NULL,
    Payment_Cost FLOAT NOT NULL,
    Payment_Tax FLOAT NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Type VARCHAR(15) NOT NULL,
    Payment_Card_No varchar(25),
    F_Company VARCHAR(25)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE customer (
    Cust_ID INT PRIMARY KEY AUTO_INCREMENT,
    Cust_Name VARCHAR(35) NOT NULL,
    Cust_Gender VARCHAR(35),
    Cust_DOB DATE NOT NULL,
    Cust_State VARCHAR(30) NOT NULL,
    Cust_Country VARCHAR(30) NOT NULL,
    Cust_Pincode VARCHAR(35),
    Cust_Login VARCHAR(25) NOT NULL,
    Cust_Password VARCHAR(28) NOT NULL,
    PhoneNumber VARCHAR(35)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
INSERT INTO initial_info_account (Username, Password) VALUES 
('user01', 'pass01'),
('user02', 'pass02'),
('user03', 'pass03'),
('user04', 'pass04'),
('user05', 'pass05');
select*from initial_info_account;
INSERT INTO full_profile_account (Customer_ID, Customer_Name, Customer_State, Customer_Country, Customer_Pincode, Date_Of_Birth, Customer_Gender, PhoneNumber) VALUES 
(5, 'David Johnson', 'Washington', 'USA', '98001', '1995-12-05', 'Male', '7654321001'),
(6, 'Sophia Martinez', 'New Jersey', 'USA', '07001', '2000-03-20', 'Female', '8765432102'),
(7, 'Michael Lee', 'Illinois', 'USA', '60601', '1991-07-08', 'Male', '9876543203'),
(8, 'Olivia Wilson', 'Arizona', 'USA', '85001', '1997-09-25', 'Female', '6543210004');
select*from full_profile_account;
INSERT INTO customer (Cust_Name, Cust_Gender, Cust_DOB, Cust_State, Cust_Country, Cust_Pincode, Cust_Login, Cust_Password, PhoneNumber) VALUES 
('David Johnson', 'Male', '1995-12-05', 'Washington', 'USA', '98001', 'user01', 'pass01', '7654321001'),
('Sophia Martinez', 'Female', '2000-03-20', 'New Jersey', 'USA', '07001', 'user02', 'pass02', '8765432102'),
('Michael Lee', 'Male', '1991-07-08', 'Illinois', 'USA', '60601', 'user03', 'pass03', '9876543203'),
('Olivia Wilson', 'Female', '1997-09-25', 'Arizona', 'USA', '85001', 'user04', 'pass04', '6543210004'),
('Daniel Carter', 'Male', '1988-06-10', 'Ohio', 'USA', '44101', 'user05', 'pass05', '5432100005');
select*from customer;
INSERT INTO company (C_ID, C_Name, C_Type) VALUES 
(1, 'American Airlines', 'International'),
(2, 'Delta Airlines', 'International'),
(3, 'United Airlines', 'Domestic'),
(4, 'Southwest Airlines', 'Domestic'),
(5, 'Emirates', 'International');
select*from company;
INSERT INTO flights (F_ID, F_Dept_Location, F_Arr_Location, F_Company, F_Duration, F_Dept_Time, F_Arr_Time, F_Seats, C_ID) VALUES 
(101, 'New York', 'Los Angeles', 'American Airlines', 6, '2025-04-10 08:00:00', '2025-04-10 14:00:00', 180, 1),
(102, 'Chicago', 'Miami', 'Delta Airlines', 3, '2025-04-11 10:30:00', '2025-04-11 13:30:00', 200, 2),
(103, 'Houston', 'San Francisco', 'United Airlines', 4, '2025-04-12 12:45:00', '2025-04-12 16:45:00', 150, 3),
(104, 'Dallas', 'Seattle', 'Southwest Airlines', 5, '2025-04-13 09:15:00', '2025-04-13 14:15:00', 170, 4),
(105, 'Dubai', 'London', 'Emirates', 7, '2025-04-14 18:00:00', '2025-04-15 01:00:00', 250, 5);
select*from flights;
INSERT INTO payment (Payment_ID, Payment_Customer_ID, Payment_Cost, Payment_Tax, Payment_Date, Payment_Type, Payment_Card_No, F_Company) VALUES 
(1001, 1, 500.00, 50.00, '2025-04-01', 'Credit Card', 1234567890, 'American Airlines'),
(1002, 2, 300.00, 30.00, '2025-04-02', 'Debit Card', 234567890, 'Delta Airlines'),
(1003, 3, 450.00, 45.00, '2025-04-03', 'PayPal', 34567890677661, 'United Airlines'),
(1004, 4, 700.00, 70.00, '2025-04-04', 'Credit Card', 45678901, 'Southwest Airlines'),
(1005, 5, 900.00, 90.00, '2025-04-05', 'Debit Card', 567890124, 'Emirates');
select*from payment;
INSERT INTO cancellation (Canc_ID, Canc_Payment_ID, Canc_Refund, Canc_Date, F_Company) VALUES 
(2001, 1003, 450.00, '2025-04-06', 'United Airlines'),
(2002, 1005, 900.00, '2025-04-07', 'Emirates');
select*from cancellation;
-- query 1 How can I view the complete list of registered customers
DELIMITER //
CREATE PROCEDURE ShowAllCustomers()
BEGIN
    SELECT * FROM customer;
END //
DELIMITER ;
call ShowAllCustomers();
-- query 2 How can I list all the available flights in the system
DELIMITER //
CREATE PROCEDURE ShowAllFlights()
BEGIN
    SELECT * FROM flights;
END //
DELIMITER ;
call ShowAllFlights();
-- query 3 How can I view all airline companies in the system
DELIMITER //
CREATE PROCEDURE ShowAllCompanies()
BEGIN
    SELECT * FROM company;
END //
DELIMITER ;
call ShowAllCompanies();
-- query 4 How can I see all the payment transactions
DELIMITER //
CREATE PROCEDURE ShowAllPayments()
BEGIN
    SELECT * FROM payment;
END //
DELIMITER ;
call ShowAllPayments()
-- query 5 How can I list all cancelled bookings
DELIMITER //
CREATE PROCEDURE ShowAllCancellations()
BEGIN
    SELECT * FROM cancellation;
END //
DELIMITER ;
call ShowAllCancellations
-- query 6 How can I list all flights operated by a specific airline company
DELIMITER //
CREATE PROCEDURE GetFlightsByCompany(IN compName VARCHAR(25))
BEGIN
    SELECT * FROM flights WHERE F_Company = compName;
END //
DELIMITER ;
call GetFlightsByCompany('American Airlines');
SELECT * FROM flights;
-- query 7 How can I fetch the full details of a customer using their login name
DELIMITER //
CREATE PROCEDURE GetCustomerByLogin(IN loginName VARCHAR(25))
BEGIN
    SELECT * FROM customer WHERE Cust_Login = loginName;
END //
DELIMITER ;
 SELECT * FROM customer;
call GetCustomerByLogin('user01');
-- query 8 How can I find all payment records for a specific customer
DELIMITER //
CREATE PROCEDURE GetPaymentsByCustomerID(IN custID INT)
BEGIN
    SELECT * FROM payment WHERE Payment_Customer_ID = custID;
END //
DELIMITER ;
 SELECT * FROM payment;
 call GetPaymentsByCustomerID(1);
-- query 9 How can I retrieve flight details between two specific cities
DELIMITER //
CREATE PROCEDURE GetFlightByRoute(IN dept VARCHAR(25), IN arr VARCHAR(25))
BEGIN
    SELECT * FROM flights 
    WHERE F_Dept_Location = dept AND F_Arr_Location = arr;
END //
DELIMITER ;
 SELECT * FROM flights;
 call GetFlightByRoute(Chicago, Miami);
-- query 10 How can I check if a payment was canceled using the payment ID
DELIMITER //
CREATE PROCEDURE CheckCancellationByPayment(IN payID INT)
BEGIN
    SELECT * FROM cancellation WHERE Canc_Payment_ID = payID;
END //
DELIMITER ;
SELECT * FROM cancellation;
call CheckCancellationByPayment(2003);
 