use AdventureWorks2012

--a. Get all the details from the person table including email ID, phone
-- and phone number type.

select P.*, E.EmailAddress, Ph.PhoneNumber, Ph.PhoneNumberTypeID  from Person.Person as P
join Person.EmailAddress as E
on P.BusinessEntityID = E.BusinessEntityID
join Person.PersonPhone as Ph
on Ph.BusinessEntityID = E.BusinessEntityID


--. Get the details of the sales header order made in May 2011

select * from Sales.SalesOrderHeader 
where month(OrderDate) = 5 and year(OrderDate) = 2011

select * from sales.salesorderheader
WHERE datename(month,orderDate)='May' and year(OrderDate) = 2011

--c. Get the details of the sales details order made in the month of May 2011select * from Sales.SalesOrderDetail ODJOIN Sales.SalesOrderHeader OHON OD.SalesOrderID = OH.SalesOrderIDwhere month(OrderDate) = 5 and year(OrderDate) = 2011--d. Get the total sales made in May 2011

select sum(TotalDue) as may_total_sales from Sales.SalesOrderHeader
where month(OrderDate) = 5 and year(OrderDate) = 2011

--e. Get the total sales made in the year 2011 by month order by increasing sales.

select datename(month, OrderDate) as month_name , sum(TotalDue) as total_sales from Sales.SalesOrderHeader
where year(OrderDate) = 2011
group by datename(month, OrderDate)
order by total_sales

--f. Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'select P.firstName, P.lastName,sum(S.TotalDue) as Total_Sales from Person.Person Pjoin Sales.Customer Con P.BusinessEntityID = C.PersonIDjoin Sales.SalesOrderHeader Son S.CustomerID = C.CustomerIDWHERE P.FirstName ='Gustavo' and  P.LastName = 'Achong'group by P.firstname, P.lastname;