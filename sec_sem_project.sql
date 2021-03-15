-- Recruitement Management --

-- 1. Candidate Table --
CREATE TABLE candidate(
candidate_id NUMBER(3) CONSTRAINT can_id_Pk PRIMARY KEY,
cn_first_name VARCHAR2(30) NOT NULL,
cn_middle_name VARCHAR2(30) NOT NULL,
cn_last_name VARCHAR2(30) NOT NULL,
cn_gender CHAR(1) NOT NULL CONSTRAINT M_F_CON CHECK (cn_gender = 'M' OR cn_gender = 'F'),

-- Address --
cn_address VARCHAR2(30),
cn_city VARCHAR2(30),
cn_state VARCHAR2(30),
cn_country VARCHAR2(30),

--Education--
cn_UG_COLLEGE VARCHAR2(40),
cn_UG_MARKS NUMBER CONSTRAINT UG_MARKS_CON CHECK (cn_UG_MARKS <=100),
cn_PG_COLLEGE VARCHAR2(40),
cn_PG_MARKS NUMBER CONSTRAINT PG_MARKS_CON CHECK (cn_PG_MARKS <=100),

--Contact Information--\
cn_email VARCHAR2(20),            --make an check cons--
cn_phone_no NUMBER(10),            -- " " " "--

--Exprience--
cn_exprience_years NUMBER(2),
cn_pre_company VARCHAR2(40),
cn_current_employer VARCHAR2(40)
);
 

-- 2. JOB APPLICATION--
CREATE TABLE job_application(

--JOB APPLICATION ID--                                               
job_application_id NUMBER(3) CONSTRAINT job_app_pk PRIMARY KEY,

candidate_id NUMBER,
CONSTRAINT can_id_fk FOREIGN KEY(candidate_id) REFERENCES candidate(candidate_id), --fk--

position_id NUMBER(3),
CONSTRAINT pos_id_fk FOREIGN KEY(position_id) REFERENCES position_t(position_id),
--FK--
name_position VARCHAR2(20),
cover_latter VARCHAR2(200),
status VARCHAR2(10),
average_rating NUMBER(2),
total_rating NUMBER(2)
);



/* 3. POSITION TABLE */
CREATE TABLE position_t(
position_id NUMBER(3) CONSTRAINT pos_id_Pk PRIMARY KEY, 
name_position varchar2(20),

/*Requirement**/
educational_requirement VARCHAR(50),
skill_required VARCHAR2(50),
/*job Discription*/
hiring_manager VARCHAR2(50),
funtional_area VARCHAR2(50),
position_title VARCHAR2(50),
job_description VARCHAR2(50),
min_pay NUMBER,
max_pay NUMBER,
status_p VARCHAR2(50)
);

/* 4. REVIEW */

CREATE TABLE review(

review_id NUMBER(3)CONSTRAINT re_id_Pk PRIMARY KEY,

Assessment_r VARCHAR(50),

candidate_id NUMBER,

job_application_id NUMBER,
CONSTRAINT re_id_fk FOREIGN KEY(job_application_id) REFERENCES job_application(job_application_id),

position_id NUMBER,
position_title VARCHAR2(50),

rating_can NUMBER,
review_number NUMBER
);

ALTER TABLE review
ADD CONSTRAINT recn_id_fk FOREIGN KEY(candidate_id) REFERENCES candidate(candidate_id);

ALTER TABLE review
ADD CONSTRAINT reps_id_fk FOREIGN KEY(position_id) REFERENCES position_t(position_id);





-- 5. JOB POSTING --
CREATE TABLE job_posting(
job_posting_id NUMBER(3) CONSTRAINT post_id_pk PRIMARY KEY,
employment_website VARCHAR2(50),
position_id NUMBER(3),
CONSTRAINT jp_fk FOREIGN KEY(position_id) REFERENCES position_t(position_id)
);



CREATE TABLE employment_website(
employment_website_name VARCHAR(50) ,
ew_id NUMBER(3) CONSTRAINT ew_id_pk PRIMARY KEY,
maximum_budget number,
price_per_post number,
web_address VARCHAR(50)
);


ALTER TABLE job_posting
ADD ew_id NUMBER(3) 
ADD CONSTRAINT ew_id_fk FOREIGN KEY(ew_id) REFERENCES employment_website(ew_id)


