/*
 * https://leetcode.com/problems/customers-who-never-order/
 */



-- Approach 1
select name as Customers from Customers where id not in (select customerId from Orders);



-- Approach 2
select name as Customers from Customers c left join Orders o on c.id = o.customerId where o.customerId is null;
