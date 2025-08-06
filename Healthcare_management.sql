-- database creation
create database healthcare_management;
use healthcare_management;

-- creation table
-- Department Table
CREATE TABLE Department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL
);

-- Insert Departments
INSERT INTO Department (dept_name, location) VALUES
('Cardiology', 'Building A - Floor 2'),
('Neurology', 'Building B - Floor 3'),
('Pediatrics', 'Building C - Floor 1'),
('Radiology', 'Building D - Floor 2');
CREATE TABLE Doctor (
    doc_id INT AUTO_INCREMENT PRIMARY KEY,
    doc_name VARCHAR(100) NOT NULL,
    doc_phone VARCHAR(15) UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
        ON DELETE SET NULL
);

-- Insert Doctors
INSERT INTO Doctor (doc_name, doc_phone, dept_id) VALUES
('Dr. Maidhili', '9876543210', 1),
('Dr. Raj', '9123456789', 2),
('Dr. Meghna', '9988776655', 3);
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_name VARCHAR(100) NOT NULL,
    staff_role VARCHAR(50) CHECK (staff_role IN 
        ('Doctor', 'Nurse', 'Pharmacist', 'Cleaner', 'Therapist', 'Security', 'Receptionist', 'Radiology Technician', 'Surgeon', 'Lab Technician')),
    staff_phone VARCHAR(15) UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
        ON DELETE SET NULL
);

-- Insert Staff
INSERT INTO Staff (staff_name, staff_role, staff_phone, dept_id) VALUES
('Kevin', 'Nurse', '9876501234', 1),
('Gita', 'Lab Technician', '9765432109', 2),
('Govind', 'Pharmacist', '9678901234', 3),
('Suresh', 'Cleaner', '9456123789', 4);
CREATE TABLE Patient (
    pat_id INT AUTO_INCREMENT PRIMARY KEY,
    pat_name VARCHAR(100) NOT NULL,
    pat_age INT CHECK (pat_age > 0),
    pat_dob DATE,
    pat_phone VARCHAR(15) UNIQUE,
    pat_address VARCHAR(255),
    pat_gender VARCHAR(10) CHECK (pat_gender IN ('Male', 'Female', 'Other'))
);

-- Insert Patients
INSERT INTO Patient (pat_name, pat_age, pat_dob, pat_phone, pat_address, pat_gender) VALUES
('Abarna', 24, '2001-05-10', '9000000001', '123, Chennai', 'Female'),
('Karthik', 30, '1995-12-20', '9000000002', '456, Madurai', 'Male'),
('Meena', 28, '1997-03-15', '9000000003', '789, Coimbatore', 'Female'),
('Arjun', 35, '1990-08-01', '9000000004', '22, Trichy', 'Male');
CREATE TABLE Admission (
    admission_id INT AUTO_INCREMENT PRIMARY KEY,
    pat_id INT,
    admission_date DATE NOT NULL,
    discharge_date DATE DEFAULT NULL,
    reason VARCHAR(255) NOT NULL,
    FOREIGN KEY (pat_id) REFERENCES Patient(pat_id)
        ON DELETE CASCADE
);

-- Insert Admissions
INSERT INTO Admission (pat_id, admission_date, discharge_date, reason) VALUES
(1, '2025-07-01', '2025-07-05', 'High Fever'),
(2, '2025-07-10', '2025-07-15', 'Fracture'),
(3, '2025-07-20', NULL, 'Observation');
CREATE TABLE Appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    pat_id INT,
    doc_id INT,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status VARCHAR(50) CHECK (status IN ('Scheduled', 'Completed', 'Cancelled')),
    FOREIGN KEY (pat_id) REFERENCES Patient(pat_id)
        ON DELETE CASCADE,
    FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id)
        ON DELETE SET NULL
);

-- Insert Appointments
INSERT INTO Appointment (pat_id, doc_id, appointment_date, appointment_time, status) VALUES
(1, 1, '2025-07-10', '10:00:00', 'Completed'),
(2, 2, '2025-07-11', '11:30:00', 'Scheduled'),
(3, 3, '2025-07-12', '09:15:00', 'Cancelled');


SELECT * FROM Department;
SELECT * FROM Doctor;
SELECT * FROM Staff;
SELECT * FROM Patient;
SELECT * FROM Admission;
SELECT * FROM Appointment;



-- updation 

-- Update patient's phone number
UPDATE Patient SET pat_phone = '+91-9000000001' WHERE pat_id = 301;

-- Update doctor department
UPDATE Doctor SET dept_id = 3 WHERE doc_id = 101;

-- Update admission discharge date
UPDATE Admission SET discharge_date = '2025-07-06' WHERE admission_id = 401;

-- Update appointment status
UPDATE Appointment SET status = 'Cancelled' WHERE appointment_id = 502;


UPDATE Appointment
SET status = 'Cancelled'
WHERE appointment_id IN (503, 504, 505);



-- deletion

DELETE FROM Patient WHERE pat_id = 301;

DELETE FROM Doctor WHERE doc_id = 103;

DELETE FROM Department WHERE dept_id = 5;

DELETE FROM Appointment WHERE appointment_id = 504;

DELETE FROM Staff WHERE staff_id = 202;


DELETE FROM Staff
WHERE staff_id IN (205, 206, 207);





