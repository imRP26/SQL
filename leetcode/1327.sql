/*
 * https://leetcode.com/problems/list-the-products-ordered-in-a-period/
 */



-- My Naive Solution
with o as 
(select product_id, sum(unit) as unit from Orders where order_date >= '2020-02-01' and 
order_date <= '2020-02-29' group by product_id) 
select product_name, unit from Products p join o on o.product_id = p.product_id where unit >= 100;



/*
 * Approach from -> 
 * https://leetcode.com/problems/list-the-products-ordered-in-a-period/solutions/3583495/attention-coders-efficient-sql-query-to-retrieve-products-ordered-using-join/?envType=study-plan-v2&envId=top-sql-50
 */
select p.product_name as product_name, sum(o.unit) as unit from Products p join Orders o using 
(product_id) where year(o.order_date) = '2020' and month(o.order_date) = '02' group by p.product_id 
having sum(o.unit) >= 100;



/*
 * Alternate syntax from -> 
 * https://leetcode.com/problems/list-the-products-ordered-in-a-period/solutions/488995/easy-mysql-solution-100-faster/
 */
select p.product_name as product_name, sum(o.unit) as unit from Products p join Orders o using 
(product_id) where left(o.order_date, 7) = '2020-02' group by p.product_id having sum(o.unit) >= 100;
