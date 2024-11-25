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
(2, 'D�aristi Xtabentun', 391, 'Anchor Distilling (Preiss Imports)', 750, 14.12),
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
    p.product_id, 
    i.item_id
FROM 
    [Products].[dbo].[Product_table] p
INNER JOIN 
    [Brands].[dbo].[Items_table] i ON p.[Product_Id] = i.[Item_Id];
    p.product_id, 
    i.item_id
FROM 
    [Products].[dbo].[Product_table] p
FULL OUTER JOIN 
    [Brands].[dbo].[Items_table] i ON p.[Product_Id] = i.[Item_Id];
    p.product_id, 
    i.item_id
FROM 
    [Products].[dbo].[Product_table] p
LEFT JOIN 
    [Brands].[dbo].[Items_table] i ON p.[Product_Id] = i.[Item_Id];
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
