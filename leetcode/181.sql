/*
 * https://leetcode.com/problems/employees-earning-more-than-their-managers/
 */



/*
 * My Naive Solution, chalo kuch toh AC hua
 */
select e1.name as Employee from Employee e1, Employee e2 where e1.managerId = e2.id 
and e1.salary > e2.salary;



/*
 * Approach from 
 * https://leetcode.com/problems/employees-earning-more-than-their-managers/solutions/127752/employees-earning-more-than-their-managers/
 */
select e1.name as Employee from Employee e1 join Employee e2 on 
e1.managerId = e2.id and e1.salary > e2.salary;
