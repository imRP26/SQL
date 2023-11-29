/*
 * https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
 */



/*
 * Simple solution!
 */
select activity_date as day, count(distinct user_id) as active_users from Activity where 
activity_date > '2019-06-27' and activity_date <= '2019-07-27' group by activity_date;



/*
 * Approach from LC Official Editorial!
 */
select activity_date as day, count(distinct user_id) as active_users from Activity group by 
activity_date having activity_date > date_sub('2019-07-27', interval 30 day) and 
activity_date <= '2019-07-27';
