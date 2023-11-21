/*
 * https://leetcode.com/problems/employees-whose-manager-left-the-company/
 */



/*
 * Mera khud ka approach hai ye ji!
 */
select employee_id from Employees where salary < 30000 and manager_id not in 
(select employee_id from Employees) order by employee_id;   



/*
 * Approach from -> 
 * https://leetcode.com/problems/employees-whose-manager-left-the-company/solutions/1419351/mysql-using-not-in/
 */
-- Null values are excluded in value comparisons (including checking the presence of values in a list)
select employee_id from Employees where manager_id not in 
(select employee_id from Employees) and salary < 30000 order by employee_id;
