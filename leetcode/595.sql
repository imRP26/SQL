/*
 * https://leetcode.com/problems/big-countries/
 */



-- Approach 1
select name, population, area from World where area >= 3000000 or population >= 25000000;



-- Approach 2
select name, population, area from World where area >= 3000000 
union 
select name, population, area from World where population >= 25000000;



/*
 * While it's true that depending on how the indexes are structured, 
 * a particular approach might be faster, it's also true that there might 
 * instead be an index that has both columns included, in which case the single 
 * table query will be faster because it'll be able to USE both columns. 
 * Note that if an index were on (columnA, columnB), and you tried to query 
 * WHERE columnB='someValue', then that index actually couldn't be applied 
 * because indexes have order. That index could be applied if your query had a 
 * WHERE columnA='someVal' AND columnB='otherVal'.
 * The UNION operator has to find the DISTINCT values 
 * (as opposed to UNION ALL, which doesn't perform the DISTINCT operation). 
 * The DISTINCT operation may be expensive depending on the dataset.
 * So really, this just depends on the specifics of the table 
 * structure / underlying data. 
 * From the information given, we can't reliably say which 
 * approach is faster.
 */
