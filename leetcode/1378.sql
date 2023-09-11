/*
 * https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
 */



/*
 * Approach of Left Join from LC Official Editorial!
 */ 
select eu.unique_id, e.name from Employees e left join EmployeeUNI eu on e.id = eu.id;  



/*
 * Awesome explanation regarding time and space complexities of Joins -> 
 * https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/solutions/3782400/best-optimum-solution-with-explanation-using-joins/
 */
