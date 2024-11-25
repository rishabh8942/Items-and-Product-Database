--Create Databases Name :- Brands

CREATE DATABASE Brands
use Brands

--Create table in SQL Server name as ITEMS_TABLE in Brands database.
CREATE TABLE Items_table (
Item_Id int PRIMARY KEY NOT NULL,
Item_description VARCHAR(250) NOT NULL,
Vendor_nos int NOT NULL,
Vendor_name VARCHAR (50) NOT NULL,
Bottle_size int NOT NULL,
Bottle_Price DECIMAL (5,2)
);


--Insert Data in the items table

INSERT INTO Items_table(Item_ID, Item_Description, Vendor_Nos, Vendor_Name, Bottle_Size, Bottle_Price)
VALUES 
(1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77),
(2, 'D’aristi Xtabentun', 391, 'Anchor Distilling (Preiss Imports)', 750, 14.12),
(3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/Austin Nichols', 1000, 6.5),
(4, 'Oak Cross Whisky', 305, 'Mhw Ltd', 750, 25.33),
(5, 'Uv (RedCherry) Vodka', 380, 'Phillips Beverage Company', 200, 1.97),
(6, 'Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, 6.37),
(7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, 5.06),
(8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61);



--Create Databases Name :- Products

CREATE DATABASE Products
use Products

--Create table in SQL Server name as PRODUCT_TABLE in Products database.

CREATE TABLE Product_table (
    Product_Id INT PRIMARY KEY,                   
    Country VARCHAR(40) NOT NULL,                
    Product VARCHAR(20) NOT NULL,                
    Units_Sold DECIMAL(10, 2) NOT NULL,           
    Manufacturing_Price DECIMAL(10, 2) NOT NULL,  
    Sale_Price DECIMAL(10, 2) NOT NULL,          
    Gross_Sales DECIMAL(15, 2) NOT NULL,          
    Sales DECIMAL(15, 2) NOT NULL,                
    COGS DECIMAL(15, 2) NOT NULL,                
    Profit DECIMAL(15, 2) NOT NULL,              
    Sale_Date DATE NOT NULL,                     
    Month_Number INT NOT NULL,                    
    Month_Name VARCHAR(10) NOT NULL,             
    Year INT NOT NULL                             
); 


--Insert Data in the product table

INSERT INTO Product_table(Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, sale_date, Month_Number, Month_Name, Year)
VALUES
(1, 'Canada', 'Carretera', 1618.5, 3, 20, 32370, 32370, 16185, 16185, '2014-01-01', 1, 'January', 2014),
(2, 'Germany', 'Carretera', 1321, 3, 20, 26420, 26420, 13210, 13210, '2014-01-01', 1, 'January', 2014),
(3, 'France', 'Carretera', 2178, 3, 15, 32670, 32670, 21780, 10890, '2014-06-01', 6, 'June', 2014),
(4, 'Germany', 'Carretera', 888, 3, 15, 13320, 13320, 8880, 4440, '2014-06-01', 6, 'June', 2014),
(5, 'Mexico', 'Carretera', 2470, 3, 15, 37050, 37050, 24700, 12350, '2014-06-01', 6, 'June', 2014),
(6, 'Germany', 'Carretera', 1513, 3, 350, 529550, 529550, 393380, 136170, '2014-12-01', 12, 'December', 2014),
(7, 'Germany', 'Montana', 921, 5, 15, 13815, 13815, 9210, 4605, '2014-03-01', 3, 'March', 2014),
(8, 'Canada', 'Montana', 2518, 5, 12, 30216, 30216, 7554, 22662, '2014-06-01', 6, 'June', 2014);

SELECT * FROM Product_table
--. Delete those product having the Units Sold 1618.5 , 888 and 2470.

DELETE  from Product_table
WHERE Units_Sold IN('1618.5','888','2470')


--Select all records from the items_table table.
SELECT * FROM items_table

--. Select the item_description and bottle_price for all items_table table.
SELECT item_description, bottle_price from items_table

--. Find the item_description and bottle_price of items where bottle_price is greater than 20.
SELECT item_description,bottle_price 
from items_table
where bottle_price>20

--. Select Unique Country from the product_sales table
select distinct country from Product_table

--Count the number of Countries in the product_sales table
select count(country) as count_of_country
from Product_table

--How Many Countries are there which contain the sales price between 10 to 20
select count(country)
from Product_table
where Sale_Price between '10' and '20'


--------------------------------------------INTERMEDIATE-------------------------------------------------
select * from Product_table

--1. Find the Total Sale Price and Gross Sales 
SELECT SUM(SALE_PRICE) AS Total_sale_price, SUM(Gross_Sales) as Total_gross_sale
FROM Product_table

--2. In which year we have got the highest sales
select max(sales)as max_sales, year 
from Product_table
group by Year

--3. Which Product having the sales of $ 37,050.00
select product from Product_table
where Sales='37050.00'

--4. Which Countries lies between profit of $ 4,605 to $ 22 , 662.00
select country from Product_table
where Profit between '4605' and '22662.00'

--5. Which Product Id having the sales of $ 24 , 700.00
select product_id from Product_table
where Sales='24700'

--6. Find the total Units Sold for each Country.
select sum(units_sold) as total_unit_sold, Country 
from Product_table
group by Country

--7. Find the average sales for each country
select avg(sales) as avg_sales, Country
from Product_table
group by Country

--8. Retrieve all products sold in 2014
select product from Product_table
where Year='2014'

--9. Find the maximum Profit in the product_sales table.
select max(profit) as max_profit
from Product_table

--10. Retrieve the records from product_sales where Profit is greater than the average Profit of all records.
select * from Product_table
where Profit>(select avg(Profit) from Product_table)

--11. Find the item_description having the bottle size of 750
select item_description from items_table
where bottle_size='750'

--12. Find the vendor Name having the vendor_nos 305 , 380 ,391
select vendor_name from items_table
where vendor_nos in ('305','380','391')

--13. What is total Bottle_price 
select sum(bottle_price) as total_bottle_price 
from items_table

--14. Make Primary Key to Item_id
alter table items_table
add primary key(Item_Id)

--15. Which item id having the bottle_price of $ 5.06
select item_id from items_table
where bottle_price='5.06'



----------------------------------------------ADVANCE QUESTIONS----------------------------------


--1. Apply INNER , FULL OUTER , LEFT JOIN types on both the table 

SELECT 
    p.product_id, 
    i.item_id
FROM 
    [Products].[dbo].[Product_table] p
INNER JOIN 
    [Brands].[dbo].[Items_table] i ON p.[Product_Id] = i.[Item_Id];

SELECT 
    p.product_id, 
    i.item_id
FROM 
    [Products].[dbo].[Product_table] p
FULL OUTER JOIN 
    [Brands].[dbo].[Items_table] i ON p.[Product_Id] = i.[Item_Id];

	SELECT 
    p.product_id, 
    i.item_id
FROM 
    [Products].[dbo].[Product_table] p
LEFT JOIN 
    [Brands].[dbo].[Items_table] i ON p.[Product_Id] = i.[Item_Id];

	
	--2. Find the item_description and Product having the gross sales of 13,320.00.
	SELECT 
	i.item_description,
	p.Product
	FROM
	[Brands].[dbo].[Items_table] i
	join
	[Products].[dbo].[Product_table] p on p.[Gross_Sales]=i.[Item_description]
	where p.Gross_Sales='13320.00'

--3. Split the Item_description Column into Columns Item_desc1 and Item_desc2
SELECT item_id,
left(item_description, charindex(' ', item_description)-1) as iten_desc1,
ltrim(right(item_description,len(item_description)-charindex(' ',item_description))) as item_desc2
from items_table

--4. Find the top 3 most expensive items in the bottle_info table.
select top 3
bottle_price 
from items_table
order by bottle_price desc

--5. Find the total Gross Sales and Profit for each Product in each Country.
select product,country,sum(gross_sales) as total_gross_sale, sum(profit) as total_profit
from Product_table
group by product,Country

--6. Find the vendor_name and item_description of items with a bottle_size of 750 and bottle_price less than 10.
select vendor_name, item_description
from items_table
where bottle_size='750' and bottle_price<10

--7. Find the Product with the highest Profit in 2014.
select top 1
product, Profit
from Product_table
where Year='2014'
order by Product desc

--8. Retrieve the Product_Id and Country of all records where the Profit is at least twice the COGS.
select product_id, country
from Product_table
where Profit >=2*COGS

--9. Find the Country that had the highest total Gross Sales in 2014
select top 1 
country,sum(gross_sales) as total_gross_sale
from Product_table
where Year='2014'
group by Country
order by Country desc

--10. Calculate the total Sales for each Month Name across all years.
select month_name , year, sum(sales) as total_sales
from Product_table
group by month_name,Year;

--11. List the item_description and vendor_name for items whose vendor_nos exists more than once in the items_table table.
select item_description, vendor_name
from items_table 
where vendor_nos in (
select vendor_nos
from items_table 
group by vendor_nos having count(vendor_nos)>1)

--12. Find the average Manufacturing Price for Product in each Country and 
--only include those Country and Product combinations where the average is above 3
select avg(manufacturing_price) as avg_manu_price,product,country
from Product_table
group by Product,Country
having avg(Manufacturing_Price)>3



------------------------------------------Super-Advance Questions:------------------------------------------



--1. Find the item_description and bottle_price of items that have the same vendor_name as items with Item_Id 1.
SELECT item_description, bottle_price
from items_table
where vendor_name=(select vendor_name from items_table where item_id=1)

--2. Create a stored procedure to retrieve all records from the items_table table where bottle_price is greater than a given value
create procedure sp_record
@price decimal(10,2)
as
begin
select * from items_table
where bottle_price > @price
end

exec sp_record @price=10

--3. Create a stored procedure to insert a new record into the product_sales table.
create procedure new_record
  @Product_Id INT,                   
    @Country VARCHAR(40),                
    @Product VARCHAR(20),                
    @Units_Sold DECIMAL(10, 2),           
    @Manufacturing_Price DECIMAL(10, 2),  
    @Sale_Price DECIMAL(10, 2),          
    @Gross_Sales DECIMAL(15, 2),          
    @Sales DECIMAL(15, 2),                
    @COGS DECIMAL(15, 2),                
   @Profit DECIMAL(15, 2),              
    @Sale_Date DATE ,                     
    @Month_Number INT ,                    
    @Month_Name VARCHAR(10),             
    @Year INT   
as
begin
INSERT INTO Product_table(Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, sale_date, Month_Number, Month_Name, Year)
values(@product_id,@country,@product,@units_sold,@manufacturing_price,@sale_price,@gross_sales,@sales,@cogs,@profit,@sale_date,@month_number,@month_name,@year)
end

--4. Create a trigger to automatically update the Gross_Sales field in the product_sales table whenever Units_Sold or Sale_Price is updated.
create trigger update_gross_sale
on product_table
after update
as
begin
update Product_table
set Gross_Sales=inserted.units_sold * inserted.sale_price
from inserted
where Product_table.Product_Id=inserted.Product_Id
end

--5. Write a query to find all item_description in the items_table table that contain the word "Whisky" regardless of case.
select item_description
from items_table
where Item_description like '%whisky%'

--6. Write a query to find the Country and Product where the Profit is greater than the average Profit of all products.
select country,product
from Product_table 
where Profit>(select avg(Profit) from Product_table)

--7. Write a query to join the items_table and product_table tables on a common field
--(e.g., vendor_nos) and select relevant fields from both tables.


 
 select * from [Brands].[dbo].[Items_table]
 select * from Product_table

 --8. Write a query to combine item_description and vendor_name into a single string for each record in the items_table table, separated by a hyphen.
 select CONCAT(item_description,'-',vendor_name)as itemdscription_vendorname
 from Items_table

 --9. Write a query to display the bottle_price rounded to one decimal place for each record in the items_table table.
 select cast(round(bottle_price,1) as decimal(10,1))as rounded_bottle_price
 from Items_table

 --10. Write a query to calculate the number of days between the current date and the Date field for each record in the product_sales table.
 select product_id, product, sale_date,
 datediff(Day, sale_date, getdate()) as days_between
 from product_table










