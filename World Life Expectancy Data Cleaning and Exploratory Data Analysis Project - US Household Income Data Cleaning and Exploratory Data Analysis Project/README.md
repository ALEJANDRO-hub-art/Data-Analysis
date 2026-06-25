# 📊 **World Life Expectancy Data Cleaning and Exploratory Data Analysis Project**

📌 **Project Overview**

This project analyzes the World Life Expectancy dataset, which contains yearly health and socioeconomic indicators for countries around the world. The dataset includes key metrics such as life expectancy, adult mortality rates, infant deaths, GDP, disease prevalence (Measles, Polio, HIV/AIDS), nutrition indicators, and schooling levels.

The goal of the project is to:

- Clean and prepare the dataset by removing duplicates, handling missing and null values
- Explore global health trends across time
- Identify relationships between economic conditions and life expectancy
- Compare developed vs developing countries
- Uncover insights that explain differences in public health outcomes

By combining data cleaning, exploratory analysis, and SQL-based calculations, this project provides a clearer understanding of the factors that influence life expectancy worldwide.

🧩 **Business Problem**

Global organizations, governments, and healthcare policy groups struggle with:

- uneven access to healthcare resources
- rising mortality rates in developing regions
- limited understanding of what factors most strongly impact life expectancy
- data quality problems that prevent accurate reporting and decision-making

Without reliable analysis, policymakers cannot:

- Target interventions effectively
- Allocate funding efficiently
- Evaluate the impact of health programs
- Prioritize high-risk populations

This project addresses the problem by:

- Cleaning inaccurate or incomplete health records
- Identifying patterns in life expectancy and mortality
- Linking economic indicators (such as GDP and schooling) to health outcomes
- Highlighting disparities between developed and developing nations

These insights help guide data-driven public health strategies and investment decisions.

🛠️ **Tech Stack**


✅ MySQL / SQL

Used for:

- Storing the cleaned dataset
- Querying and aggregating health indicators
- Identifying missing values

calculating:

- Averages
- Rolling totals
- Country-level comparisons
- GDP-based life expectancy patterns


📈🧮 **Overview of Findings**

The SQL analysis reveals:

- Life expectancy varies significantly across countries
- Countries with higher GDP consistently show higher life expectancy
- Developed nations live ~12–13 years longer than developing nations
- BMI extremes may indicate health risks
- Adult mortality trends show long-term health improvements in some nations
- Strong socio-economic and health correlations exist globally

**Life Expectancy Change Over Time**
- MAX(Life_expectancy) - MIN(Life_expectancy)

Insight:
- Many countries show noticeable increases in life expectancy
- Some nations improved 10–20+ years within the dataset range. This indicates major progress in healthcare, sanitation, and living standards

Sorting DESC reveals:
- Countries with the largest improvements often developing nations undergoing rapid health modernization

Sorting ASC reveals:
- Countries with minimal improvement suggests stagnation or already high baseline life expectancy

**Global Trend Over Time**
- SELECT Year, AVG(Life_expectancy)

Insight:
- Global life expectancy steadily increases year after year
- Indicates worldwide improvement in health outcomes

**GDP vs Life Expectancy**
- SELECT Country, ROUND(AVG(Life_expectancy)), ROUND(AVG(GDP))

Insight:
- Many countries with low GDP also show low life expectancy
- Wealthier nations show the highest life expectancy averages
- This reveals a strong economic-health relationship

**GDP Threshold Analysis**

CASE WHEN GDP >= 1500
Insights:
- The dataset contains: 1326 Countries with high-GDP with a High_GDP_Life_Expectancy of 74.20

CASE WHEN GDP <=1500
Insights:
- The dataset contains: 1612 countries with low-GDP records with a Low_GDP_Life_Expectancy of 64.70

Average life expectancy for:
- High GDP countries = significantly higher
- Low GDP countries = much lower

This confirms: Economic development strongly impacts population longevity

**Developed vs Developing Status**
- SELECT Status, AVG(Life_expectancy)

Insight:
- Developed countries: ~79.2 years
- Developing countries: ~66.8 years

This means: People in developed countries live over a decade longer on average

**Status Count**
- COUNT(DISTINCT Country)

Insight:
- ~32 developed countries
- ~162 developing countries

This explains: Why global averages are pulled downward. Most of the world is still classified as developing

**BMI vs Life Expectancy**
- AVG(BMI)

Insight:
- Countries with extremely high BMI levels may have increased health risks
- Higher BMI does not always correlate positively with longer life
- Some high-BMI countries show reduced life expectancy

**Adult Mortality Trend Analysis (Window Function)**
- SUM(Adult_Mortality) OVER (PARTITION BY Country ORDER BY Year)

Insights:
- Running totals reveal long-term mortality burden

Afghanistan example shows:
- Yearly mortality improving but cumulative mortality remains high. This indicates long-term health challenges

United Arab Emirates example:
- Low adult mortality year-to-year means increasing life expectancy. This reflects strong healthcare systems and living standards

📝**Conclusion**

