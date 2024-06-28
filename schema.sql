CREATE DATABASE interact;

USE interact;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    DateRegistered DATE NOT NULL DEFAULT (CURRENT_DATE)
);

CREATE TABLE Activities (
    ActivityID INT AUTO_INCREMENT  PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Date DATE NOT NULL DEFAULT (CURRENT_DATE),
    Location VARCHAR(255),
    OrganizerID INT,
    FOREIGN KEY (OrganizerID) REFERENCES Users(UserID)
);

CREATE TABLE Registrations (
    RegistrationID INT AUTO_INCREMENT  PRIMARY KEY,
    UserID INT,
    ActivityID INT,
    DateRegistered DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID)
);

CREATE TABLE Comments (
    CommentID INT AUTO_INCREMENT PRIMARY KEY,
    ActivityID INT,
    UserID INT,
    CommentText TEXT,
    DateCommented DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Connections (
    ConnectionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID1 INT,
    UserID2 INT,
    Status VARCHAR(50), -- e.g., 'pending', 'accepted', 'rejected'
    DateConnected DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (UserID1) REFERENCES Users(UserID),
    FOREIGN KEY (UserID2) REFERENCES Users(UserID)
);

-- Create indexes to speed common searches
CREATE INDEX activities_date ON Activities (Date);
CREATE INDEX activities_location ON Activities (Location);

-- Create a view to control the activities
CREATE VIEW UserRegistrations AS
SELECT 
    r.RegistrationID, 
    u.UserID, 
    u.Name AS UserName, 
    u.Email AS UserEmail, 
    a.ActivityID, 
    a.Name AS ActivityName, 
    a.Date AS ActivityDate
FROM 
    Registrations r
JOIN 
    Users u ON r.UserID = u.UserID
JOIN 
    Activities a ON r.ActivityID = a.ActivityID;


