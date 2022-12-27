CREATE TABLE Education_Levels (
    ed_lvl_id serial,
    ed_lvl_title varchar (50),
    PRIMARY KEY (ed_lvl_id)
);

CREATE TABLE Departments (
    dept_id serial,
    dept_name varchar (50),
    PRIMARY KEY(dept_id)
);

CREATE TABLE Job_Titles (
    job_title_id serial,
    job_title_name varchar(50),
    PRIMARY KEY (job_title_id)
);

CREATE TABLE States (
    state_id serial,
    state_name varchar (2),
    PRIMARY KEY (state_id)
);

CREATE TABLE Cities (
    city_id serial,
    city_name varchar (50),
    PRIMARY KEY (city_id),
    state_id int REFERENCES States (state_id)
);

CREATE TABLE Locations (
    location_id serial,
    location_address varchar (100),
    PRIMARY KEY (location_id),
    location_city_id int REFERENCES Cities (city_id)
);

CREATE TABLE Employees (
    emp_id varchar(8),
    emp_name varchar(50),
    emp_email varchar(100),
    emp_hire_dt date,
    PRIMARY KEY (emp_id),
    dept_id int REFERENCES Departments(dept_id),
    ed_lvl_id int REFERENCES Education_Levels (ed_lvl_id),
    location_id int REFERENCES Locations (location_id),
    manager_id varchar (8) 
);

CREATE TABLE Jobs (
    job_id serial,
    job_start_dt date,
    job_end_dt date,
    PRIMARY KEY (job_id),
    emp_id varchar(8) REFERENCES Employees(emp_id),
    job_title_id int REFERENCES Job_Titles (job_title_id)
);

CREATE TABLE Salaries (
    job_id int REFERENCES Jobs(job_id), 
    salary money
);


