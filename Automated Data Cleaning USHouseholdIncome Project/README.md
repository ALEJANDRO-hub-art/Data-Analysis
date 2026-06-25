# 📊 **Automated Data Cleaning US Household Income Project**


📘 **Project Overview**

This project focuses on automating data cleaning and standardization within a MySQL environment using:

- Stored Procedures
- Events (scheduled automation)
- Triggers (automatic execution on data change)

The goal is to take a raw dataset (us_household_income) and automatically:

- copy it into a cleaned version
- remove duplicate records
- standardize inconsistent text values
- maintain ongoing data quality without manual effort
- allow future inserts to be processed automatically

The script builds a fully automated pipeline where MySQL handles data cleaning internally, reducing the need for external tools or repeated manual SQL execution. 


🧩 **Business Problem**

Real-world datasets—especially large demographic or government data like U.S. Household Income—commonly suffer from:

- duplicated rows
- inconsistent text formatting
- misspellings
- structural issues
- manual reporting delays
- repeated cleaning effort

**Without automation:**

- analysts repeatedly clean the same data
- reports become inconsistent
- errors propagate into dashboards and models
- manual labor increases cost and time

The business need is:
- a reliable, repeatable, automated process that ensures the dataset is always clean and standardized before use in analytics, reporting, machine learning, or integration pipelines.

⚙️ **Tech Stack**

MySQL Database

**Used for:**
- data storage
- transformation
- automation logic

**Stored Procedures**

- Automate multi-step cleaning operations:
- create cleaned table
- copy data
- remove duplicates
- standardize values

**Events (MySQL Scheduler)**

- Automated recurring execution: Ensures the dataset stays updated without user intervention. The schedule is every 30 days.

**Triggers**

- Automatically run logic when data is inserted, updated or deleted (initially attempted).
- They are often used for auditing (who changed what and when), preventing deletes or updates, history tracking.

🔍 **What the Code Does (Step-by-Step with Reasoning)**

**1. Create a Stored Procedure**
The procedure Copy_and_Clean_Data() builds the automation logic.

It:
- creates a cleaned table if it doesn't exist
- copies all raw data into it
- adds a timestamp
- prepares the dataset for cleaning

This allows repeatable execution without rewriting SQL.

**2. Remove Duplicates**

The script identifies duplicates.

Reasoning:
- keeps the latest version of a record
- ensures unique identifiers
- prevents inflated counts in analysis

**3. Standardization**

Multiple UPDATE statements fix:
- misspellings (example: georia → Georgia)
- inconsistent casing (uppercasing text fields)
- incorrect category values (example: CPD → CDP, Boroughs → Borough)

Reasoning:
- Ensures that all data follows a consistent format and scale, making features comparable, reducing bias, and improving model accuracy and interpretability.

**4. Turns off MySQL’s safety mode**
- This prevents you from accidentally running dangerous UPDATE or DELETE statements.

**5. Execute you Store Procedure**
- This line of code executes your stored procedure.

**6. Turn ON the event scheduler (prior to execute the Event)**
- MySQL will NOT run Events unless the scheduler is enabled.

**7. Create the EVENT → Scheduled Automation**
- So this EVENT will be every 30 days and the event is going to run the Stored Procedure.

**8. Create the TRIGGER → Trigger Attempt**
- This is a SQL code that runs automatically whenever a row is INSERTED, UPDATED, or DELETED-without requiring manual execution. These are known as triggers, and they fire in response to INSERT, UPDATE, or DELETE actions. Triggers are commonly used for auditing changes (tracking who modified data and when), blocking unauthorized updates or deletions, and maintaining historical records.

**9. Drop the TRIGGER**
- As our last step is INSERTING VALUES into the 'us_household_income' Table, the inserting will fail as long as the TRIGGER is active. Thats why we drop the TRIGGER in this step.

**10. Insert values into the Table**
- INSET VALUES into the Table 'us_household_income'. In here we are inserting values in every column of the Table except for the TimeStamp column.

**11. Validate Insert**
- Once the trigger was removed, a test was performed and verified if the values in step 10 were inserted into the Table 'us_household_income'.

🏁 **Conclusion**

This project successfully builds a fully automated data cleaning pipeline within MySQL, leveraging:
- stored procedures for repeatable logic
- events for scheduled automation
- triggers (evaluated but removed due to constraints)

The result:
- clean, standardized, duplicate-free data
- automation that runs without user interaction
- reduced operational effort
- improved data reliability for analysis


