
# We donduct a COUNT to see if we imported all of the rows from the CSV file, and we
# did.... a total of 2941 rows
SELECT COUNT(*)
FROM world_life_expectancy;

# Notice that we have some some NULLS in some cells
SELECT * FROM world_life_expectancy.world_life_expectancy;

#We may have duplicates here, look at the next code that cheks for duplicates
SELECT Country, Year, concat(Country, Year)
FROM world_life_expectancy
;

#Use the count function and see if any of the rows count to 2 (that will signal a duplicate)
#After running the code we see that we have 3 countries with duplicates
SELECT Country, Year, concat(Country, Year), count(concat(Country, Year))
FROM world_life_expectancy
group by Country, Year, concat(Country, Year)
HAVING count(concat(Country, Year)) > 1
;

#Lets identify the Row_iD of those duplicates
SELECT *
FROM (
	SELECT Row_ID,
    CONCAT(Country, Year),
    ROW_NUMBER() OVER( PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) as Row_Num
    FROM world_life_expectancy
    ) AS Row_Table
WHERE Row_Num > 1
;

#Your logic is sound, but the error you're seeing — Error 1175 — is happening because MySQL’s Safe Update Mode is 
#preventing a DELETE that doesn't use a key column directly in the outer WHERE.
#Let’s go step by step to fix this. 
#Add the following line before your query to disable safe update mode for this session:
SET SQL_SAFE_UPDATES = 0;

#Lets make the deletion now
DELETE FROM world_life_expectancy
WHERE
	Row_ID IN (
    SELECT Row_ID
FROM (
	SELECT Row_ID,
    CONCAT(Country, Year),
    ROW_NUMBER() OVER( PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) as Row_Num
    FROM world_life_expectancy
    ) AS Row_Table
WHERE Row_Num > 1 
)
;

#Lets chech if it was deleted, We checked in the Action Output and 3 rows were affected
# so it worked.
# After running the following code the Output was blank meaning now duplicates
SELECT *
FROM (
	SELECT Row_ID,
    CONCAT(Country, Year),
    ROW_NUMBER() OVER( PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) as Row_Num
    FROM world_life_expectancy
    ) AS Row_Table
WHERE Row_Num > 1
;


#lets check how many BLANKs and NULLs we have. WHERE Status = BLANKs ‘ ‘.
#After running the code we didnt see anything at the Output so we have no BlANKS
#at all in teh dataset
SELECT *
FROM world_life_expectancy
WHERE Status = ''
;


#Now lets check to see if we have NULL values.
#After running the code we see that we have a lot of NUll values in the Status column
SELECT *
FROM world_life_expectancy
WHERE Status IS NULL;

#Here we are calling for DISTINCT (Status), meaning unique names 
#of Status (we have either ‘Developing’ or ‘Developed’); 
#where the Status is '<>' meaning NOT EQUAL to BLANK  ‘ ‘, dont leave 
#space between the quotes, write it like ''.
SELECT DISTINCT(Status)
FROM world_life_expectancy
WHERE Status <> ''
;

#In here SELECT DISTINCT (unique names of Countries), WHERE the Status is ‘Developing’.
SELECT DISTINCT(Country)
FROM world_life_expectancy
WHERE Status = 'Developing'


# In this code we set the Status to 'Developing' where the Status is BLANK or NULL
UPDATE world_life_expectancy
SET Status = 'Developing'
WHERE Status = '' OR Status IS NULL;

#This is another way of doing it using a SELF JOIN.
#Here if there are any BLANKS they should be populated.
#SET t1.Status to Developing WHERE t1.Status is BlANK’ and SET t2.Status where
#is not BLANK to ‘Developing’ (this is where we have NULLs) and SET t2.Status 
#to ‘Developing’ where is equal to ‘Developing’.
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developing'

#Lets do a check up now:
#Here we run the code and did see anything in the Output where the Status is BLANK
SELECT *
FROM world_life_expectancy
WHERE Status = ''
;

#Lets do a check for NULLS and BLANKS together now
#After running this code we didnt see anything at the Output so we are good
SELECT *
FROM world_life_expectancy
WHERE Status = ''
   OR Status IS NULL;


# We see in the Output that we have blanks for 'life expectancy'
#After running the code we see NULL values for Albania and Afghanistan
SELECT *
FROM world_life_expectancy
WHERE Life_expectancy = ''
   OR Life_expectancy IS NULL;


#We run this code and list lists all of the data. We see the for Afghanistan '2017 we have
#a value', for '2018 is NULL' and for '2019 we have a value'. So from 2017 to 2019 increases
#steadily 
SELECT *
FROM world_life_expectancy;

#What we are going to do is the following:
#Look that the values of this 'life expectancy' column increase steadily. So get the next year 
#and the previous year values and populate the BLANK with the average of the two.
SELECT t1.Country, t1.Year, t1.Life_expectancy, t2.Country, t2.Year, t2.Life_expectancy
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1

#Lets add The t3.Year + 1 is the next year. We execute the code and we saw in the Output
# that we had some BLANKS  
SELECT t1.Country, t1.Year, t1.Life_expectancy,
t2.Country, t2.Year, t2.Life_expectancy,    
t3.Country, t3.Life_expectancy
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
;


#Lets paste the same code but adding the WHERE statement at the end where 'Life expectancy'
# is BLANK or NULL, we run it and we see that we have BLANKS for Afghanistan and Albania
#This is all the data that we need in order to populate the BLANKS and NULLs so remember that we are
#taking the average value of the next and previous year.
SELECT 
    t1.Country, t1.Year, t1.Life_expectancy,
    t2.Country, t2.Year, t2.Life_expectancy,
    t3.Country, t3.Year, t3.Life_expectancy
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
    ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
WHERE t1.Life_expectancy IS NULL
    OR t1.Life_expectancy = '';

#ROUND it to one decimal point 
#Add this line --ROUND(t2.`Life expectancy`+ t3.`Life expectancy`)/2,1) in here we sum t2 and t3 and divide 
#by 2 then we round to one decimals points--  to the previous code 
#to round it out.
SELECT 
    t1.Country, t1.Year, t1.Life_expectancy,
    t2.Country, t2.Year, t2.Life_expectancy,    
    t3.Country, t3.Life_expectancy,
    ROUND((t2.Life_expectancy + t3.Life_expectancy) / 2, 1) AS Filled_Value
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
    ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
WHERE t1.Life_expectancy IS NULL
    OR t1.Life_expectancy = '';
# After running the above code we see a new column called 'Filled_Value' and we see that
# for Afghanistan we have a value of 59.2 and for Albania we have a value of 76.6

#Now that we have the values in the Filled_Value column lets do the UPDATE and SET (meaning
#is now time to populate table 1 where we have BLANKS or NULL values)
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
    ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
    ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1
SET t1.Life_expectancy = ROUND((t2.Life_expectancy + t3.Life_expectancy)/2,1)
WHERE t1.Life_expectancy IS NULL
   OR t1.Life_expectancy = '';

#We run this code to see if we have BLANKS or NULL values and we see in the Output
# that they were removed.

SELECT Country, Year, Life_expectancy
FROM world_life_expectancy
WHERE Life_expectancy IS NULL
   OR Life_expectancy = '';
# With the above code we see in the Output values of '0' (zero), lets run the following 
#code for looking at NULL values only

#Lets check for NULL values. After running it we see in the Output no NULL values found.
SELECT Country, Year, Life_expectancy
FROM world_life_expectancy
WHERE Life_expectancy IS NULL;



