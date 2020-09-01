DROP TABLE service CASCADE CONSTRAINTS;

DROP TABLE doctor CASCADE CONSTRAINTS;

DROP TABLE patient CASCADE CONSTRAINTS;

DROP TABLE assignment CASCADE CONSTRAINTS;

DROP TABLE clinic CASCADE CONSTRAINTS;

CREATE TABLE assignment (
    assignment_id                NUMBER(5, 0) NOT NULL,
    patient_service_start_date   DATE NOT NULL,
    patient_service_end_date     DATE NOT NULL,
    patient_id                   NUMBER(5, 0) NOT NULL,
    service_id                   NUMBER(5, 0) NOT NULL
);

COMMENT ON COLUMN assignment.assignment_id IS
    'ID of Assignment';

COMMENT ON COLUMN assignment.patient_service_start_date IS
    'Start date of service of Assignment';

COMMENT ON COLUMN assignment.patient_service_end_date IS
    'End date of service of Assignment';

COMMENT ON COLUMN assignment.patient_id IS
    'ID of patient in Assignment';

COMMENT ON COLUMN assignment.service_id IS
    'ID of service in Assignment';

ALTER TABLE assignment ADD CONSTRAINT assignment_pk PRIMARY KEY ( assignment_id );

CREATE TABLE service (
    service_id     NUMBER(5, 0) NOT NULL,
    service_name   VARCHAR2(50) NOT NULL,
    service_cost   NUMBER(10, 2) NOT NULL,
    staff_id       NUMBER(5, 0) NOT NULL,
    hospital_id    NUMBER(5, 0) NOT NULL
);

COMMENT ON COLUMN service.service_id IS
    'ID of Service';

COMMENT ON COLUMN service.service_name IS
    'Name of Service';

COMMENT ON COLUMN service.service_cost IS
    'Cost involved in Service';

COMMENT ON COLUMN service.staff_id IS
    'Staff Id on involved in Service';

COMMENT ON COLUMN service.hospital_id IS
    'Hospital ID involved in Service';

ALTER TABLE service ADD CONSTRAINT service_pk PRIMARY KEY ( service_id );

CREATE TABLE patient (
    patient_id                  NUMBER(5, 0) NOT NULL,
    patient_name                VARCHAR2(50) NOT NULL,
    patient_age                 NUMBER(5, 2) NOT NULL,
    patient_ph_no               NUMBER(10, 0) NOT NULL,
    patient_address             VARCHAR2(50) NOT NULL,
    patient_nationality         VARCHAR2(50) NOT NULL,
    patient_emergency_contact   NUMBER(10, 0) NOT NULL
);

COMMENT ON COLUMN patient.patient_id IS
    'ID of Patient';

COMMENT ON COLUMN patient.patient_name IS
    'Name of patient';

COMMENT ON COLUMN patient.patient_age IS
    'Age of patient';

COMMENT ON COLUMN patient.patient_ph_no IS
    'Phone number of patient';

COMMENT ON COLUMN patient.patient_address IS
    'Address of patient';

COMMENT ON COLUMN patient.patient_nationality IS
    'Nationality of patient';

COMMENT ON COLUMN patient.patient_emergency_contact IS
    'Emergency contact of patient';

ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( patient_id );

CREATE TABLE doctor (
    staff_id      NUMBER(5, 0) NOT NULL,
    staff_name    VARCHAR2(50) NOT NULL,
    staff_ph_no   NUMBER(10, 0) NOT NULL
);

COMMENT ON COLUMN doctor.staff_id IS
    'ID of Doctor';

COMMENT ON COLUMN doctor.staff_name IS
    'Name of Doctor';

COMMENT ON COLUMN doctor.staff_ph_no IS
    'Phone No of Doctor';

ALTER TABLE doctor ADD CONSTRAINT doctor_pk PRIMARY KEY ( staff_id );

