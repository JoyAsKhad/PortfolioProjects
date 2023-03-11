--Show entire table
Select * From PortfolioProject2..sephora_dataset
Order by Brand ASC

--How many brands are there on website?
SELECT COUNT (DISTINCT Brand) AS "Number of Sephora Brands" 
FROM PortfolioProject2..sephora_dataset;

--Show entire table
Select * From PortfolioProject2..sephora_dataset
Order by Brand ASC

--Show count of products per brand Order by Descending
Select Brand, COUNT(Name) AS "Number_of_Products"
FROM PortfolioProject2..sephora_dataset
GROUP BY Brand
Order by "Number_of_Products" Desc

--Show Top 5 brands with Max Products
Select Top 1 Brand, COUNT(Name) AS "Number_of_Products"
FROM PortfolioProject2..sephora_dataset
GROUP BY Brand
Order by "Number_of_Products" Desc

--Show Brand(s) with MAX Products 
SELECT Brand, COUNT(Name) as "Number_of_Products"
	FROM PortfolioProject2..sephora_dataset 
	GROUP by Brand
		HAVING COUNT(Name) = 
			(SELECT MAX(Number_of_Products)
				FROM(Select Brand, COUNT(Name) AS "Number_of_Products"
					FROM PortfolioProject2..sephora_dataset
					GROUP BY Brand)
			AS MAXCNT)	

--Show Brand(s) with MIN products
SELECT Brand, COUNT(Name) as "Number_of_Products"
	FROM PortfolioProject2..sephora_dataset 
	GROUP by Brand
		HAVING COUNT(Name) = 
			(SELECT MIN(Number_of_Products)
				FROM(Select Brand, COUNT(Name) AS "Number_of_Products"
					FROM PortfolioProject2..sephora_dataset
					GROUP BY Brand)
			AS MINCNT)

--Show the Average rating for each brand
Select Brand, COUNT(Name) AS  "Total_Products",
		SUM(Number_Of_Reviews) AS "Total_Customer_Reviews", 
		CAST(AVG(Rating) as decimal(10,2)) as "Avg_Product_Ratings"
FROM PortfolioProject2..sephora_dataset 
GROUP by Brand
Order by Brand ASC

Select * From PortfolioProject2..sephora_dataset
Order by Brand ASC

--Show The top three most expensive products and least expensive product
SELECT TOP 3 Brand, Name, Category, Rating, Price
FROM PortfolioProject2.. sephora_dataset
Order by price DESC

SELECT TOP 10 Brand, Name, Category, Rating, Price
FROM PortfolioProject2.. sephora_dataset
Order by price ASC

--Show Understanding of Partition by
SELECT Name, Category, COUNT(category) OVER (PARTITION BY Category) as TotalCategories
FROM PortfolioProject2..sephora_dataset
Order by Category 

Select * From PortfolioProject2..sephora_dataset

