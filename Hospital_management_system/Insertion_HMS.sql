USE hospital_management_system;
INSERT INTO Department (dept_name, location) VALUES
('Cardiology', 'Block A'),
('Neurology', 'Block B'),
('Orthopedics', 'Block C'),
('Pediatrics', 'Block D'),
('General Medicine', 'Block E'),
('Oncology', 'Block F');

INSERT INTO Doctor (doc_name, specialization, phone, email, dept_id) VALUES
('Dr. Meena', 'Cardiologist', '9876543210', 'meena@hospital.com', 1),
('Dr. Arjun', 'Cardiologist', '9876543211', 'arjun@hospital.com', 1),
('Dr. Rahul', 'Neurologist', '9876543212', 'rahul@hospital.com', 2),
('Dr. Kavya', 'Orthopedic', '9876543213', 'kavya@hospital.com', 3),
('Dr. Nisha', 'Orthopedic', '9876543214', 'nisha@hospital.com', 3),
('Dr. Sanjay', 'Pediatrician', '9876543215', 'sanjay@hospital.com', 4),
('Dr. Priya', 'General Physician', '9876543216', 'priya@hospital.com', 5),
('Dr. Kiran', 'Oncologist', '9876543217', 'kiran@hospital.com', 6),
('Dr. Ramesh', 'Neurologist', '9876543218', 'ramesh@hospital.com', 2),
('Dr. Anjali', 'Pediatrician', '9876543219', 'anjali@hospital.com', 4);



INSERT INTO Patient (pat_name, age, gender, phone, address) VALUES
('Ravi Kumar', 45, 'Male', '9000001001', 'Chennai'),
('Priya Sharma', 29, 'Female', '9000001002', 'Bangalore'),
('Arun Das', 52, 'Male', '9000001003', 'Hyderabad'),
('Meena Iyer', 34, 'Female', '9000001004', 'Coimbatore'),
('Suresh Nair', 41, 'Male', '9000001005', 'Kochi'),
('Anjali Gupta', 26, 'Female', '9000001006', 'Delhi'),
('Vikram Singh', 38, 'Male', '9000001007', 'Jaipur'),
('Kavya Menon', 31, 'Female', '9000001008', 'Mysore'),
('Rohit Verma', 47, 'Male', '9000001009', 'Pune'),
('Sneha Reddy', 28, 'Female', '9000001010', 'Hyderabad'),
('Manoj Pillai', 36, 'Male', '9000001011', 'Trivandrum'),
('Divya Patel', 30, 'Female', '9000001012', 'Ahmedabad'),
('Sameer Khan', 54, 'Male', '9000001013', 'Lucknow'),
('Nisha Das', 27, 'Female', '9000001014', 'Chandigarh'),
('Harish Choudhary', 42, 'Male', '9000001015', 'Bhopal');



INSERT INTO Staff (staff_name, role, phone, dept_id) VALUES
('Rekha', 'Nurse', '9111111111', 1),
('Mohan', 'Technician', '9222222222', 2),
('Asha', 'Receptionist', '9333333333', 5),
('Deepak', 'Admin', '9444444444', 3),
('Leela', 'Nurse', '9555555555', 4),
('Vijay', 'Technician', '9666666666', 6),
('Suresh', 'Receptionist', '9777777777', 1),
('Radha', 'Nurse', '9888888888', 2),
('Anand', 'Admin', '9999999999', 5);

INSERT INTO Admission (pat_id, dept_id, admission_date, discharge_date, room_no) VALUES
(1, 1, '2025-08-01', '2025-08-10', 'A101'),
(2, 2, '2025-08-05', NULL, 'B202'),
(3, 3, '2025-08-10', '2025-08-15', 'C303'),
(4, 4, '2025-08-12', NULL, 'D404'),
(5, 1, '2025-08-13', NULL, 'A102'),
(6, 5, '2025-08-14', NULL, 'E505'),
(7, 6, '2025-08-15', NULL, 'F606'),
(8, 3, '2025-08-16', '2025-08-20', 'C304'),
(9, 2, '2025-08-18', NULL, 'B203');



INSERT INTO Appointment (pat_id, doc_id, appointment_date, status) VALUES
(1, 1, '2025-08-25', 'Scheduled'),
(2, 3, '2025-08-25', 'Completed'),
(3, 4, '2025-08-26', 'Scheduled'),
(4, 6, '2025-08-26', 'Scheduled'),
(5, 2, '2025-08-27', 'Cancelled'),
(6, 7, '2025-08-27', 'Completed'),
(1, 6, '2025-08-28', 'Scheduled'),
(6, 5, '2025-08-29', 'Scheduled'),
(7, 1, '2025-08-30', 'Scheduled');





