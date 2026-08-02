-- ============================================================
-- E-Consult Prototype Database
-- COMP1821 Principles of Software Engineering, University of Greenwich
-- Schema built in MS Access, reconstructed here as standard SQL
-- ============================================================

CREATE TABLE Location (
    locationID   VARCHAR(10)  PRIMARY KEY,
    surgeryName  VARCHAR(255) NOT NULL,
    address      VARCHAR(255)
);

CREATE TABLE Surgery (
    surgeryID    INT          PRIMARY KEY,
    locationID   VARCHAR(10)  REFERENCES Location(locationID),
    docterID     INT
);

CREATE TABLE User (
    userID       VARCHAR(10)  PRIMARY KEY,
    userName     VARCHAR(255) NOT NULL,
    password     VARCHAR(255) NOT NULL,
    email        VARCHAR(255),
    role         VARCHAR(50)
);

CREATE TABLE Docter (
    docterID     INT          PRIMARY KEY,
    firstName    VARCHAR(255) NOT NULL,
    lastName     VARCHAR(255) NOT NULL,
    surgeryID    INT          REFERENCES Surgery(surgeryID),
    userID       VARCHAR(10)  REFERENCES User(userID)
);

CREATE TABLE Priority (
    priorityID     VARCHAR(10) PRIMARY KEY,
    priorityReason VARCHAR(255),
    priorityLevel  VARCHAR(10)
);

CREATE TABLE Patient (
    patientID    INT          PRIMARY KEY,
    firstName    VARCHAR(255) NOT NULL,
    lastName     VARCHAR(255) NOT NULL,
    dob          VARCHAR(20),
    gender       VARCHAR(20),
    age          INT,
    surgeryID    INT          REFERENCES Surgery(surgeryID),
    docterID     INT          REFERENCES Docter(docterID)
);

CREATE TABLE Appointment (
    appointmentID INT          PRIMARY KEY,
    surgery       VARCHAR(255),
    patientID     INT          REFERENCES Patient(patientID),
    apDate        DATE,
    apTime        TIME,
    docterID      INT          REFERENCES Docter(docterID),
    userID        VARCHAR(10)  REFERENCES User(userID),
    priorityID    VARCHAR(10)  REFERENCES Priority(priorityID),
    status        VARCHAR(20)
);

CREATE TABLE Training (
    trainingID   INT          PRIMARY KEY,
    userID       VARCHAR(10)  REFERENCES User(userID),
    userName     VARCHAR(255),
    password     VARCHAR(255)
);
