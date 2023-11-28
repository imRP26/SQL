/*
 * https://leetcode.com/problems/primary-department-for-each-employee/
 */



/*
 * Approach of simple UNION and GROUP-BY from LC Official Editorial!
 */
select employee_id, department_id from Employee where primary_flag = 'Y' 
union 
select employee_id, department_id from Employee group by employee_id having count(employee_id) = 1;



/*
 * Approach of Window Function from LC Official Editorial!
 */
select employee_id, department_id from 
(select *, count(employee_id) over (partition by employee_id) as employee_count from Employee) as t 
where employee_count = 1 or primary_flag = 'Y';
