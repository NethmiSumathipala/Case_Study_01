USE my_sql ;

-- Select all the columns
select * FROM test1;

-- Show only the EmployeeName,JobTitle columns
SELECT EmployeeName,JobTitle FROM test1;

-- Show the number of employees in the table
SELECT count(*) FROM test1;

-- Show the unique job titles in the table
SELECT distinct JobTitle FROM test1;
SELECT count( distinct JobTitle)  FROM test1;

-- Over time pay greater than 5000
SELECT JobTitle , OvertimePay FROM test1 WHERE OvertimePay > 50000;

-- Show thw average base pay for all employees
SELECT avg(BasePay) as "AVG BasePay"   FROM test1 ;

-- Top 10 highest paid employees
SELECT EmployeeName ,TotalPay FROM test1 order by TotalPay DESC LIMIT 10;

-- Show the average of Basepay , Overtimepay and otherpay for each employee
SELECT EmployeeName , (BasePay+OvertimePay+OtherPay)/3 as AveragePay FROM test1;

-- Show all employees who have the word "Manager" in their job title
select EmployeeName, JobTitle FROM test1 WHERE JobTitle LIKE "%MANAGER%";

-- Show all employees with a total pay between 50000 and 75000
SELECT EmployeeName, TotalPay from test1 WHERE TotalPay  BETWEEN 50000 AND 75000;

-- Show all employees with a base play less than 50000 or a Totalpay greater than 100000
SELECT EmployeeName, BasePay, TotalPay FROM test1 WHERE BasePay < 50000  OR TotalPay > 100000;

-- Show all employees with a total pay benefits value between 125000 and 150000 and a job title containing the word "Director"
SELECT EmployeeName , TotalPayBenefits , JobTitle FROM test1 WHERE TotalPayBenefits BETWEEN 125000 AND 150000 AND JobtITLE LIKE "%DIRECTOR%";

-- Show all employees ordered by their totalpay benefits in descending order 
SELECT * FROM test1  ORDER BY TotalPayBenefits desc;

-- Show all job titles with an avarage pay base of at least 100000 and order by the average base in descending order.
SELECT JobTitle, avg(BasePay) as "Avgbasepay" FROM test1 GROUP BY JobTitle having avg(basePay) >= 100000 ORDER BY Avgbasepay desc;

-- Delete the column
ALTER TABLE test1 DROP COLUMN Notes;
SELECT * FROM test1;

-- Update the basepay of all employee with the job title containing "Manager" by increasing it by 10%
update test1 
set BasePay = BasePay * 1.1 
WHERE JobTitle LIKE "%Manager%";
SELECT * FROM test1;

-- Delete all employees who have no overtimepay
SELECT count(*) FROM test1
WHERE OverTimePay=0;
DELETE FROM test1;