CREATE TABLE clinic (
    hospital_id        NUMBER(5, 0) NOT NULL,
    hospital_name      VARCHAR2(50) NOT NULL,
    hospital_address   VARCHAR2(50) NOT NULL,
    suburb             VARCHAR2(20) NOT NULL,
    postcode           NUMBER(10, 0) NOT NULL
);

COMMENT ON COLUMN clinic.hospital_id IS
    'ID of Hospital';

COMMENT ON COLUMN clinic.hospital_name IS
    'Name of Hospital';

COMMENT ON COLUMN clinic.hospital_address IS
    'Address of Hospital';

COMMENT ON COLUMN clinic.suburb IS
    'Suburb of Hospital';

COMMENT ON COLUMN clinic.postcode IS
    'Postcode of Hospital';

ALTER TABLE clinic ADD CONSTRAINT clinic_pk PRIMARY KEY ( hospital_id );

ALTER TABLE assignment
    ADD CONSTRAINT assignment_service FOREIGN KEY ( service_id )
        REFERENCES service ( service_id );

ALTER TABLE assignment
    ADD CONSTRAINT assignment_patent FOREIGN KEY ( patient_id )
        REFERENCES patient ( patient_id );

ALTER TABLE service
    ADD CONSTRAINT service_clinic FOREIGN KEY ( hospital_id )
        REFERENCES clinic ( hospital_id );

ALTER TABLE service
    ADD CONSTRAINT service_doctor FOREIGN KEY ( staff_id )
        REFERENCES doctor ( staff_id );

DROP SEQUENCE patient_seq;

CREATE SEQUENCE patient_seq START WITH 100 INCREMENT BY 1;

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'John Smith',
    23,
    0403573363,
    '37 Snafu Drive',
    'Australian',
    0403573382
);

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Grace Ritchie',
    56,
    784452663,
    '42 Foobar Lane',
    'British',
    0403825682
);

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Ran J.',
    89,
    0487542363,
    '101 Omgbbq Street',
    'Australian',
    0403767656
);

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Dennis Doe',
    45,
    0403785463,
    '1100 Foobaz Avenue',
    'Australian',
    0409890862
);

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Dan Murphy',
    10,
    986715363,
    '4 Hollywood street',
    'American',
    0403578542
);

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'R.K Jain',
    15,
    965403363,
    '115 vivek vihar',
    'Indian',
    8767654534
);

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Michael Smith',
    0.4,
    0403573363,
    '54 Raful Street',
    'Australian',
    0405763382
);

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Jordon Son',
    90,
    0404073363,
    '8 Macky Drive',
    'Australian',
    0498451382
);

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Kate Wincet Smith',
    98,
    0407863363,
    '3 Burwood Drive',
    'Australian',
    0403876382
);

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Won Hu',
    0.7,
    8603573363,
    '7 Xi Street',
    'Chinese',
    8803573382
);

DROP SEQUENCE doctor_seq;

CREATE SEQUENCE doctor_seq START WITH 1 INCREMENT BY 1;

INSERT INTO doctor VALUES (
    doctor_seq.NEXTVAL,
    'Daniel Johnsmith',
    8608903363
);

INSERT INTO doctor VALUES (
    doctor_seq.NEXTVAL,
    'John Daniel',
    8604253361
);

INSERT INTO doctor VALUES (
    doctor_seq.NEXTVAL,
    'Mark Smith',
    98903387
);

INSERT INTO doctor VALUES (
    doctor_seq.NEXTVAL,
    'Lindsay Son',
    04890353
);

INSERT INTO doctor VALUES (
    doctor_seq.NEXTVAL,
    'Lui Chan',
    0456723145
);

INSERT INTO doctor VALUES (
    doctor_seq.NEXTVAL,
    'Pratik Kumar',
    0385972637
);

INSERT INTO doctor VALUES (
    doctor_seq.NEXTVAL,
    'Karan Kohli',
    0563728947
);

