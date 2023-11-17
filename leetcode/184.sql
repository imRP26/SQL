/*
 * https://leetcode.com/problems/department-highest-salary/
 */



/*
 * Join
 */ 
select Department.name as 'Department', Employee.name as 'Employee', salary from Employee join Department 
on Employee.DepartmentId = Department.Id where (Employee.DepartmentId, Salary) in 
(select DepartmentId, max(salary) from Employee group by DepartmentId);



/*
 * Approach of rank() from -> 
 * https://leetcode.com/problems/department-highest-salary/solutions/53607/three-accpeted-solutions/comments/774581
 */
select department, employee, salary from 
(select d.name department, e.name employee, e.salary, rank() over (partition by e.departmentId order by 
e.salary desc) rn from Employee e join Department d on e.DepartmentId = d.Id) sub where rn = 1;
