-- ============================================================
-- E-Consult Prototype Database — Core Queries
-- Covers all six required operations from the coursework spec
-- ============================================================

-- 1. Add a patient to the system
INSERT INTO Patient (patientID, firstName, lastName, dob, gender, age, surgeryID, docterID)
VALUES (10, 'Ahmed', 'Farah', '07-12-2004', 'Male', 18, 1, 1);

-- 2. Update a patient's details (e.g. their preferences / nearest surgery)
UPDATE Patient
SET surgeryID = 2, docterID = 4
WHERE patientID = 1;

-- 3. Delete a patient from the system
DELETE FROM Patient
WHERE patientID = 1;

-- 4. Add an appointment to the system
INSERT INTO Appointment (appointmentID, surgery, patientID, apDate, apTime, docterID, userID, priorityID, status)
VALUES (12, 'Darent Valley', 1, '2023-11-02', '11:57:00', 1, '0', '0', 'Active');

-- 5. View the status of a particular appointment
SELECT appointmentID, status
FROM Appointment
WHERE appointmentID = 6;

-- 6. View the full appointment history for a particular patient
--    (patient ID, surgery name and appointment time)
SELECT patientID, surgery, apTime
FROM Appointment
WHERE patientID = 7
ORDER BY apDate, apTime;
