# 📊 **NYC Transportation Project**


📘 **Project Overview** 

This project analyzes New York City’s bus transportation performance by exploring delay times, day-of-week travel patterns, and common causes of delays or breakdowns. The dataset, split into multiple sheets, provides insights into how bus companies perform across boroughs, how travel demand fluctuates throughout the week, and which operational issues most frequently disrupt service.
The goal is to transform these raw tables into actionable insights that support data-driven decision-making for improving service reliability and customer satisfaction.

🧩 **Business Problem** 

NYC’s bus network faces consistent challenges involving delays, breakdowns, and uneven performance across boroughs and time periods. These issues directly impact:

- Passenger satisfaction
- Operational efficiency
- Cost management
- Service reliability and scheduling


💻 **Tech Stack** 

- Microsoft Excel

**Data Cleaning and Transformation:** 

- Broke a full date column by the =WEEKDAY formula.
- Data Normalization.
- Splitted data into multiple columns.
- Deleted outliers rom the dataset (dates of 1900).
- Created Pivot Tables and Pivot Charts.

**1. What are the most common reasons for delays and breakdowns?** 

Graph used: Clustered Bar
- Based on the Pivot Tables and the Pivot Charts for this question our findings were the following:

**Breakdown:**
- The majority of breakdowns are occuring due to Mechanical Problems or "Wont Start" which also seems to be a mechanical problem.
- Recommendation: More precautionary maintenance done to prevent mechanical problems. Potentially have buses serviced monthly or quarterly to reduce this.

<img width="467" height="210" alt="Breakdown" src="https://github.com/user-attachments/assets/14ca6e7f-fff7-4842-8764-25461da73357" />

**Reasons for Delay:**
- Overwhelmingly, the main cause of delays is traffic.
- Potential Solution: Have buses pick up majority of students at non-high traffic times.
- Note: There are almost 14k delays due to Mechanical issues. This could be resolved with
  the plan for breakdowns in servicing the vehicles regularly.

<img width="476" height="224" alt="Reasons for Delays" src="https://github.com/user-attachments/assets/c64e643a-4bb5-4d68-9b2c-9d2add9c16ec" />

**2. How do delay times vary by bus company and borough?** 

Graph used: Clustered Bar
- Based on the Pivot Tables and the Pivot Charts for this question our findings were the following:

**Largest Delay Times for Bus Companies:**
- There are the top 10 companies with the highest delay times.
- Recommendation: Use this to compare to # of delays, boros, and total number of trips.
- Could be mechanical issues - fix with regular maintenance OR we need to fire them.

<img width="654" height="291" alt="Largest Delay Times for Bus Companies" src="https://github.com/user-attachments/assets/fe137835-94be-4fa3-94ef-6d5fc818ce7c" />

**Longest Delay Times Per Boro:**
- The boros with the highest delay times are the main areas of NYC. These are the areas with the highest concentration of people and vehicles  which would account for the longer delays.
- Conclusion: This is accurate to what I would have hypothesized.

<img width="534" height="240" alt="Longest Delay Times Per Boro" src="https://github.com/user-attachments/assets/8c6ea3e0-b9e2-4d7f-9cf2-b1134230dc6c" />

**3. Is there a correlation between specific days of the week and the frequency of breakdowns or delays?** 

Graph used: Line Charts
- Based on the Pivot Tables and the Pivot Charts for this question our findings were the following:

**Running Late:**
- Spike in Delays on Monday and a decrease in delays on Fridays.
- Conclusion: Since the majority of delays are caused by traffic, we can assume the decrease in delays on Friday are caused by less people going into work or driving on that day.

<img width="397" height="210" alt="Running Late" src="https://github.com/user-attachments/assets/0d33d673-52e1-4761-8ac1-a8cbbac0c911" />

**Breakdown:**
- There is a gradual decrease in breakdowns throughout the week. Higher percentage of breakdowns happening on Monday and decreases throughout the week.
- Recommendation: Schedule Maintenance over weekends to help with breakdowns.

<img width="401" height="217" alt="Breakdowns" src="https://github.com/user-attachments/assets/16878a02-88a2-4f40-b2ca-a8679c58cc62" />


