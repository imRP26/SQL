/*
 * https://leetcode.com/problems/find-total-time-spent-by-each-employee/
 */



/*
 * Approach A from -> 
 * https://leetcode.com/problems/find-total-time-spent-by-each-employee/solutions/1047716/Unexpected-Optimization/
 */
select event_day as 'day', emp_id, sum(out_time) - sum(in_time) as total_time from Employees 
group by event_day, emp_id;



/*
 * Approach B from -> 
 * https://leetcode.com/problems/find-total-time-spent-by-each-employee/solutions/1047716/Unexpected-Optimization/
 */
select event_day as 'day', emp_id, sum(out_time - in_time) as total_time from Employees 
group by event_day, emp_id;



/*
 * MYSQL Explanation and Syntax Details have been explained clearly in here -> 
 * https://leetcode.com/problems/find-total-time-spent-by-each-employee/solutions/2484188/easiest-and-fastest-solution-complete-beginner-explanation/
 */
