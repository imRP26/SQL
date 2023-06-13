/*
 * https://leetcode.com/problems/sales-person/
 */



/*
 * Approach from -> https://leetcode.com/problems/sales-person/editorial/comments/129783
 */
select name from SalesPerson where sales_id not in 
(select o.sales_id from Orders o join Company c on o.com_id = c.com_id where c.name = 'Red');



/*
 * Approach 2 from -> 
 * https://leetcode.com/problems/sales-person/solutions/2216256/sql-two-approaches-with-without-using-join/
 */
select name from SalesPerson where sales_id not in 
(select sales_id from Orders where com_id in (select com_id from Company where name = 'Red'));
