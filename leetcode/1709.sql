/*
 * https://leetcode.com/problems/biggest-window-between-visits/
 */



/*
 * Approach of DATEDIFF() and LEAD() from LC Official Editorial!
 */
select user_id, max(biggest_window) biggest_window from 
(select user_id, visit_date, datediff(ifnull(lead(visit_date, 1) over 
(partition by user_id order by visit_date), '2021-1-1'), visit_date) biggest_window from UserVisits) 
t group by user_id;



/*
 * If Possible, read the other solution involving RANK() sometime later!
 */
 