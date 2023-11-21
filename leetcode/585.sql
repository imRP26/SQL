/*
 * https://leetcode.com/problems/investments-in-2016/
 */



/*
 * Approach from LC Official Editorial!
 */
select round(sum(Insurance.tiv_2016), 2) as tiv_2016 from Insurance where Insurance.tiv_2015 in 
(select tiv_2015 from Insurance group by tiv_2015 having count(*) > 1) and concat(lat, concat(',', lon)) in 
(select concat(lat, concat(',', lon)) from Insurance group by lat, lon having count(*) = 1);



/*
 * Approach of Window Function from -> 
 * https://leetcode.com/problems/investments-in-2016/solutions/353937/window-function/
 */
select round(sum(tiv_2016), 2) as tiv_2016 from 
(select *, count(*) over (partition by tiv_2015) as count1, count(*) over (partition by lat, lon) as 
count2 from Insurance) as t 
where count1 >= 2 and count2 = 1;
 