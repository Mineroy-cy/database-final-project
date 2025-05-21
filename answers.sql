CREAT DB CLINIC BOOKING SYSTEM;
  USE DB;
-- Drop existing tables if they exist
DROP TABLE IF EXISTS AppointmentServices;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Departments;

-- 1. Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Doctors Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- 3. Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- 4. Services Table
CREATE TABLE Services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    cost DECIMAL(10, 2) NOT NULL
);

-- 5. Appointments Table
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- 6. AppointmentServices Table (Many-to-Many relationship)
CREATE TABLE AppointmentServices (
    appointment_id INT NOT NULL,
    service_id INT NOT NULL,
    PRIMARY KEY (appointment_id, service_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);
-- Insert into Departments
INSERT INTO Departments (department_id, name) VALUES
(1, 'Cardiology'),
(2, 'Pediatrics'),
(3, 'Dermatology');

-- Insert into Doctors
INSERT INTO Doctors (doctor_id, first_name, last_name, email, department_id) VALUES
(1, 'Alice', 'Smith', 'alice.smith@clinic.com', 1),
(2, 'Bob', 'Johnson', 'bob.johnson@clinic.com', 2),
(3, 'Carol', 'Williams', 'carol.williams@clinic.com', 3);

-- Insert into Patients
INSERT INTO Patients (patient_id, first_name, last_name, dob, phone, email) VALUES
(1, 'John', 'Doe', '1985-07-12', '0712345678', 'john.doe@example.com'),
(2, 'Jane', 'Doe', '1990-02-23', '0723456789', 'jane.doe@example.com'),
(3, 'Mike', 'Brown', '1975-11-03', '0734567890', 'mike.brown@example.com');

-- Insert into Services
INSERT INTO Services (service_id, name, description, cost) VALUES
(1, 'General Checkup', 'Basic health examination', 50.00),
(2, 'ECG', 'Electrocardiogram test', 100.00),
(3, 'Skin Consultation', 'Dermatological diagnosis', 80.00);

-- Insert into Appointments
INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, 1, '2025-06-01 10:00:00', 'Scheduled'),
(2, 2, 2, '2025-06-01 11:30:00', 'Completed'),
(3, 3, 3, '2025-06-02 09:15:00', 'Scheduled');

-- Insert into AppointmentServices
INSERT INTO AppointmentServices (appointment_id, service_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3);
