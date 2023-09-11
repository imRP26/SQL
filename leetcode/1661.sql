/*
 * https://leetcode.com/problems/average-time-of-process-per-machine/
 */



/*
 * Approach of Self-Join from -> 
 * https://leetcode.com/problems/average-time-of-process-per-machine/solutions/3722056/sql-join-or-subquery-easy-to-understand/
 */
select a1.machine_id, round(avg(a2.timestamp - a1.timestamp), 3) as processing_time from Activity a1 
join Activity a2 on a1.machine_id = a2.machine_id and a1.process_id = a2.process_id and 
a1.activity_type = 'start' and a2.activity_type = 'end' group by a1.machine_id;



/*
 * 2nd Approach from -> 
 * https://leetcode.com/problems/average-time-of-process-per-machine/solutions/3722056/sql-join-or-subquery-easy-to-understand/ 
 */
select a.machine_id, round((select avg(a1.timestamp) from Activity a1 where a1.activity_type = 'end' 
and a1.machine_id = a.machine_id) - (select avg(a1.timestamp) from Activity a1 where 
a1.activity_type = 'start' and a1.machine_id = a.machine_id), 3) as processing_time from Activity a 
group by a.machine_id;
