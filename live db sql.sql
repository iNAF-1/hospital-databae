CREATE TABLE Patients (
   PatientID NUMBER(10) NOT NULL,
   FirstName varchar2(50),
   LastName varchar2(50),
   DateOfBirth DATE,
   Gender varchar2(10),
   PhoneNumber varchar2(15),
   Address varchar2(100),
   CONSTRAINT Patients_pk PRIMARY KEY (PatientID)

);
 
 
CREATE TABLE Doctors (
   DoctorID NUMBER(10)   NOT NULL,
   FirstName varchar2(50),
   LastName varchar2(50),
   Specialty varchar2(50),
   PhoneNumber varchar2(15),
   Email varchar2(100),
   Address varchar2(100),
    CONSTRAINT Doctors_pk PRIMARY KEY (DoctorID)
);
 
 
CREATE TABLE MedicalReports (
   ReportID NUMBER(10)   NOT NULL,
   PatientID NUMBER(10),
   DoctorID NUMBER(10),
   ReportDate DATE,
   Diagnosis varchar2(255),
   Prescription varchar2(255),

	CONSTRAINT MedicalReports_pk PRIMARY KEY (ReportID),
   CONSTRAINT Patient_MedicalReport_fk FOREIGN KEY(PatientID) REFERENCES Patients(PatientID),
   CONSTRAINT Doctor_MedicalReport_fk FOREIGN KEY(DoctorID) REFERENCES Doctors(DoctorID)
);
 
 
CREATE TABLE Department (
   DepartmentID NUMBER(10)   NOT NULL,
   DepartmentName varchar2(100),
   CONSTRAINT Department_pk PRIMARY KEY (DepartmentID)
);
 
 
CREATE TABLE PatientDepartments (
   PatientID NUMBER(10),
   DepartmentID NUMBER(10),
  
    CONSTRAINT PatientDepartments_pk PRIMARY KEY (PatientID,DepartmentID),
    CONSTRAINT Patient_PatientDepartments_fk FOREIGN KEY(PatientID) REFERENCES Patients(PatientID),
    CONSTRAINT Department_PatientDepartments_fk FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID)

);
 
 
CREATE TABLE MedicalCosts (
CostID NUMBER(10)   NOT NULL,
PatientID NUMBER(10),
Cost DECIMAL(10, 2),
Description varchar2(255),
DateIncurred DATE,
CONSTRAINT MedicalCosts_pk PRIMARY KEY (CostID),
CONSTRAINT Patient_MedicalCosts_fk FOREIGN KEY(PatientID) REFERENCES Patients(PatientID)

);
 
 
CREATE TABLE Appointments (
AppointmentID NUMBER(10)   NOT NULL,
PatientID NUMBER(10),
DoctorID NUMBER(10),
AppointmentDateTime date, -- Corrected data type
Reason varchar2(255),
CONSTRAINT Appointments_pk PRIMARY KEY (AppointmentID),
CONSTRAINT Patient_Appointments_fk FOREIGN KEY(PatientID) REFERENCES Patients(PatientID),
CONSTRAINT Department_Appointments_fk FOREIGN KEY(DoctorID) REFERENCES Doctors(DoctorID)


);

INSERT INTO Patients VALUES(1, 'John', 'Smith',TO_DATE('01/20/2006','mm/dd/yyyy') , 'Male', '123643890', 'KSA');
INSERT INTO Patients VALUES(2, 'Michael', 'Johnson', TO_DATE('07/07/2004','mm/dd/yyyy'), 'Male', '128664567890', 'KSA');
INSERT INTO Patients VALUES(3, 'David', 'Brown', TO_DATE('01/20/2006','mm/dd/yyyy'), 'Male', '1237657890', 'KSA');
INSERT INTO Patients VALUES(4, 'James', 'Wilson',TO_DATE('09/13/2005','mm/dd/yyyy') , 'Male', '9876543210', 'KSA');

INSERT INTO Doctors VALUES(1, 'Dr. William', 'Anderson', 'Cardiology', '5551234567', 'william.anderson@gmail.com', 'KSA');
INSERT INTO Doctors VALUES(2, 'Dr. Robert', 'Taylor', 'Neurology', '5559876543', 'robert.taylor@gmail.com', 'KSA');


INSERT INTO MedicalReports VALUES(1, 1, 1, TO_DATE('01/04/2024','mm/dd/yyyy') , 'Hypertension', 'Prescription details for hypertension');
INSERT INTO MedicalReports VALUES(2, 2, 2, TO_DATE('02/04/2024','mm/dd/yyyy') , 'Common cold', 'Prescription details for common cold');


INSERT INTO Department VALUES(1, 'Cardiology');
INSERT INTO Department VALUES(2, 'Neurology');


INSERT INTO PatientDepartments VALUES(1, 1);
INSERT INTO PatientDepartments VALUES(2, 2);

INSERT INTO MedicalCosts VALUES(1, 1, 150.00, 'Lab tests',TO_DATE('04/03/2024','mm/dd/yyyy') );
INSERT INTO MedicalCosts VALUES(2, 2, 75.50, 'Medication',TO_DATE('04/04/2006','mm/dd/yyyy') );


INSERT INTO Appointments VALUES(1, 1, 1,TO_TIMESTAMP('2024-04-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS') , 'Annual check up');
INSERT INTO Appointments VALUES(2, 2, 2, TO_TIMESTAMP('2024-04-06 15:30:00', 'YYYY-MM-DD HH24:MI:SS') , 'Annual check up');

SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM MedicalReports;
SELECT * FROM Department;
SELECT * FROM PatientDepartments;
SELECT * FROM MedicalCosts;
SELECT * FROM Appointments;
