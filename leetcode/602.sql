/*
 * https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
 */



/*
 * Approach from -> 
 * https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/solutions/103812/share-my-accepted-sql-query-using-union-all-the-first-accepted-answer-of-all/
 */
select id, count(*) as num from 
(select requester_id as id from RequestAccepted 
union all 
select accepter_id as id from RequestAccepted) t 
group by id order by num desc limit 1;
