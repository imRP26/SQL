/*
 * https://leetcode.com/problems/recyclable-and-low-fat-products/
 */



-- Approach 1
select product_id from Products where low_fats = 'Y' and recyclable = 'Y';



-- Write a query to get the % of certain products
select round(avg(case when low_fats = 'Y' or recyclable = 'Y' then 1 else 0 end), 2) 
as percentage;
