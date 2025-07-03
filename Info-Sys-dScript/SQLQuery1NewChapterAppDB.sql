-- Create the database
CREATE DATABASE NewChapterAppDB;
GO

-- Use the database
USE NewChapterAppDB;
GO

-- Create tbRole table
CREATE TABLE tbRole (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL,
    RoleCode INT NOT NULL UNIQUE,
    Description VARCHAR(255) NULL
);

-- Insert default roles
INSERT INTO tbRole (RoleID, RoleName, RoleCode, Description)
VALUES 
    (1, 'Student', 0734, 'Regular student users'),
    (2, 'Admin', 9734, 'Administrative users with full access');

-- Create tbUsers table
CREATE TABLE tbUsers (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    RoleID INT NOT NULL,
    IsActive BIT DEFAULT 1,
    DateCreated DATETIME DEFAULT GETDATE(),
    LastLogin DATETIME NULL,
    FOREIGN KEY (RoleID) REFERENCES tbRole(RoleID)
);

-- Create tbStudents table
CREATE TABLE tbStudents (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL UNIQUE,
    IDNumber VARCHAR(20) NULL,
    DateOfBirth DATE NULL,
    Gender VARCHAR(10) NULL,
    PhoneNumber VARCHAR(20) NULL,
    Address VARCHAR(255) NULL,
    City VARCHAR(50) NULL,
    Province VARCHAR(50) NULL,
    PostalCode VARCHAR(10) NULL,
    ProfileImage VARCHAR(255) NULL,
    CurrentSchool VARCHAR(100) NULL,
    YearOfStudy VARCHAR(20) NULL,
    Bio TEXT NULL,
    DateUpdated DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES tbUsers(UserID)
);

-- Create tbAdmin table
CREATE TABLE tbAdmin (
    AdminID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL UNIQUE,
    IDNumber VARCHAR(20) NULL,
    PhoneNumber VARCHAR(20) NULL,
    Department VARCHAR(50) NULL,
    Position VARCHAR(50) NULL,
    ProfileImage VARCHAR(255) NULL,
    Bio TEXT NULL,
    DateUpdated DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES tbUsers(UserID)
);

-- Create tbUniversities table
CREATE TABLE tbUniversities (
    UniversityID INT IDENTITY(1,1) PRIMARY KEY,
    UniversityName VARCHAR(100) NOT NULL UNIQUE,
    UniversityAbbreviation VARCHAR(20) NULL,
    DateAdded DATETIME DEFAULT GETDATE()
);

-- Insert South African universities
INSERT INTO tbUniversities (UniversityName, UniversityAbbreviation)
VALUES
    ('University of Cape Town', 'UCT'),
    ('University of the Witwatersrand', 'Wits'),
    ('Stellenbosch University', 'Maties'),
    ('University of Pretoria', 'Tuks'),
    ('University of Johannesburg', 'UJ'),
    ('University of KwaZulu-Natal', 'UKZN'),
    ('North-West University', 'NWU'),
    ('University of the Western Cape', 'UWC'),
    ('Rhodes University', 'Rhodes'),
    ('University of the Free State', 'UFS'),
    ('Nelson Mandela University', 'NMU'),
    ('University of Limpopo', 'UL'),
    ('University of Venda', 'Univen'),
    ('University of Zululand', 'UniZulu'),
    ('Walter Sisulu University', 'WSU'),
    ('University of Fort Hare', 'UFH'),
    ('Tshwane University of Technology', 'TUT'),
    ('Cape Peninsula University of Technology', 'CPUT'),
    ('Durban University of Technology', 'DUT'),
    ('Mangosuthu University of Technology', 'MUT'),
    ('Vaal University of Technology', 'VUT'),
    ('Central University of Technology', 'CUT'),
    ('University of Mpumalanga', 'UMP'),
    ('Sol Plaatje University', 'SPU'),
    ('Sefako Makgatho Health Sciences University', 'SMU'),
    ('South African Military Health Service', 'SAMHS');

-- Create tbApplication table
CREATE TABLE tbApplication (
    ApplicationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    UniversityID INT NOT NULL,
    ApplicationDate DATETIME DEFAULT GETDATE(),
    ApplicationStatus VARCHAR(50) DEFAULT 'Pending',
    ProgramName VARCHAR(100) NOT NULL,
    ApplicationYear INT NOT NULL,
    DocumentsSubmitted BIT DEFAULT 0,
    Notes TEXT NULL,
    LastUpdated DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES tbUsers(UserID),
    FOREIGN KEY (UniversityID) REFERENCES tbUniversities(UniversityID)
);

-- Create tbNotifications table
CREATE TABLE tbNotifications (
    NotificationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    Title VARCHAR(100) NOT NULL,
    Message TEXT NOT NULL,
    NotificationType VARCHAR(50) NOT NULL,
    IsRead BIT DEFAULT 0,
    DateCreated DATETIME DEFAULT GETDATE(),
    ExpiryDate DATETIME NULL,
    FOREIGN KEY (UserID) REFERENCES tbUsers(UserID)
);