/*
 * https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
 */



/*
 * Approach 1 from 
 * https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/solutions/2502745/mysql-3-solutions-very-easy-left-join-if/
 */
with q as (
	select visit_id, count(*) as count_trans from transactions group by 1
) 
select customer_id, sum(if(count_trans is null, 1, 0)) as count_no_trans from 
Visits left join q using (visit_id) group by 1 having count_no_trans > 0;



/*
 * Approach 2 from 
 * https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/solutions/2502745/mysql-3-solutions-very-easy-left-join-if/
 */
select customer_id, count(visit_id) as count_no_trans from Visits left join Transactions 
using (visit_id) where transaction_id is null group by 1;



/*
 * Approach 3 from 
 * https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/solutions/2502745/mysql-3-solutions-very-easy-left-join-if/
 */
select customer_id, count(visit_id) as count_no_trans from Visits where visit_id 
not in (select visit_id from Transactions) group by 1;
