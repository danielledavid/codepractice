CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      WITH rn AS ( 
      SELECT
      salary,
      DENSE_RANK() OVER(ORDER BY salary desc) AS ranked
        FROM Employee
      )
     SELECT DISTINCT salary 
     FROM rn
     WHERE ranked = N
  );
END