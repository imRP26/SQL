/*
 * https://leetcode.com/problems/orders-with-maximum-quantity-above-average/
 */



/*
 * Approach of SubQuery from -> 
 * https://leetcode.com/problems/orders-with-maximum-quantity-above-average/solutions/1230749/solve-it-with-subquery-or-window-function/
 */
with cte as 
(select order_id, avg(quantity) as avg_qty, max(quantity) as max_qty from OrdersDetails group by order_id)
select order_id from cte where max_qty > (select max(avg_qty) from cte);



/*
 * Approach of Window Function from -> 
 * https://leetcode.com/problems/orders-with-maximum-quantity-above-average/solutions/1230749/solve-it-with-subquery-or-window-function/
 */
with cte as 
(select order_id, max(avg(quantity)) over() as max_avg_qty, max(quantity) as max_qty from OrdersDetails 
group by order_id) 
select order_id from cte where max_qty > max_avg_qty;