The SQL analysis reveals:
- Strong evidence that economic development, healthcare access, and living conditions drive global differences in life expectancy, with developing nations facing significantly lower longevity and higher mortality challenges.


--------------------------------------------------------------------------------------------------------------------------------

# 📊 **US Household Income Data Cleaning and Exploratory Data Analysis Project**

📌 **Project Overview**

This project focuses on analyzing U.S. household income patterns using a dataset that combines geographic, demographic, and economic information across states, counties, cities, and ZIP code areas in the United States.

The dataset includes:
- Household income values
- Income percentiles and statistical measures
- Geographic identifiers (state, county, city, ZIP code)
- Land and water area
- Population-related metrics

The main goal of the project is to:
- Clean and prepare the raw income data
- Merge income values with income statistics
- Identify income distribution patterns across regions
- Explore socioeconomic differences between locations
- Generate insights useful for policy, business, and social analysis

By integrating both datasets, the project enables a deeper understanding of how income varies geographically and what factors may contribute to economic disparities across the U.S.

🧩 **Business Problem**

Government agencies, businesses, and organizations face challenges such as:
- Unequal income distribution across regions
- Limited understanding of community-level economic conditions
- Difficulty identifying high-income vs low-income markets
- Inconsistent or messy data preventing accurate analysis

These challenges affect:
- Policy planning
- Business expansion decisions
- Resource allocation
- Housing market analysis
- Retail and service location strategy
- Social programs targeting low-income areas

This project addresses the problem by:
- Cleaning and standardizing income records
- Joining income data with statistical measures
- Identifying high-income and low-income regions
- Uncovering patterns in income distribution across the U.S.

The insights produced can help:
- Businesses determine where to expand
- Governments target economic support programs
- Researchers analyze inequality trends
- Housing and retail industries identify opportunities

🛠️ **Tech Stack**

✅ MySQL / SQL

Used for:
- Loading cleaned datasets
- Joining income and income statistics tables
- Detecting NULLs, blanks, and duplicates
- Analyzing income distribution by region
- Aggregation and grouping

✅ CSV Data Source

Provides:
- Household income by U.S. geography
- Statistical income measures
- Demographic spatial information

📌 **Overview of Findings**

The analysis of the U.S. Household Income dataset reveals:

- Large geographic differences in land and water distribution across states
- Major variation in average household income between states and city types
- Clear economic inequality, with certain regions consistently ranking lower
- Specific location types showing significantly higher income levels
- Discrepancies and missing values in the statistics table (e.g., California)

By joining the income and income statistics tables, the analysis provides a deeper understanding of income patterns across the United States at both state and city levels.

🔍 #**Key Analysis Insights**

🌎 **1. Geographic Insights**

Queries summing land and water area by state show:
- Alaska overwhelmingly leads in both total land and water area
- Texas also ranks highly in land size
- Michigan ranks among the highest in water area

This geographic context helps explain:
- Population distribution
- Economic activity and resource availability
- regional development differences

💰 **2. Income Data Quality Issues**

When joining the income and statistics tables, the analysis discovers:
- Many records for California contain zeros in Mean, Median, and other statistical fields
- the RIGHT JOIN reveals rows in the statistics table that do not match the main dataset

This indicates:
- Incomplete or inconsistent data reporting
- Missing income values
- Need for filtering before analysis

Filtering out Mean = 0 improves accuracy in later calculations.

🏛️ **3. State Income Rankings**

After removing invalid records, the average income analysis shows:

🔹 **Lowest Average Income States (beginning with the Lowest):**

- Puerto Rico
- Mississippi
- Arkansas
- West Virginia
- Alabama

These regions exhibit:
- Lower economic performance
- Weaker household earning power
- Potential need for economic support policies

🔹 **Highest Average Income States (beginning with the Highest):**

- District of Columbia
- Connecticut
- New Jersey
- Maryland
- Massachusetts

These areas show:
- Strong economies
- Higher wage levels
- Concentration of professional and government employment

🏘️ **4. Income by City Type**

When grouping by "Type" (e.g., City classification):
- "Municipality" shows the highest average income but very low count (only 1 record)
- "CPD" shows the highest median values among more common types

Applying HAVING COUNT(Type) > 100 filters out unreliable category results and reveals:
- more representative income patterns
- better analytical validity

🏙️ **City-Level Insights**

City-level aggregation highlights:
- Delta Junction, Alaska has the highest average mean income among cities analyzed
- Significant variation exists even within the same state

This suggests:
- Localized economic concentration
- Income hotspots not visible in state-level data

📈 **Overall Interpretation**

The analysis demonstrates:
The U.S. household income landscape is highly uneven, with strong economic performance in Northeastern states and major disparities in Southern and territory regions.

The combined dataset reveals:
- Regional inequality
- Inconsistent reporting in certain states
- Income clustering in specific city types and locations

✅ **Key Takeaways**

- Geographic and economic factors strongly influence household income
- Data cleaning is essential due to missing or zero values
- High-income regions include D.C. and the Northeast
- Low-income regions include Southern states and Puerto Rico
- City-level analysis exposes income hotspots not visible at the state level
