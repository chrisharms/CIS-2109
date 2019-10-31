-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2019-10-30 17:34:57 EDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE bed (
    bedid              INTEGER NOT NULL,
    roomnumber         INTEGER,
    carecenterid       INTEGER,
    patient_personid   INTEGER NOT NULL
);

CREATE UNIQUE INDEX bed__idx ON
    bed (
        patient_personid
    ASC );

ALTER TABLE bed ADD CONSTRAINT bed_pk PRIMARY KEY ( bedid );

CREATE TABLE diagnosis (
    diagnosisid            INTEGER NOT NULL,
    diagnosisname          VARCHAR(30)
    ,
    diagnosisdatetime      DATE,
    diagnosiscode          INTEGER,
    diagnosisdescription   VARCHAR2(50) 
    ,
    physician_personid     INTEGER NOT NULL
);

ALTER TABLE diagnosis ADD CONSTRAINT diagnosis_pk PRIMARY KEY ( diagnosisid );

CREATE TABLE employee (
    personid    INTEGER NOT NULL,
    datehired   DATE,
    specialty   VARCHAR2(15) 
);

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( personid );

CREATE TABLE "Order" (
    orderid                 INTEGER NOT NULL,
    orderdate               DATE,
    ordertime               TIMESTAMP,
    treatment_treatmentid   INTEGER NOT NULL,
    physician_personid      INTEGER NOT NULL,
    patient_personid        INTEGER NOT NULL
);

ALTER TABLE "Order" ADD CONSTRAINT order_pk PRIMARY KEY ( orderid );

CREATE TABLE patient (
    personid                INTEGER NOT NULL,
    contactdate             DATE,
    physician_personid      INTEGER NOT NULL,
    diagnosis_diagnosisid   INTEGER NOT NULL,
    bed_bedid               INTEGER NOT NULL
);

CREATE UNIQUE INDEX patient__idx ON
    patient (
        bed_bedid
    ASC );

ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( personid );

CREATE TABLE patient_info (
    patientweight          INTEGER,
    patientbloodpressure   INTEGER,
    patientpulse           INTEGER,
    patienttemperature     INTEGER,
    datetime               DATE,
    visitreason            VARCHAR2(50) 
    ,
    symptoms               VARCHAR2(50) 
    ,
    patient_personid       INTEGER NOT NULL,
    employee_personid      INTEGER NOT NULL
);

ALTER TABLE patient_info ADD CONSTRAINT patient_info_pk PRIMARY KEY ( patient_personid,
                                                                      employee_personid );

CREATE TABLE person (
    personid        INTEGER NOT NULL,
    personname      VARCHAR2(20) 
    ,
    personaddress   VARCHAR2(20) 
    ,
    personcity      VARCHAR2(20) 
    ,
    personstate     CHAR(2) 
    ,
    personzip       INTEGER,
    persondob       DATE,
    personphone     INTEGER,
    personemail     VARCHAR2(20) 
    ,
    persontype      CHAR(9) NOT NULL
);

ALTER TABLE person
    ADD CONSTRAINT ch_inh_person CHECK ( persontype IN (
        'Employee',
        'Patient',
        'Person',
        'Physician',
        'Volunteer'
    ) );

ALTER TABLE person ADD CONSTRAINT person_pk PRIMARY KEY ( personid );

CREATE TABLE physician (
    personid      INTEGER NOT NULL,
    pagernumber   INTEGER,
    deanumber     INTEGER,
    specialty     VARCHAR2(20) 
);

ALTER TABLE physician ADD CONSTRAINT physician_pk PRIMARY KEY ( personid );

CREATE TABLE treatment (
    treatmentid        INTEGER NOT NULL,
    treatmentname      VARCHAR2(20) 
    ,
    treatmentdate      DATE,
    treatmenttime      DATE,
    treatmentresults   VARCHAR2(50) 
);

ALTER TABLE treatment ADD CONSTRAINT treatment_pk PRIMARY KEY ( treatmentid );

CREATE TABLE volunteer (
    personid    INTEGER NOT NULL,
    skills      VARCHAR2(30) 
    ,
    interests   VARCHAR2(30) 
);

ALTER TABLE volunteer ADD CONSTRAINT volunteer_pk PRIMARY KEY ( personid );

ALTER TABLE bed
    ADD CONSTRAINT bed_patient_fk FOREIGN KEY ( patient_personid )
        REFERENCES patient ( personid );

