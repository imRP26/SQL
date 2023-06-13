/*
 * https://leetcode.com/problems/users-that-actively-request-confirmation-messages/
 */



/*
 * Approach from -> https://leetcode.com/problems/users-that-actively-request-confirmation-messages/solutions/1353959/self-join-and-timestampdiff/
 */
select distinct c1.user_id from Confirmations c1 join Confirmations c2 on c1.user_id = c2.user_id 
and c1.time_stamp > c2.time_stamp and timestampdiff(second, c2.time_stamp, c1.time_stamp) <= 86400;



/*
 * Approach from -> https://leetcode.com/problems/users-that-actively-request-confirmation-messages/solutions/1353614/4-lines/
 */
select distinct c1.user_id from Confirmations c1, Confirmations c2 where c1.user_id = c2.user_id and 
c1.time_stamp != c2.time_stamp and 
(c2.time_stamp between c1.time_stamp and ADDDATE(c1.time_stamp, interval 24 hour));



/*
 * Approach from -> https://leetcode.com/problems/users-that-actively-request-confirmation-messages/solutions/1593691/windows-function-timestampdiff/
 */
select distinct user_id from 
(select user_id, timestampdiff(second, time_stamp, lag(time_stamp) 
over(partition by user_id order by time_stamp)) as diff from Confirmations) t 
where diff / 3600 between -24 and 24;



/*
 * Ditto Approach as above, but this time using 'lead'
 */
select distinct user_id from 
(select user_id, timestampdiff(second, time_stamp, lead(time_stamp) 
over(partition by user_id order by time_stamp)) as diff from
Confirmations) t where diff / 3600 between -24 and 24;
