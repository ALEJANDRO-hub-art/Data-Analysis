##################################################################################
# The following script is a Exploratory Data Analysis Project


SELECT * FROM world_life_expectancy.world_life_expectancy;


#We execute this code and we see in the Output that some countries
#have 0 in their MIN and MAX.
SELECT Country, MIN(Life_expectancy), MAX(Life_expectancy)
FROM world_life_expectancy
GROUP BY Country
ORDER BY Country DESC
;

#HAVING a MIN (‘Life expectancy’) and a MAX (‘Life expectancy’) not equal to 0.
SELECT Country, MIN(Life_expectancy), MAX(Life_expectancy)
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(Life_expectancy) <> 0 
AND MAX(Life_expectancy) <> 0
ORDER BY Country DESC
;


#We execute the following code the same as the previous one adding the following:
#MAX(`Life expectancy`) - MIN(`Life expectancy`) as a column in the Ouput
SELECT Country,
MIN(Life_expectancy),
MAX(Life_expectancy),
MAX(Life_expectancy) - MIN(Life_expectancy)
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(Life_expectancy) <> 0 
AND MAX(Life_expectancy) <> 0
ORDER BY Country DESC
;

#Now the ROUND up the last column in the Output, the one named Life_Increase_15_Years
SELECT Country,
MIN(Life_expectancy),
MAX(Life_expectancy),
ROUND(MAX(Life_expectancy) - MIN(Life_expectancy),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(Life_expectancy) <> 0 
AND MAX(Life_expectancy) <> 0
ORDER BY Country DESC
;


#Now we execute the last code but this time ORDER BY Life_Increase_15_Years DESC
SELECT Country,
MIN(Life_expectancy),
MAX(Life_expectancy),
ROUND(MAX(Life_expectancy) - MIN(Life_expectancy),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(Life_expectancy) <> 0 
AND MAX(Life_expectancy) <> 0
ORDER BY Life_Increase_15_Years DESC
;

#Now we execute the same code but now this time in ASC - ORDER BY Life_Increase_15_Years ASC -
#Remember that using HAVING is used only for aggregate functions.
SELECT Country,
MIN(Life_expectancy),
MAX(Life_expectancy),
ROUND(MAX(Life_expectancy) - MIN(Life_expectancy),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(Life_expectancy) <> 0 
AND MAX(Life_expectancy) <> 0
ORDER BY Life_Increase_15_Years ASC
;

#Lets get the YEar and AVG(Life_expectancy)
SELECT Year, AVG(Life_expectancy)
FROM world_life_expectancy
GROUP BY Year
ORDER BY Year
;

#We execute the same code but this time we ROUND up to two decimal places
SELECT Year, ROUND(AVG(Life_expectancy),2)
FROM world_life_expectancy
GROUP BY Year
ORDER BY Year
;

#Query not for zeros Life expectancy - WHERE `Life expectancy` <> 0 (meaning NOT EQUAL to 0)
SELECT Year, ROUND(AVG(Life_expectancy),2)
FROM world_life_expectancy
WHERE Life_expectancy <> 0
GROUP BY Year
ORDER BY Year
;

SELECT Country, Life_expectancy, GDP
FROM world_life_expectancy
;

#Lets ROUND Life_expectancy and GDP and change the names of the columns
SELECT Country, ROUND(AVG(Life_expectancy),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
;

#We execute the same code as before but now we add ORDER BY Life_Exp ASC
#After executing it we see in the Output that we have a lot that have 0 Life Expectancy and
#also for GDP we have 0.0 as well
SELECT Country, ROUND(AVG(Life_expectancy),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
ORDER BY Life_Exp ASC
;

#Now we filter for those Life_Exp and GDP greater than '0' (zero)
#and ORDER BY Life_Exp ASC
SELECT Country, ROUND(AVG(Life_expectancy),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND GDP > 0
ORDER BY Life_Exp ASC
;

#Now we execute the same code as above but now we ORDER BY GDP ASC
#Lower GDP correlates with lower Life Expectancy. This is the 
#Exploratory Data Analysis or EDA.
SELECT Country, ROUND(AVG(Life_expectancy),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND GDP > 0
ORDER BY GDP ASC
;

#The we do the same code by ORDER BY GDP DESC
SELECT Country, ROUND(AVG(Life_expectancy),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND GDP > 0
ORDER BY GDP DESC
;

SELECT *
FROM world_life_expectancy
ORDER BY GDP
;

SELECT 
CASE
	WHEN GDP >= 1500 THEN 1
    ELSE 0
END High_GDP_Count
FROM world_life_expectancy
;

#In the following code we do a SUM of the CASE to count - So we have 
#1326 rows of data with GDP >= 1500 
SELECT 
SUM(CASE
	WHEN GDP >= 1500 THEN 1
    ELSE 0
END) High_GDP_Count
FROM world_life_expectancy
;


#Here is the AVG of the Life Expectancy (when is has a value 
#and when its 0) when the GDP > 1500.
#This query analyzes records in the world_life_expectancy table and returns:
#The number of countries (or rows) where GDP is 1500 or higher.
#The average life expectancy of those countries (or rows) with GDP ≥ 1500.
SELECT
SUM(CASE WHEN GDP >=1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG(CASE WHEN GDP >=1500 THEN Life_expectancy ELSE 0 END) High_GDP_Life_Expectancy
FROM world_life_expectancy
;

#This SQL query calculates:
#The number of entries (countries or records) where the GDP is 1500 or more.
#The average life expectancy only for those entries with GDP ≥ 1500.
#Let’s do NULL as the zeros ‘0’ are affecting the AVG.
#In the following code we do NULL instead of 0 because that is affecting 
#our calculations (to avoid incorrect results)?
SELECT
SUM(CASE WHEN GDP >=1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG(CASE WHEN GDP >=1500 THEN Life_expectancy ELSE NULL END) High_GDP_Life_Expectancy
FROM world_life_expectancy
;


#Now we are doing:
#Low_GDP_Count when SUM of GDP <= 1500.
#High_GDP_Count when AVG of GDP >= 1500 then we have a value for Life Expectancy and NULL
# instead of zeros because using '0' throw of our calculations
#We see in the Output that 1326 Countries with High_GDP and 1612 Countries with Low_GDP, and look at
#their Life Expectancies. 
#So High_GDP countries have a higher Life Expectancy than those countries where
# there is a Low_GDP.
#We see a high Correlation between High_GDP and High_GDP_Life_Expectancy.
SELECT
SUM(CASE WHEN GDP >=1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG(CASE WHEN GDP >=1500 THEN Life_expectancy ELSE NULL END) High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP <=1500 THEN 1 ELSE 0 END) Low_GDP_Count,
AVG(CASE WHEN GDP <=1500 THEN Life_expectancy ELSE NULL END) Low_GDP_Life_Expectancy
FROM world_life_expectancy
;

#We execute the following code and we see in the Output that Developed
#countries have a higher Life Expectancy.
SELECT Status, ROUND(AVG(Life_expectancy),1)
FROM world_life_expectancy
GROUP BY Status
;

#COUNT(DISTINCT Country) meaning count the unique names of countries.
#In the Output we see '32 Countries that are Developed' and '162 Countries that
#are Developing'
SELECT Status, COUNT(DISTINCT Country)
FROM world_life_expectancy
GROUP BY Status
;

#We execute the following code and we see in the Output 
#Interesting insights that we find in the values between
#the Developed and Developing countries data.
#We see that in Developed countries the Life Expectancy is 79.2' and in Developing
#countries the Life Expectancy is 66.8 in other words "In other words, people in Developed
# countries live significantly longer on average than those in Developing countries."
SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(Life_expectancy),1)
FROM world_life_expectancy
GROUP BY Status
;

#We execute the following code and we see in the Output that - BMI (Body Mass Index) - Higher 
#BMI are keen to heart attacks and dying early. 
SELECT Country, ROUND(AVG(Life_expectancy),1) AS Life_Exp, ROUND(AVG(BMI),1) AS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND BMI > 0
ORDER BY BMI DESC
;

#Lets do the same code but now do ORDER BY BMI ASC
SELECT Country, ROUND(AVG(Life_expectancy),1) AS Life_Exp, ROUND(AVG(BMI),1) AS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND BMI > 0
ORDER BY BMI ASC
;

#Remember that:
#PARTITION BY Country
#This divides the dataset into groups by country.
#The running sum is reset for each country.
#SUM(Adult_Mortality) OVER(PARTITION BY Country ORDER BY Year) This creates a running 
#cumulative total of adult mortality for each country over time.
#Think of it as: Year 1: total so far; Year 2: total of year 1 + year 2; Year 3: total of year 1 + year 2 + year 3
#The insight analysis: While Afghanistan shows improving yearly adult mortality rates, the
# cumulative mortality remains high, reflecting ongoing health and socioeconomic challenges.
SELECT Country,
Year,
Life_expectancy,
Adult_Mortality,
SUM(Adult_Mortality) OVER(PARTITION BY Country ORDER BY Year)
FROM world_life_expectancy
;

#Do the same code but this time give the aliase of Rolling_Total
#We see in the Output that Rolling_Total adds 1st row 321 and then 
#the 2nd row 316 = 637. And so on through the subsequent rows.
SELECT Country,
Year,
Life_expectancy,
Adult_Mortality,
SUM(Adult_Mortality) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
;

#A rolling total, also known as a running total or cumulative sum, 
#is a calculation that progressively sums values across a dataset based
#on a specific ordering, usually by date or time. It is often used to 
#track performance or trends over time by calculating the cumulative sum at each point in the dataset. 
#Insight Analysis: The United Arab Emirates shows a strong positive health trend, with
# increasing life expectancy and consistently low adult mortality rates, indicating an 
#effective healthcare system and improving living conditions over time.
SELECT Country,
Year,
Life_expectancy,
Adult_Mortality,
SUM(Adult_Mortality) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
WHERE Country LIKE '%United%'
;


