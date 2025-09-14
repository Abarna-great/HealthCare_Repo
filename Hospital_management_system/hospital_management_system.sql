Create database Hospital_management_system;
USE hospital_management_system;

-- 1. Department Table
CREATE TABLE Department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100)
);

-- 2. Doctor Table
CREATE TABLE Doctor (
    doc_id INT AUTO_INCREMENT PRIMARY KEY,
    doc_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- 3. Patient Table
CREATE TABLE Patient (
    pat_id INT AUTO_INCREMENT PRIMARY KEY,
    pat_name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0),
    gender ENUM('Male','Female','Other'),
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(200),
    blood_group VARCHAR(10)
);

-- 4. Staff Table
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_name VARCHAR(100) NOT NULL,
    role ENUM('Nurse','Receptionist','Technician','Admin','Other'),
    phone VARCHAR(15) UNIQUE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- 5. Admission Table
CREATE TABLE Admission (
    admission_id INT AUTO_INCREMENT PRIMARY KEY,
    pat_id INT,
    dept_id INT,
    admission_date DATE NOT NULL,
    discharge_date DATE DEFAULT NULL,
    room_no VARCHAR(10),
    FOREIGN KEY (pat_id) REFERENCES Patient(pat_id),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- 6. Appointment Table
CREATE TABLE Appointment (
    app_id INT AUTO_INCREMENT PRIMARY KEY,
    pat_id INT,
    doc_id INT,
    appointment_date DATE NOT NULL,
    status ENUM('Scheduled','Completed','Cancelled') ,
    FOREIGN KEY (pat_id) REFERENCES Patient(pat_id),
    FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id)
);






-- SELECT 

select * from patient;
select * from staff;
select * from admission;
select * from doctor;
select * from appointment;
select * from department;

alter table appointment
alter column status set default 'scheduled';
alter table appointment
alter column status drop default;


alter table patient 
drop column blood_group;


