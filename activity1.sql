--#1 
SELECT EMP_NUM, EMP_LNAME, EMP_FNAME, EMP_INITIAL
FROM EMPLOYEE
WHERE EMP_LNAME LIKE 'Smith%';

--#2
SELECT p.PROJ_NAME, p.PROJ_VALUE, p.PROJ_BALANCE, e.EMP_LNAME, e.EMP_FNAME, e.EMP_INITIAL, j.JOB_CODE, j.JOB_DESCRIPTION, j.JOB_CHG_HOUR
FROM EMPLOYEE e
INNER JOIN PROJECT p ON e.EMP_NUM = p.EMP_NUM
INNER JOIN JOB j ON e.JOB_CODE = j.JOB_CODE
ORDER BY p.PROJ_VALUE;

--#3
SELECT p.PROJ_NAME, p.PROJ_VALUE, p.PROJ_BALANCE, e.EMP_LNAME, e.EMP_FNAME, e.EMP_INITIAL, j.JOB_CODE, j.JOB_DESCRIPTION, j.JOB_CHG_HOUR
FROM EMPLOYEE e
INNER JOIN PROJECT p ON e.EMP_NUM = p.EMP_NUM
INNER JOIN JOB j ON e.JOB_CODE = j.JOB_CODE
ORDER BY e.EMP_LNAME;

--#4
SELECT DISTINCT a.PROJ_NUM
FROM ASSIGNMENT a
ORDER BY a.PROJ_NUM;

--#5
SELECT 
  ASSIGN_NUM,
  EMP_NUM,
  PROJ_NUM,
  ASSIGN_CHARGE,
  ROUND(ASSIGN_HOURS * ASSIGN_CHARGE, 2) AS CALCULATED_CHARGE
FROM ASSIGNMENT
ORDER BY ASSIGN_NUM;

--#6
SELECT 
  e.EMP_NUM,
  e.EMP_LNAME,
  ROUND(SUM(ASSIGN_HOURS), 2) AS SumOfASSIGN_HOURS,
  ROUND(SUM(ASSIGN_CHARGE), 2) AS SumOfASSIGN_CHARGE
FROM ASSIGNMENT a
INNER JOIN EMPLOYEE e ON a.EMP_NUM = e.EMP_NUM
GROUP BY e.EMP_NUM, e.EMP_LNAME
ORDER BY e.EMP_NUM;

--#7
SELECT 
  p.PROJ_NUM,
  ROUND(SUM(ASSIGN_HOURS), 2) AS SumOfASSIGN_HOURS,
  ROUND(SUM(ASSIGN_CHARGE), 2) AS SumOfASSIGN_CHARGE
FROM ASSIGNMENT a
INNER JOIN PROJECT p ON a.PROJ_NUM = p.PROJ_NUM
GROUP BY p.PROJ_NUM
ORDER BY p.PROJ_NUM;

--#8
SELECT
  ROUND(SUM(ASSIGN_HOURS), 2) AS SumOfASSIGN_HOURS,
  ROUND(SUM(ASSIGN_HOURS + ASSIGN_CHARGE), 2) AS SumOfASSIGN_CHARGE
FROM ASSIGNMENT;

