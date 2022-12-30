/*
 * https://leetcode.com/problems/group-sold-products-by-the-date/
 */



/*
 * https://leetcode.com/problems/group-sold-products-by-the-date/solutions/692797/simple-mysql-solution-most-optimal-faster-than-100/
 */ 
select sell_date, count(distinct product) as num_sold, 
group_concat(distinct product separator ',') as products from Activities 
group by sell_date order by sell_date;



/*
 * https://leetcode.com/problems/group-sold-products-by-the-date/solutions/1262267/easiest-solution/
 */
select sell_date, count(distinct product) as num_sold, 
group_concat(distinct product) as products from Activities group by sell_date 
order by sell_date;
