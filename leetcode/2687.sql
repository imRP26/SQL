/*
 * https://leetcode.com/problems/bikes-last-time-used/
 */



/*
 * Simple Solution using group-by + Aggegation from -> 
 * https://leetcode.com/problems/bikes-last-time-used/solutions/3523610/mysql-group-by-aggregate-function/
 */
select bike_number, max(end_time) as end_time from Bikes group by bike_number order by end_time desc;
