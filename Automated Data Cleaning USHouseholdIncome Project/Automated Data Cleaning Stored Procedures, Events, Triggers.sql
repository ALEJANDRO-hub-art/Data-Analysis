SELECT * FROM us_household_income.ushouseholdincome;

-- FIRST STEP
-- WHAT STORE PROCEDURES DO: create a table, insert data, remove duplicates, standardize values
-- THEY ALLOW YOU TO DO: automate repetitive tasks, clean and transform data automatically, improve performance (precompiled)
--                       enforce business rules, reduce errors, secure database logic.



DELIMITER $$

DROP PROCEDURE IF EXISTS Copy_and_Clean_Data $$

CREATE PROCEDURE Copy_and_Clean_Data()
BEGIN
-- CREATING OUR TABLE
	CREATE TABLE IF NOT EXISTS `us_household_income_Cleaned` (
	  `row_id` int DEFAULT NULL,
	  `id` int DEFAULT NULL,
	  `State_Code` int DEFAULT NULL,
	  `State_Name` text,
	  `State_ab` text,
	  `County` text,
	  `City` text,
	  `Place` text,
	  `Type` text,
	  `Primary` text,
	  `Zip_Code` int DEFAULT NULL,
	  `Area_Code` int DEFAULT NULL,
	  `ALand` int DEFAULT NULL,
	  `AWater` int DEFAULT NULL,
	  `Lat` double DEFAULT NULL,
	  `Lon` double DEFAULT NULL,
	  `TimeStamp` TIMESTAMP DEFAULT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- COPY DATA TO NEW TABLE
INSERT INTO us_household_income_Cleaned (
    row_id, id, State_Code, State_Name, State_ab,
    County, City, Place, `Type`, `Primary`,
    Zip_Code, Area_Code, ALand, AWater,
    Lat, Lon, TimeStamp
)
SELECT 
    row_id, id, State_Code, State_Name, State_ab,
    County, City, Place, `Type`, `Primary`,
    Zip_Code, Area_Code, ALand, AWater,
    Lat, Lon, CURRENT_TIMESTAMP
FROM us_household_income;

-- Data Cleaning Steps

	-- 1. Remove Duplicates
DELETE FROM us_household_income_Cleaned
WHERE row_id IN (
    SELECT row_id FROM (
        SELECT row_id,
               ROW_NUMBER() OVER (
                   PARTITION BY id
                   ORDER BY `TimeStamp`
               ) AS row_num
        FROM us_household_income_Cleaned
    ) t
    WHERE row_num > 1
);

	-- 2. Standardization
	UPDATE us_household_income_Cleaned
	SET State_Name = 'Georgia'
	WHERE State_Name = 'georia';

	UPDATE us_household_income_Cleaned
	SET County = UPPER(County);

	UPDATE us_household_income_Cleaned
	SET City = UPPER(City);

	UPDATE us_household_income_Cleaned
	SET Place = UPPER(Place);

	UPDATE us_household_income_Cleaned
	SET State_Name = UPPER(State_Name);

	UPDATE us_household_income_Cleaned
	SET `Type` = 'CDP'
	WHERE `Type` = 'CPD';

	UPDATE us_household_income_Cleaned
	SET `Type` = 'Borough'
	WHERE `Type` = 'Boroughs';

END $$

DELIMITER ;

-- SECOND STEP
-- THESE TWO GO TOGETHER
-- This command turns off MySQL’s safety mode that prevents you from accidentally 
-- running dangerous UPDATE or DELETE statements.
SET SQL_SAFE_UPDATES = 0;

-- THIRD STEP
-- This line executes your stored procedure.
CALL Copy_and_Clean_Data();

-- FOURTH STEP
SET GLOBAL event_scheduler = ON;
DELIMITER $$

-- FIFTH STEP
-- CREATE EVENT: Events are a scheduled piece of SQL code stored in the database 
-- 				that runs automatically at a specific time or interval
-- So this event will be every 30 days and the event is running the STORED PROCEDURE
DELIMITER $$

DROP EVENT IF EXISTS run_data_cleaning $$

CREATE EVENT run_data_cleaning
ON SCHEDULE EVERY 30 DAY
DO
BEGIN
    CALL Copy_and_Clean_Data();
END $$

DELIMITER ;

-- SIXTH STEP
-- CREATE THE TRIGGER: SQL code that executes automatically when a row is INSERTED, 
--                     UPDATED, or DELETED without you manually running it; so triggers
--                     activate on: INSERT, UPDATE, DELETE. They are often used for
--                     auditing (who changed what and when), preventing deletes or updates,
--                     history tracking.
DELIMITER $$
CREATE TRIGGER Transfer_clean_data
AFTER INSERT ON us_household_income.us_household_income
FOR EACH ROW
BEGIN
    CALL Copy_and_Clean_Data();
END $$
DELIMITER ;

-- SEVENTH STEP
-- Insert values into the columns of the Table.
-- Remember that you created a TRIGGER. Triggers in MySQL are NOT allowed to execute code
-- that: creates tables (CREATE TABLE), drops tables, inserts into the same table (THIS IS
-- WHAT YOU ARE DOINT IN THIS STEP, SO WHEN YOU RUN THE CODE TO INSERT VALUES IT WILL GIVE
-- YOU AN ERROR. THE SOLUTION IS TO DROP THE TRIGGER), deletes rows, updates many rows.
-- So lets drop the triggers first and then run the code to INSERT values in the Table.

DROP TRIGGER IF EXISTS Transfer_clean_data;

-- Now we drop the trigger when can INSERT VALUES into the Table and not get any errors.
INSERT INTO us_household_income.us_household_income
(`row_id`,`id`,`State_Code`,`State_Name`,`State_ab`,`County`,`City`,`Place`,`Type`,`Primary`,`Zip_Code`,`Area_Code`,`ALand`,`AWater`,`Lat`,`Lon`)
VALUES
(121671,37025904,37,'North Carolina','NC','Alamance County','Charlotte','Alamance','Track','Track',28215,980,24011255,98062070,35.2661197,-80.6865346);


-- Lets do a test, run the following code.... this is the first VALUE we inserted into 
-- us_household_income.us_household_income, after running it we could see our VALUE in
-- the Output.

SELECT *
FROM us_household_income.us_household_income
WHERE row_id = 121671;