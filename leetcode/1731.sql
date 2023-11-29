/*
 * https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
 */



/*
 * Concept of Self-Join from -> 
 * https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/solutions/1923203/simple-mysql-solution-using-self-join/
 */
select mgr.employee_id, mgr.name, count(emp.employee_id) as reports_count, round(avg(emp.age)) as 
average_age from employees emp join employees mgr on emp.reports_to = mgr.employee_id group by 
employee_id order by employee_id; 



/*
 * Simple AF with-clause
 */
with t as 
(select mgr.employee_id, mgr.name, emp.employee_id as emp_id, emp.age from Employees mgr join Employees 
emp on mgr.employee_id = emp.reports_to)
select employee_id, name, count(emp_id) as reports_count, round(avg(age)) as average_age from t group by 
employee_id order by employee_id;
