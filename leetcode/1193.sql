/*
 * https://leetcode.com/problems/monthly-transactions-i/
 */



/*
 * Approach from -> 
 * https://leetcode.com/problems/monthly-transactions-i/solutions/396359/simple-sql/
 */
select left(trans_date, 7) as month, country, count(*) as trans_count, sum(state = 'approved') as 
approved_count, sum(amount) as trans_total_amount, 
sum(case when state = 'approved' then amount else 0 end) as approved_total_amount from Transactions 
group by month, country;



/*
 * Approach from -> 
 * https://leetcode.com/problems/monthly-transactions-i/solutions/3756098/step-by-step-detailed-solution-easy-to-understand-mysql/
 */
select substr(trans_date, 1, 7) as month, country, count(id) as trans_count, sum(state = 'approved') as 
approved_count, sum(amount) as trans_total_amount, 
sum(case when state = 'approved' then amount else 0 end) as approved_total_amount from Transactions 
group by month, country;
