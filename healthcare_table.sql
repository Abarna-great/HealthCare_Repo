-- database creation
create database healthcare;

-- Department Entity
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    location VARCHAR(100)
);

-- Doctor Entity
CREATE TABLE Doctor (
    doc_id INT PRIMARY KEY,
    doc_name VARCHAR(100),
    doc_phone VARCHAR(15),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Staff Entity
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(100),
    staff_role VARCHAR(50),
    staff_phone VARCHAR(15),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Patient Entity
CREATE TABLE Patient (
    pat_id INT PRIMARY KEY,
    pat_name VARCHAR(100),
    pat_age INT,
    pat_dob DATE,
    pat_phone VARCHAR(15),
    pat_address VARCHAR(255),
    pat_gender VARCHAR(10)
);

-- Room Entity
CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(50),  
    status VARCHAR(20)      
);

-- Admission Entity 
CREATE TABLE Admission (
    admission_id INT PRIMARY KEY,
    pat_id INT,
    room_id INT,
    admission_date DATE,
    discharge_date DATE,
    reason VARCHAR(255),
    FOREIGN KEY (pat_id) REFERENCES Patient(pat_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);


-- Appointment Entity 
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    pat_id INT,
    doc_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(50),
    FOREIGN KEY (pat_id) REFERENCES Patient(pat_id),
    FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id)
);


-- Prescription Entity 
CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY,
    appointment_id INT,
    medicine_name VARCHAR(100),
    dosage VARCHAR(50),
    instructions TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id)
);


-- Billing Entity 
CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    pat_id INT,
    amount DECIMAL(10,2),
    billing_date DATE,
    payment_status VARCHAR(50), 
    appointment_id INT,
    admission_id INT,
    FOREIGN KEY (pat_id) REFERENCES Patient(pat_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id),
    FOREIGN KEY (admission_id) REFERENCES Admission(admission_id)
);


select * from Department;
select * from Doctor; 
select * from Staff ;
select * from patient;
select * from Room;
select * from Admission;
select * from Appointment;
select * from Prescription;
select * from Billing;








