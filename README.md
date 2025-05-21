

**Project Title:**
Clinic Booking System (MySQL Project)

**Project Description:**
The Clinic Booking System is a relational database project built using MySQL. It is designed to simulate the operations of a healthcare clinic by managing key entities such as patients, doctors, departments, services, and appointments.

This system ensures data consistency and integrity through the use of well-defined primary and foreign key constraints. Each table is related to others in a meaningful way. For example, appointments are linked to both patients and doctors, and each doctor is associated with a specific department.

The project is suitable for learning or demonstrating key database concepts such as data modeling, normalization, and relational integrity. It is ideal for academic settings where students are expected to understand and work with normalized database schemas and perform queries that involve multiple tables.

**Setup and Usage Instructions:**

**1. Requirements:**
To run this project, you will need:

* MySQL Server (version 5.7 or later is recommended)
* MySQL Workbench or another MySQL client application such as phpMyAdmin or DBeaver

**2. Creating the Database:**
Begin by creating a new database schema. You can do this by executing the following SQL command in your MySQL client:

```sql
CREATE DATABASE clinic_booking;
USE clinic_booking;
```

Alternatively, if your SQL file already contains the `CREATE DATABASE` and `USE` statements, simply run the file directly.

**3. Importing the Database Structure:**
Open the file named `clinic_booking_system.sql` in your MySQL client and execute the entire script. This file will:

* Create all required tables
* Define primary and foreign key constraints
* Establish relationships between entities such as patients, doctors, departments, appointments, and services

**4. Populating Sample Data (Optional):**
If you have a separate file named `clinic_sample_data.sql`, you may execute this after setting up the tables. It will insert example records into the database, allowing you to test queries and explore the relationships between tables.

**5. Running Queries:**
After importing the structure and optional data, you may begin writing and executing queries to retrieve information. For instance, to view all scheduled appointments along with the related patient, doctor, and service details, you could use a SQL statement like the following:

```sql
SELECT p.name AS patient_name, d.name AS doctor_name, s.service_name, a.date
FROM appointments a
JOIN patients p ON a.patient_id = p.id
JOIN doctors d ON a.doctor_id = d.id
JOIN services s ON a.service_id = s.id;
```

**6. Notes:**

* If you encounter issues related to foreign keys during data insertion, ensure that foreign key checks are enabled with:
  `SET FOREIGN_KEY_CHECKS = 1;`

* When testing the schema multiple times, consider adding `DROP TABLE IF EXISTS` before each `CREATE TABLE` statement in your SQL file to prevent duplicate errors.

**Included Files:**

* `clinic_booking_system.sql` – Contains the SQL statements to create the database tables and constraints
* `clinic_sample_data.sql` – Contains optional insert statements for sample data
* `README.txt` – This documentation
* ![clinic_booking_erd](https://github.com/user-attachments/assets/ace00c06-fa4b-4617-b25f-8ec8913d4461)
