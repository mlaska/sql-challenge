SELECT 'Question 1' AS Question
     , e.emp_no
     , e.last_name
     , e.first_name
     , e.gender
     , s.salary
  FROM public."employees" e
       JOIN public."Salaries" s
         ON e.emp_no = s.emp_no;
SELECT 'Question 2' AS Question
     , e.emp_no
     , e.last_name
     , e.first_name
     , e.gender
     , e.hire_date
  FROM public."employees" e
 WHERE date_part('year', e.hire_date) = 1986;
SELECT 'Question 3' AS Question
     , d.dept_no
     , dd.dept_name
     , d.emp_no AS Manager_emp_no
     , e.last_name
     , e.first_name
     , d.from_date
     , d.to_date
  FROM public."dept_manager" d
       JOIN public."departments" dd
         ON dd.dept_no = d.dept_no
       JOIN public."employees" e
         ON e.emp_no = d.emp_no;
SELECT 'Question 4' AS Question
     , e.emp_no
     , e.last_name
     , e.first_name
     , (SELECT dd.dept_name
          FROM public."dept_emp" de
               JOIN public."departments" dd
                 ON de.dept_no = dd.dept_no
         WHERE de.emp_no = e.emp_no
         ORDER BY de.from_date DESC limit 1)
  FROM public."employees" e;
SELECT 'Question 5' AS Question
     ,*
  FROM public."employees" e
 WHERE LOWER(e.first_name) = 'hercules'
   AND LOWER(e.last_name) LIKE 'b%';
SELECT *
  FROM (SELECT 'Question 6' AS Question
             , e.emp_no
             , e.last_name
             , e.first_name
             , (SELECT dd.dept_name
                  FROM public."dept_emp" de
                       JOIN public."departments" dd
                         ON de.dept_no = dd.dept_no
                 WHERE de.emp_no = e.emp_no
                 ORDER BY de.from_date DESC limit 1) AS department
          FROM public."employees" e) g
 WHERE g.department = 'Sales';
SELECT *
  FROM (SELECT 'Question 7' AS Question
             , e.emp_no
             , e.last_name
             , e.first_name
             , (SELECT dd.dept_name
                  FROM public."dept_emp" de
                       JOIN public."departments" dd
                         ON de.dept_no = dd.dept_no
                 WHERE de.emp_no = e.emp_no
                 ORDER BY de.from_date DESC limit 1) AS department
          FROM public."employees" e) g
 WHERE (g.department = 'Sales' OR
        g.department = 'Development');
SELECT 'Question 8' AS Question
     , e.last_name
     , COUNT(e.emp_no) AS n_count
  FROM public."employees" e
 GROUP BY e.last_name
 ORDER BY COUNT(e.emp_no) DESC;