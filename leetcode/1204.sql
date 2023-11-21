/*
 * https://leetcode.com/problems/last-person-to-fit-in-the-bus/
 */



/*
 * Approach of SUM() window function from -> 
 * https://leetcode.com/problems/last-person-to-fit-in-the-bus/solutions/642795/mysql-beat-95-fast-solution-using-window-function/
 */
select person_name from 
(select person_name, weight, turn, sum(weight) over (order by turn) as cumulative_weight_sum from Queue) 
as t where cumulative_weight_sum <= 1000 order by turn desc limit 1; 



/*
 * will need to understand the other solution at some later point of time!!
 */