Select name from sqlite_master where type='table';

SELECT * from customer;
Select * from cust_loc;

--Info about Customer TABLE
Select Gender,count(Gender) from customer GROUP BY Gender;
Select Partner,count(Partner) from customer GROUP BY Partner;
Select Dependents,count(Dependents) from customer GROUP BY Dependents;

--Info about cust_account TABLE
Select round(avg(Tenure),2) from cust_account;
Select round(avg(TotalCharges),2) from cust_account;
Select round(avg(MonthlyCharges),2) from cust_account;

SELECT count(*) from cust_account where TotalCharges >(Select avg(MonthlyCharges) from cust_account);

SELECT Contract,count(*) from cust_account GROUP By Contract;

--Info about Churn (cust_churn)
SELECT Churn,count(*) from cust_churn GROUP By Churn;

--TotalCharges Grouped by Churn
Select cust_churn.Churn,avg(cust_account.TotalCharges) from cust_churn INNER JOIN cust_account ON cust_account.Account_id=cust_churn.Id GROUP BY cust_churn.Churn;


--MonthlyCharges Grouped by Churn
Select cust_churn.Churn,avg(cust_account.MonthlyCharges) from cust_churn INNER JOIN cust_account ON cust_account.Account_id=cust_churn.Id GROUP BY cust_churn.Churn;


--MonthlyCharges Grouped by Churn
Select cust_churn.Churn,cust_account.Contract,count(cust_account.Contract) from cust_churn INNER JOIN cust_account ON cust_account.Account_id=cust_churn.Id GROUP BY cust_churn.Churn,cust_account.Contract;


--INSIGHTS
---Customers who left the company were paying "less" compared with customers who were with it.
---Customers who left the company are paying more as monthly payments.
---Customers with 1 year or 2 year contract in general don't leave the company.





