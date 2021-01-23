--1.Write a select statement to return all columns and rows from the customer table.
select * from customer  

--2.Write a query to select first name, last name, and email from the customer table.
select first_name, last_name, email  
from customer

--3.Write a query to return all rows and columns from the film table.
select * from film  

--4.Write a query to return unique rows from the release_year column in the film table.
select distinct release_year from film  

--5.Write a query to return unique rows from the rental_rate column in the film table
select distinct rental_rate from film  

--6.A customer left us some feedback about our store.  Write a query to find her email address – for Nancy Thomas.
select email from customer 
where first_name = 'Nancy' and last_name = 'Thomas'

--7.We’re trying to find a customer located at a certain address ‘259 Ipoh Drive’ – can you find their phone number? 
select address, phone from address  
where address = '259 Ipoh Drive'

--8.Write a query from the customer table, where store id is 1 and address id is greater than 150.
select store_id, address_id from customer  
where store_id = '1' and address_id > '150'

--9.Write a query from the payment table where the amount is either 4.99 or 1.99.
select * from payment  
where amount = '4.99' or amount = '1.99'

--10.Write a query to return a list of transitions from the payment table where the amount is greater than 5.
select * from payment 
where amount > '5'