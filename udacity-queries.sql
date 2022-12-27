SELECT
    EMP.emp_id,
    EMP.emp_name,
    JT.job_title_name,
    DEPT.dept_name
FROM
    Employees EMP
    JOIN Departments DEPT ON DEPT.dept_id = EMP.dept_id
    JOIN Jobs J ON J.emp_id = EMP.emp_id
    JOIN Job_Titles JT ON JT.job_title_id = J.job_title_id 


----------
SELECT
    COUNT(EMP_ID) "Total Employees",
    D.dept_name
from
    Employees E
    JOIN Departments D ON D.dept_id = E.dept_id
GROUP BY
    D.dept_id;

-------
SELECT
    EMP.emp_name,
    JT.job_title_name,
    DEPT.dept_name,
    MANG.emp_name as Manager,
    J.job_start_dt,
    J.job_end_dt
FROM
    Employees EMP
    JOIN Departments DEPT ON DEPT.dept_id = EMP.dept_id
    JOIN Jobs J ON J.emp_id = EMP.emp_id
    JOIN Job_Titles JT ON JT.job_title_id = J.job_title_id
    JOIN Employees MANG ON EMP.manager_id = MANG.emp_id
WHERE
    EMP.emp_name = 'Toni Lembeck'

------