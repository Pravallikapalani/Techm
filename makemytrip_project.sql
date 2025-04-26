
-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS MakeMyTripDB;
USE MakeMyTripDB;

-- Step 2: Create Users Table
CREATE TABLE IF NOT EXISTS Users (
    UserId INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Create Flights Table
CREATE TABLE IF NOT EXISTS Flights (
    FlightId INT AUTO_INCREMENT PRIMARY KEY,
    Airline VARCHAR(50) NOT NULL,
    FlightNumber VARCHAR(20) NOT NULL,
    Origin VARCHAR(50) NOT NULL,
    Destination VARCHAR(50) NOT NULL,
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    SeatsAvailable INT NOT NULL
);

-- Step 4: Create Hotels Table
CREATE TABLE IF NOT EXISTS Hotels (
    HotelId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Address VARCHAR(255),
    PricePerNight DECIMAL(10,2) NOT NULL,
    RoomsAvailable INT NOT NULL,
    Rating FLOAT
);

-- Step 5: Create Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingId INT AUTO_INCREMENT PRIMARY KEY,
    UserId INT NOT NULL,
    BookingType ENUM('Flight', 'Hotel') NOT NULL,
    ReferenceId INT NOT NULL,
    BookingDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    CheckInDate DATETIME NULL,
    CheckOutDate DATETIME NULL,
    Status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

-- Step 6: Create Payments Table
CREATE TABLE IF NOT EXISTS Payments (
    PaymentId INT AUTO_INCREMENT PRIMARY KEY,
    BookingId INT NOT NULL,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentStatus ENUM('Success', 'Failed', 'Pending') DEFAULT 'Pending',
    FOREIGN KEY (BookingId) REFERENCES Bookings(BookingId)
);
CREATE TABLE Packages (
    PackageId INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    Destination VARCHAR(100) NOT NULL,
    DurationDays INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    ImageUrl VARCHAR(255),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

--  Data Insertions

-- Users
INSERT INTO Users (FullName, Email, PasswordHash, Phone)
VALUES 
('Alice Smith', 'alice@example.com', 'hashedpassword1', '9876543210'),
('Bob Johnson', 'bob@example.com', 'hashedpassword2', '9123456780');

-- Flights
INSERT INTO Flights (Airline, FlightNumber, Origin, Destination, DepartureTime, ArrivalTime, Price, SeatsAvailable)
VALUES 
('IndiGo', '6E101', 'Delhi', 'Mumbai', '2025-05-01 08:00:00', '2025-05-01 10:00:00', 4500.00, 60),
('Air India', 'AI202', 'Mumbai', 'Chennai', '2025-05-02 09:30:00', '2025-05-02 11:45:00', 5500.00, 50);

-- Hotels
INSERT INTO Hotels (Name, City, Address, PricePerNight, RoomsAvailable, Rating)
VALUES 
('Taj Palace', 'Delhi', '1 Taj Road, Delhi', 9500.00, 25, 4.8),
('Oberoi Grand', 'Kolkata', '15 Jawaharlal Nehru Road', 7200.00, 15, 4.6);

-- Bookings
INSERT INTO Bookings (UserId, BookingType, ReferenceId)
VALUES 
(1, 'Flight', 1),
(2, 'Hotel', 2, '2025-06-01', '2025-06-03');

-- Payments
INSERT INTO Payments (BookingId, Amount, PaymentStatus)
VALUES 
(1, 4500.00, 'Success'),
(2, 14400.00, 'Success');

-- Packages (Title, Description, Destination, DurationDays, Price, ImageUrl)
VALUES
('Goa Getaway', '3 nights in Goa with beach resort stay and breakfast included.', 'Goa', 3, 8999.99, 'https://example.com/images/goa.jpg'),
('Manali Adventure', '5-day trip including local tours and mountain camping.', 'Manali', 5, 12999.50, 'https://example.com/images/manali.jpg'),
('Kerala Backwaters', 'Houseboat experience in Alleppey with all meals.', 'Kerala', 4, 11999.00, 'https://example.com/images/kerala.jpg');