INSERT INTO doctor VALUES (
    doctor_seq.NEXTVAL,
    'Mike Jackson',
    0487265487
);

INSERT INTO doctor VALUES (
    doctor_seq.NEXTVAL,
    'Don Jon',
    0485760937
);

INSERT INTO doctor VALUES (
    doctor_seq.NEXTVAL,
    'Shacky Son',
    0456273451
);

DROP SEQUENCE clinic_seq;

CREATE SEQUENCE clinic_seq START WITH 50 INCREMENT BY 1;

INSERT INTO clinic VALUES (
    clinic_seq.NEXTVAL,
    'MAX Hospital',
    '5 Macky Street',
    'Richmond',
    3163
);

INSERT INTO clinic VALUES (
    clinic_seq.NEXTVAL,
    'Alfred Health',
    '1 Yarra Boulevard',
    'Kew',
    3101
);

INSERT INTO clinic VALUES (
    clinic_seq.NEXTVAL,
    'Caulfield Hospital',
    'Albert Street',
    'Upper Ferntree Gully',
    3156
);

INSERT INTO clinic VALUES (
    clinic_seq.NEXTVAL,
    'Sandringham Hospital',
    '51 Nelson Road',
    'Box Hill',
    3135
);

INSERT INTO clinic VALUES (
    clinic_seq.NEXTVAL,
    'Eastern Health',
    '55 Commercial Road',
    'Melbourne',
    3161
);

INSERT INTO clinic VALUES (
    clinic_seq.NEXTVAL,
    'Austin Health',
    '193 Bluff Road',
    'Sandringham',
    3191
);

INSERT INTO clinic VALUES (
    clinic_seq.NEXTVAL,
    'Angliss Hospital',
    '260 Kooyong Road',
    'Caulfield',
    3178
);

INSERT INTO clinic VALUES (
    clinic_seq.NEXTVAL,
    'Box Hill Hospital',
    '52 Kangan Drive',
    'Berwick',
    3806
);

INSERT INTO clinic VALUES (
    clinic_seq.NEXTVAL,
    'Maroondah Hospital',
    '400 Warrigal Rd',
    'Cheltenham',
    3092
);

INSERT INTO clinic VALUES (
    clinic_seq.NEXTVAL,
    'Wantirna Health',
    '865 Centre Road',
    'East Bentleigh	',
    3165
);

DROP SEQUENCE service_seq;

CREATE SEQUENCE service_seq START WITH 30 INCREMENT BY 1;

INSERT INTO service VALUES (
    service_seq.NEXTVAL,
    'general medical consultations',
    10.00,
    1,
    51
);

INSERT INTO service VALUES (
    service_seq.NEXTVAL,
    'wellness support',
    25.50,
    4,
    52
);

INSERT INTO service VALUES (
    service_seq.NEXTVAL,
    'sports medicine',
    50.00,
    5,
    57
);

INSERT INTO service VALUES (
    service_seq.NEXTVAL,
    'mental health',
    20.00,
    7,
    53
);

INSERT INTO service VALUES (
    service_seq.NEXTVAL,
    'sexual health',
    60.00,
    9,
    59
);

INSERT INTO service VALUES (
    service_seq.NEXTVAL,
    'skin diseases',
    19.00,
    2,
    54
);

INSERT INTO service VALUES (
    service_seq.NEXTVAL,
    'paediatric health',
    47.00,
    3,
    55
);

INSERT INTO service VALUES (
    service_seq.NEXTVAL,
    'womens health',
    40.00,
    3,
    56
);

INSERT INTO service VALUES (
    service_seq.NEXTVAL,
    'mens health',
    100.00,
    1,
    58
);

INSERT INTO service VALUES (
    service_seq.NEXTVAL,
    'weight loss help',
    35.50,
    4,
    52
);

INSERT INTO service VALUES (
    service_seq.NEXTVAL,
    'general medical consultations',
    75.50,
    6,
    53
);