--------------------------------------------------------------------------------------------------------------------------

# 📊 **US Debt Tracker Project** 

📘 **Project Overview** 

The US Debt Tracker Project is designed to analyze, monitor, and forecast the growth of the United States national debt. Using multiple datasets containing historical monthly values, yearly percentage changes, and projected future trends, this project provides a structured analytical framework to understand how federal debt evolves over time.
The purpose of the project is to transform raw economic data into meaningful insights that highlight long-term financial risks, growth patterns, and key inflection points. By combining descriptive analytics with forward-looking projections, the project supports data-driven decision-making for analysts, financial agencies, and policy researchers.

🧩 **Business Problem** 

The United States’ national debt continues to rise, creating significant long-term challenges related to federal budgeting, inflation management, interest obligations, and economic stability.

The business problem this project addresses is:
“How can we better understand, monitor, and forecast U.S. debt growth to support transparent financial planning and risk assessment?”

To solve this, the project focuses on answering core analytical questions:

**1. What was the Yearly Debt Percentage Increase for each year compared to the previous year?** 
   
- The Yearly Debt Percentage Increase will show how fast the total U.S. debt has grown from one year to the next. Typically, national debt increases most years, often ranging from 2% to 10% annually, depending on economic conditions, federal spending, and major events. The final dataset will show the exact percentage increase for each individual year.

**2. Which months historically have seen the highest/lowest increases in Total debt?** 
   
- Some months tend to show larger increases in debt due to seasonal spending patterns (e.g., fiscal year boundaries, stimulus disbursements, or budget cycles).
The highest-increase months are often tied to periods of higher federal budget activity, while the lowest-increase months may reflect periods of reduced spending or stabilizing debt accumulation. Exact monthly trends will be identified once the dataset is analyzed.

**3. What is the projected growth of the publicly held debt in the next few years?** 

- The projected growth will depend on the model used in the dataset. Generally, U.S. publicly held debt is expected to continue rising each year, often at a steady or accelerating pace depending on economic forecasts. The projection sheet in the dataset will provide the specific forecasted values over the next several years.

💻 **Tech Stack** 

- Microsoft Excel

**Data Cleaning and Transformation:** 

- Deleted BLANKS and NULL values.
- Applied Data Formats from Scientific to Number
- Added Puntuation

  
**1. What was the Yearly Debt Percentage Increase for each year compared to the previous year?** 

- Debt growth was modest and stable from 2016–2019.

- 2020 produced an unprecedented spike, driven almost entirely by Debt Held by the Public.

- Intragovernmental debt remains the most stable, least volatile component.

- Total debt growth mirrors public borrowing behavior.

- By 2021–2022, debt growth returns to near-normal levels, but the long-term upward trend persists.

<img width="288" height="210" alt="Yearly Debt Percentage Increase" src="https://github.com/user-attachments/assets/0eaef45d-c1d0-443f-811b-b6e5877c592d" />


**2. Which months historically have seen the highest/lowest increases in Total debt?**

- A continuous upward trajectory in U.S. public debt across the year

- Slight early-year reductions followed by steady increases

- Major growth in late-year months

- High starting and ending levels in January and December

- Minimal monthly variability compared to the long-term upward trend

- Overall, the chart reveals a predictable, relentless rise in U.S. debt, with only mild monthly fluctuations and stronger increases toward the fiscal-year end.

<img width="306" height="210" alt="Montly Average Total Debts" src="https://github.com/user-attachments/assets/e590355e-efa1-4095-8345-a5bb86282eb6" />


**3. What is the projected growth of the publicly held debt in the next few years?**

- A long-term exponential rise in U.S. total public debt

- Slow growth (1997–2003) → faster growth (2003–2008) → sharp acceleration (2008–2019)

- A massive breakout spike in 2020–2021 due to the pandemic

- Projected continued steep growth through 2027

- Overall, the graph highlights a consistent and accelerating increase in debt over 30+ years, driven by structural deficits and amplified by major economic crises.

<img width="297" height="210" alt="Projected Publicly Held Debt" src="https://github.com/user-attachments/assets/3530591d-759c-4b4c-b89a-95a7c30b7fe6" />













