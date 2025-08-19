SELECT * FROM swiggyorders_db.customer_retention_dataset;



#GENDER DEMOGRAPHICS
SELECT Gender, count(CustomerID) as total_customers
from swiggyorders_db.customer_retention_dataset
Group by Gender;

# INSIGHT - THERES A EVEN DISTRIBUTION OF GENDER WHEREAS OTHERS ARE ALSO AVIALABLE WITH A COUNT OF 100


#Store Location by Purchase Amount
Select  StoreLocation,sum(PurchaseAmount) as total_purchased_amount
from swiggyorders_db.customer_retention_dataset
group by StoreLocation
order by total_purchased_amount DESC;

#MUMBAI IS LEADING WITH THE PURCHASE AMOUNT WHEREAS DELHI IS AT THE BOTTOM

#STORELOCATION PER CUSTOMER
SELECT StoreLocation,Count(CustomerID) as total_customers
from swiggyorders_db.customer_retention_dataset
group by StoreLocation
ORDER BY total_customers DESC;

#BANGLORE & MUMBAI TOGETHER ARE AT THE TOP WITH 412 CUSTOMERS WHEREAS CHENNAI IS AT THE BOTTOM WITH 393 CUSTOMERS

# TOP 5 HIGHEST PAYING CUSTOMERS

SELECT COUNT(TransactionDate),CustomerID,SUM(PurchaseAmount) as total_spend
from swiggyorders_db.customer_retention_dataset
group by CustomerID
order by total_spend DESC
LIMIT 5;

SELECT COUNT(TransactionDate),CustomerID,SUM(PurchaseAmount) as total_spend
from swiggyorders_db.customer_retention_dataset
group by CustomerID
order by total_spend 
LIMIT 5;


#INSIGHT- CUSTID0428 HAS THE MAXIMUM PURCHASE TICKET WHERE AS CUST0156,CUST0398,CUST0092 & CUST0345 ARE BARELY SPENIND ON ORDERS
 
 
 
 #DATES WITH HIGHEST AND LOWEST TRANSACTIONS WITH STORE LOCTIONS
 
 
SELECT  StoreLocation,TransactionDate,count(TransactionDate) AS Count_of_Transaction
from swiggyorders_db.customer_retention_dataset
group by TransactionDate,StoreLocation
order by Count_of_Transaction DESC
LIMIT 5;


 
SELECT  StoreLocation,TransactionDate,count(TransactionDate) AS Count_of_Transaction
from swiggyorders_db.customer_retention_dataset
group by TransactionDate,StoreLocation
order by Count_of_Transaction 
LIMIT 5;

#THUS THE TANSACTION OF STORES ARE LIMITED TO 1-5 PER DAY