DROP SEQUENCE assignment_seq;

CREATE SEQUENCE assignment_seq START WITH 70 INCREMENT BY 1;

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('05-Jan-2020', 'dd-mon-yyyy'),
    TO_DATE('15-Jan-2020', 'dd-mon-yyyy'),
    100,
    31
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('06-Feb-2020', 'dd-mon-yyyy'),
    TO_DATE('10-Feb-2020', 'dd-mon-yyyy'),
    106,
    33
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('25-Mar-2020', 'dd-mon-yyyy'),
    TO_DATE('02-Apr-2020', 'dd-mon-yyyy'),
    107,
    37
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('28-Apr-2020', 'dd-mon-yyyy'),
    TO_DATE('29-Mar-2020', 'dd-mon-yyyy'),
    103,
    35
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('01-May-2020', 'dd-mon-yyyy'),
    TO_DATE('06-May-2020', 'dd-mon-yyyy'),
    102,
    38
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('15-Dec-2019', 'dd-mon-yyyy'),
    TO_DATE('02-Jan-2020', 'dd-mon-yyyy'),
    107,
    34
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('11-Sep-2019', 'dd-mon-yyyy'),
    TO_DATE('19-Sep-2019', 'dd-mon-yyyy'),
    105,
    32
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('19-Feb-2020', 'dd-mon-yyyy'),
    TO_DATE('20-Feb-2020', 'dd-mon-yyyy'),
    100,
    33
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('20-Jan-2020', 'dd-mon-yyyy'),
    TO_DATE('20-Jan-2020', 'dd-mon-yyyy'),
    109,
    36
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('02-Mar-2020', 'dd-mon-yyyy'),
    TO_DATE('09-Mar-2020', 'dd-mon-yyyy'),
    101,
    39
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('02-Nov-2019', 'dd-mon-yyyy'),
    TO_DATE('10-Nov-2019', 'dd-mon-yyyy'),
    104,
    33
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('07-Mar-2020', 'dd-mon-yyyy'),
    TO_DATE('09-Mar-2020', 'dd-mon-yyyy'),
    108,
    35
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('27-Jun-2019', 'dd-mon-yyyy'),
    TO_DATE('01-Jul-2019', 'dd-mon-yyyy'),
    104,
    32
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('22-Jul-2019', 'dd-mon-yyyy'),
    TO_DATE('29-Jul-2019', 'dd-mon-yyyy'),
    109,
    37
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('17-Aug-2019', 'dd-mon-yyyy'),
    TO_DATE('19-Aug-2019', 'dd-mon-yyyy'),
    102,
    31
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('29-Oct-2019', 'dd-mon-yyyy'),
    TO_DATE('29-Oct-2019', 'dd-mon-yyyy'),
    103,
    38
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('31-Aug-2019', 'dd-mon-yyyy'),
    TO_DATE('31-Aug-2019', 'dd-mon-yyyy'),
    106,
    31
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('07-Jul-2019', 'dd-mon-yyyy'),
    TO_DATE('09-Jul-2019', 'dd-mon-yyyy'),
    109,
    33
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('06-Mar-2020', 'dd-mon-yyyy'),
    TO_DATE('09-Mar-2020', 'dd-mon-yyyy'),
    106,
    35
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('06-Apr-2020', 'dd-mon-yyyy'),
    TO_DATE('09-Apr-2020', 'dd-mon-yyyy'),
    106,
    35
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('26-Apr-2020', 'dd-mon-yyyy'),
    TO_DATE('29-Apr-2020', 'dd-mon-yyyy'),
    107,
    35
);

INSERT INTO assignment VALUES (
    assignment_seq.NEXTVAL,
    TO_DATE('21-Apr-2020', 'dd-mon-yyyy'),
    TO_DATE('29-Apr-2020', 'dd-mon-yyyy'),
    104,
    35
);
