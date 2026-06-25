CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      WITH ranked AS(
        SELECT 
        salary,
        RANK() OVER (ORDER BY salary DESC) AS ranked_salary
        FROM Employee
        GROUP BY salary
      )
      SELECT MAX(salary) AS getNthHighestSalary
      FROM ranked
      WHERE ranked_salary = n

  );
END