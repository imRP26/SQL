/*
 * https://leetcode.com/problems/find-the-team-size/
 */



/*
 * Approach from -> 
 * https://leetcode.com/problems/find-the-team-size/solutions/463616/intuitive-left-join-with-explanation/
 */
select employee_id, team_size from Employee e1 left join 
(select team_id, count(employee_id) as team_size from Employee group by team_id) as e2 
on e1.team_id = e2.team_id;



/*
 * Window Function Approaches from -> 
 * https://leetcode.com/problems/find-the-team-size/solutions/469457/window-function/
 */
select employee_id, count(*) over(partition by team_id) as team_size from Employee;
--> ****************************************************************************************
select employee_id, count(team_id) over(partition by team_id) as team_size from Employee;
--> ****************************************************************************************
select employee_id, count(1) over(partition by team_id) as team_size from Employee;
