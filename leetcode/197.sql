/*
 * https://leetcode.com/problems/rising-temperature/
 */



/*
 * Approach from -> https://leetcode.com/problems/rising-temperature/editorial/
 */ 
select weather.id as id from Weather join Weather w on datediff(weather.recordDate, w.recordDate) = 1 
and weather.Temperature > w.Temperature;



/*
 * Approach from -> https://leetcode.com/problems/rising-temperature/editorial/comments/249247
 */
select distinct w1.id from Weather w1, Weather w2 where w1.Temperature > w2.Temperature and 
datediff(w1.recordDate, w2.recordDate) = 1;



/*
 * Approach from -> https://leetcode.com/problems/rising-temperature/editorial/comments/199432
 */
select today.id from Weather yesterday, Weather today where 
yesterday.recordDate = subdate(today.recordDate, 1) and yesterday.temperature < today.temperature;
