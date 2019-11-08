insert into treatment
values (12,'AIDS Cure',To_Date('10-JUN-87','DD-MON-YY'),
null,'The AIDS have been cured');

create index patient_info_index
on patient_info (patientweight);

drop table patient_info;

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
)
partition by range (patientweight) (
partition patientweight1 values less than (150),
partition patientweight2 values less than (250),
partition patientweight3 values less than (350));

ALTER TABLE patient_info ADD CONSTRAINT patient_info_pk PRIMARY KEY ( patient_personid,employee_personid );
ALTER TABLE patient_info
    ADD CONSTRAINT patient_info_employee_fk FOREIGN KEY ( employee_personid )
        REFERENCES employee ( personid );
ALTER TABLE patient_info
    ADD CONSTRAINT patient_info_patient_fk FOREIGN KEY ( patient_personid )
        REFERENCES patient ( personid );