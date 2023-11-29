/*
 * https://leetcode.com/problems/product-sales-analysis-iii/
 */



/*
 * Approach from LC Official Editorial
 * Also go through this -> 
 * https://leetcode.com/problems/product-sales-analysis-iii/solutions/371047/help-why-is-my-solution-wrong-did-i-misunderstand-the-problem/?envType=study-plan-v2&envId=top-sql-50
 */
select product_id, year as first_year, quantity, price from Sales where (product_id, year) 
in (select product_id, min(year) as year from Sales group by product_id); 
  