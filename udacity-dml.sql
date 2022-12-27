---------------
INSERT INTO
    Education_Levels (ed_lvl_title) (
        SELECT
            DISTINCT education_lvl
        FROM
            proj_stg
    );
------------
INSERT INTO
    Departments (dept_name) (
        SELECT
            DISTINCT department_nm
        FROM
            proj_stg
    );

-------------
INSERT INTO
    Job_Titles (job_title_name) (
        SELECT
            DISTINCT job_title
        FROM
            proj_stg
    );

-------------
INSERT INTO
    States (state_name)(
        SELECT
            DISTINCT STATE
        FROM
            proj_stg
    );

-------------
INSERT INTO
    Cities (city_name, state_id)(
        SELECT
            DISTINCT p2.city, 
            S.state_id
        FROM
            proj_stg p2
            JOIN States S on S.state_name = p2.STATE
    );

-------------
INSERT INTO
    Locations (location_city_id,location_address)(
        SELECT
        DISTINCT C.city_id,
            p2.ADDRESS
        FROM
            Cities C
            JOIN proj_stg p2 on p2.city = C.city_name
    );

-------------
INSERT INTO
    EMPLOYEES (
        emp_id,
        emp_name,
        emp_email,
        emp_hire_dt,
        manager_id,
        location_id,
        ed_lvl_id,
        dept_id
    ) (
        SELECT
            DISTINCT ON (p2.Emp_ID) p2.Emp_ID,
            p2.Emp_NM,
            p2.Email,
            p2.hire_dt,
            EMP.EMP_ID,
            L.location_id,
            E.ed_lvl_id,
            D.dept_id
        FROM
            proj_stg p2
            JOIN Cities C ON C.city_name = p2.city
            JOIN Departments D ON D.dept_name = p2.department_nm
            JOIN Education_Levels E ON E.ed_lvl_title = p2.education_lvl
            JOIN Locations L ON L.location_city_id = C.city_id
            LEFT JOIN proj_stg EMP ON p2.MANAGER = EMP.Emp_NM
    );

------------
INSERT INTO
    Jobs (
        job_start_dt,
        job_end_dt,
        emp_id,
        job_title_id
    ) (
        SELECT
            p2.start_dt,
            p2.end_dt,
            p2.Emp_ID,
            JT.job_title_id
        FROM
            proj_stg p2
            JOIN Job_Titles JT ON JT.job_title_name = p2.job_title
    );

---------
INSERT INTO
    SALARIES (job_id, salary) (
        SELECT
            J.job_id,
            p2.salary
        FROM
            proj_stg p2
            JOIN Job_Titles JT ON JT.job_title_name = p2.job_title
            JOIN Jobs J ON J.emp_id = p2.Emp_ID and J.job_title_id = JT.job_title_id
    );

---------
INSERT INTO
    Job_Titles (job_title_name)
VALUES
    ('Web Programmer')

------------
UPDATE
    Job_Titles
SET
    job_title_name = 'web developer'
WHERE
    job_title_name = 'Web Programmer'

------------
DELETE FROM
    Job_Titles
WHERE
    job_title_name = 'web developer'