/*1*/INSERT INTO candidate VALUES(001, 'Yogendra', 'singh', 'mer', 'M','talla cheena khan almora', 'Almora', 'Uttrakhand', 'India', 'S.S.J Campus Almora', 65,'MIT SOM Pune', 65,'yogendra@gmail.com', 8006260872, 3, 'NASA', 'ISRO');
/*2*/INSERT INTO candidate VALUES(002, 'Bineet', 'singh', 'kemar', 'M','kharari', 'Pune', 'Maharastra', 'India', 'Pune University', 85,'MIT SOM Pune', 75,'bineet@gmail.com', 1111111111, 1, 'Tata', 'Tata');
/*3*/INSERT INTO candidate VALUES(003, 'Kunver', '-', 'Siddharth', 'M','Near airport', 'bareilly', 'Uttrapardesh', 'India', 'ABC University', 90,'MIT SOM Pune', 85,'kunver@gmail.com', 2222222222, 7, 'TCL', 'TCL');
/*4*/INSERT INTO candidate VALUES(004, 'Debpriyam', 'singh', 'Chaudhary', 'M','Khi dur in west bangol', 'Khi dur', 'Bangol', 'India', 'I. D. K. Campus Almora', 77,'MIT SOM Pune', 89,'UNAGI@gmail.com', 3333333333, 2, 'COM1', 'COM1');
/*5*/INSERT INTO candidate VALUES(005, 'Gaurav', '-', 'Makasare', 'M','Viman nagar', 'Pune', 'Maharastra', 'India', 'BOSSCE Campus Almora', 83,'MIT SOM Pune', 81,'gaurav@gmail.com', 4444444444, 3, 'NASA', 'ISRO');
/*6*/INSERT INTO candidate VALUES(006, 'Lady', '00', '1', 'F','Address 1', 'Distric 1', 'State 2', 'India', 'Campus 1', 75,'Campus 2', 55,'lady001@gmail.com', 5555555555, 3, 'NASA', 'ISRO');


/*1*/ INSERT INTO position_t VALUES(101, 'assistant Software Developer', '1.gradution in computer science 2.65% minimum', '1. java 2. software development', 
'Mr. Hunter', 'Software development', 'assistant developer', 'abc abc abc', 30000, 40000, 'empty' );
/*2*/ INSERT INTO position_t VALUES(102, 'Senior Developer', '1.gradution in computer science 2.65% minimum', '1. java 2. software development', 
'Mr. Hunter', 'Software development', 'Senior developer', 'abc abc abc', 20000, 25000, 'empty' );

/*3*/ INSERT INTO position_t VALUES(103, 'Project Manager', '1.gradution in management science 2.65% minimum', '1. leadership skills 2. software development', 
'Mr. Hire', 'Project management', 'Manager', 'abc abc abc', 40000, 50000, 'empty' );
/*4*/ INSERT INTO position_t VALUES(104, 'HR', '1.gradution in management 2.65% minimum', '1. human resources', 
'Mr. HR_DEP', 'junior HR', 'junior HR', 'abc abc abc', 20000, 25000, 'empty' );
/*5*/ INSERT INTO position_t VALUES(105, 'HRr', '1.gradution in management 2.65% minimum', '1. human resources managementt', 
'Mr. HR_DEP', 'Senior HR', 'Senior HR', 'abc abc abc', 30000, 40000, 'empty' );

/*1*/INSERT INTO job_application VALUES(201, 1, 103 ,'Project Manager', 'abcdef', 'pending', 90, 90);
/*2*/INSERT INTO job_application VALUES(202, 2, 101 ,'Software Developer', 'abcdef', 'pending', 90, 90);
/*3*/INSERT INTO job_application VALUES(203, 3, 102 ,'Senior Developer', 'abcdef', 'pending', 90, 90);
/*4*/INSERT INTO job_application VALUES(204, 4, 103 ,'Project Manager', 'abcdef', 'pending', 90, 90);
/*5*/INSERT INTO job_application VALUES(205, 5, 104 ,'Junior HR', 'abcdef', 'pending', 90, 90);
/*6*/INSERT INTO job_application VALUES(206, 6, 105 ,'Senior HR', 'abcdef', 'pending', 90, 90);


INSERT INTO review VALUES(301, 'assesments abc...', 1, 201, 103, 'Project Manager', 95, 11);
INSERT INTO review VALUES(302, 'assesments abc...', 2, 202, 101, 'Project Manager', 95, 11);
INSERT INTO review VALUES(303, 'assesments abc...', 3, 203, 102, 'Project Manager', 95, 11);
INSERT INTO review VALUES(304, 'assesments abc...', 4, 204, 103, 'Project Manager', 95, 11);
INSERT INTO review VALUES(305, 'assesments abc...', 5, 205, 104, 'Project Manager', 95, 11);
INSERT INTO review VALUES(306, 'assesments abc...', 6, 206, 105, 'Project Manager', 95, 11);


INSERT INTO job_posting VALUES(401, 'NAUKRI.COM', 101);
INSERT INTO job_posting VALUES(402, 'NAUKRI.COM', 102);
INSERT INTO job_posting VALUES(403, 'LINKDIN.COM', 103);
INSERT INTO job_posting VALUES(404, 'LINKDIN.COM', 104);
INSERT INTO job_posting VALUES(405, 'GLASSDOOR.COM', 105);

INSERT INTO employment_website VALUES('NAUKRI.COM', 501, 5000, 150, 'www.naukri.com');
INSERT INTO employment_website VALUES('LINKDIN.COM', 502, 5000, 10, 'www.naukri.com');
INSERT INTO employment_website VALUES('GLASSDOOR.COM', 503, 5000, 1850, 'www.naukri.com');



