/*
 * https://leetcode.com/problems/tree-node/
 */



/*
 * Approach 1 from 
 * https://leetcode.com/problems/tree-node/solutions/127645/tree-node/
 */
select id, 'Root' as type from Tree where p_id is null 
union 
select id, 'Leaf' as type from Tree where id not in 
(select distinct p_id from tree where p_id is not null) and 
p_id is not null 
union 
select id, 'Inner' as type from Tree where id in 
(select distinct p_id from tree where p_id is not null) and 
p_id is not null 
order by id; 



/*
 * Approach 2 of 
 * https://leetcode.com/problems/tree-node/solutions/127645/tree-node/
 */
select id, case 
                when id = (select id from Tree where p_id is null) then 'Root'
                when id in (select p_id from Tree) then 'Inner' 
                else 'Leaf' 
            end as type 
from Tree order by id; 



/*
 * Approach 3 of the above LC official solution link
 */
select id, if(isnull(p_id), 'Root', if(id in (select p_id from Tree), 'Inner', 'Leaf')) 
as type from Tree order by id;
