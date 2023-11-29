/*
 * https://leetcode.com/problems/biggest-single-number/
 */



/*
 * My simple, naive Approach
 */ 
with t as 
(select num, count(num) as num_occurences from MyNumbers group by num)
select max(num) as num from t where num_occurences = 1;



/*
 * Approach from LC Official Editorial!
 */
select max(num) as num from 
(select num from MyNumbers group by num having count(num) = 1) as t;
