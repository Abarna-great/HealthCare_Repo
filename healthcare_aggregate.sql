use healthcare_management;

show tables from healthcare_management;

select * from admission;
select * from appointment;
select * from department;
select * from doctor;
select * from patient;
select * from staff;

select count(pat_id) from patient;

select count(doc_id) from doctor;

SELECT dept_id, COUNT(staff_id) AS staff_count
FROM Staff
GROUP BY dept_id;

select sum(pat_age) as Age from patient ;

SELECT 
    YEAR(admission_date) AS admission_year,
    MONTH(admission_date) AS admission_month,
    COUNT(pat_id) AS total_patients
FROM Admission
GROUP BY YEAR(admission_date), MONTH(admission_date)
ORDER BY admission_year, admission_month;


select avg(pat_age) from patient;

select avg(pat_age),pat_gender from patient group by pat_gender;

select * from admission;

select * from patient;

select avg(a.pat_age) as age,d.reason from patient a join admission d ON a.pat_id=d.pat_id group by 
reason;

select * from staff;

select count(staff_id) from staff group by staff_role;

select * from department;
select * from doctor;

SELECT dept_id, COUNT(doc_id) AS doctor_count
FROM Doctor
GROUP BY dept_id
HAVING COUNT(doc_id) > 1;