ALTER TABLE diagnosis
    ADD CONSTRAINT diagnosis_physician_fk FOREIGN KEY ( physician_personid )
        REFERENCES physician ( personid );

ALTER TABLE employee
    ADD CONSTRAINT employee_person_fk FOREIGN KEY ( personid )
        REFERENCES person ( personid );

ALTER TABLE "Order"
    ADD CONSTRAINT order_patient_fk FOREIGN KEY ( patient_personid )
        REFERENCES patient ( personid );

ALTER TABLE "Order"
    ADD CONSTRAINT order_physician_fk FOREIGN KEY ( physician_personid )
        REFERENCES physician ( personid );

ALTER TABLE "Order"
    ADD CONSTRAINT order_treatment_fk FOREIGN KEY ( treatment_treatmentid )
        REFERENCES treatment ( treatmentid );

ALTER TABLE patient
    ADD CONSTRAINT patient_bed_fk FOREIGN KEY ( bed_bedid )
        REFERENCES bed ( bedid );

ALTER TABLE patient
    ADD CONSTRAINT patient_diagnosis_fk FOREIGN KEY ( diagnosis_diagnosisid )
        REFERENCES diagnosis ( diagnosisid );

ALTER TABLE patient_info
    ADD CONSTRAINT patient_info_employee_fk FOREIGN KEY ( employee_personid )
        REFERENCES employee ( personid );

ALTER TABLE patient_info
    ADD CONSTRAINT patient_info_patient_fk FOREIGN KEY ( patient_personid )
        REFERENCES patient ( personid );

ALTER TABLE patient
    ADD CONSTRAINT patient_person_fk FOREIGN KEY ( personid )
        REFERENCES person ( personid );

ALTER TABLE patient
    ADD CONSTRAINT patient_physician_fk FOREIGN KEY ( physician_personid )
        REFERENCES physician ( personid );

ALTER TABLE physician
    ADD CONSTRAINT physician_person_fk FOREIGN KEY ( personid )
        REFERENCES person ( personid );

ALTER TABLE volunteer
    ADD CONSTRAINT volunteer_person_fk FOREIGN KEY ( personid )
        REFERENCES person ( personid );

CREATE OR REPLACE TRIGGER arc_fkarc_1_physician BEFORE
    INSERT OR UPDATE OF personid ON physician
    FOR EACH ROW
DECLARE
    d CHAR(9);
BEGIN
    SELECT
        a.persontype
    INTO d
    FROM
        person a
    WHERE
        a.personid = :new.personid;

    IF ( d IS NULL OR d <> 'Physician' ) THEN
        raise_application_error(-20223, 'FK Physician_Person_FK in Table Physician violates Arc constraint on Table Person - discriminator column PersonType doesn''t have value ''Physician'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_1_employee BEFORE
    INSERT OR UPDATE OF personid ON employee
    FOR EACH ROW
DECLARE
    d CHAR(9);
BEGIN
    SELECT
        a.persontype
    INTO d
    FROM
        person a
    WHERE
        a.personid = :new.personid;

    IF ( d IS NULL OR d <> 'Employee' ) THEN
        raise_application_error(-20223, 'FK Employee_Person_FK in Table Employee violates Arc constraint on Table Person - discriminator column PersonType doesn''t have value ''Employee'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_1_volunteer BEFORE
    INSERT OR UPDATE OF personid ON volunteer
    FOR EACH ROW
DECLARE
    d CHAR(9);
BEGIN
    SELECT
        a.persontype
    INTO d
    FROM
        person a
    WHERE
        a.personid = :new.personid;

    IF ( d IS NULL OR d <> 'Volunteer' ) THEN
        raise_application_error(-20223, 'FK Volunteer_Person_FK in Table Volunteer violates Arc constraint on Table Person - discriminator column PersonType doesn''t have value ''Volunteer'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_1_patient BEFORE
    INSERT OR UPDATE OF personid ON patient
    FOR EACH ROW
DECLARE
    d CHAR(9);
BEGIN
    SELECT
        a.persontype
    INTO d
    FROM
        person a
    WHERE
        a.personid = :new.personid;

    IF ( d IS NULL OR d <> 'Patient' ) THEN
        raise_application_error(-20223, 'FK Patient_Person_FK in Table Patient violates Arc constraint on Table Person - discriminator column PersonType doesn''t have value ''Patient'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             2
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           4
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                  13
-- WARNINGS                                 2
