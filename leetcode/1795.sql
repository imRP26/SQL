/*
 * https://leetcode.com/problems/rearrange-products-table/
 */



/*
 * Approach 1 from - but unpivot is unavailable in MySQL
 * https://leetcode.com/problems/rearrange-products-table/solutions/1118884/2-simple-solutions-reverse-pivot-and-union/
 */
select product_id, store, price from Products 
unpivot (price for store in (store1, store2, store3)) as t;



/*
 * Approach 2 from 
 * https://leetcode.com/problems/rearrange-products-table/solutions/1118884/2-simple-solutions-reverse-pivot-and-union/
 */
select product_id, 'store1' as store, store1 as price from Products where store1 is not null 
union 
select product_id, 'store2' as store, store2 as price from Products where store2 is not null 
union 
select product_id, 'store3' as store, store3 as price from Products where store3 is not null 
order by 1, 2;
