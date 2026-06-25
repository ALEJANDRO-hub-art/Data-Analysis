# 📊 NYC Restaurant Health Inspection Analysis -NYC 

A detailed analytical study of New York City restaurant health inspection data, focused on uncovering trends in violations, grading outcomes, and food safety performance across different cuisines.

## 📘 Project Overview 

This project examines restaurant inspection data from the NYC Department of Health to generate actionable insights for enhancing public health policies, optimizing inspection schedules, and guiding food safety education initiatives. The analysis enables city leaders to identify high-risk neighborhoods, understand which types of restaurants face the greatest food safety challenges, and pinpoint the most frequent violations.

## 🎯 Business Problem 

The NYC Department of Health requires data-driven insights to:
- Detect trends in restaurant violations and inspection grades
- Identify cuisines and neighborhoods with lower food safety compliance
- Guide targeted inspections, policy decisions, and educational initiatives to enhance food safety
- Monitor variations in restaurant grades and violations across boroughs and over time

## 🛠 Tech Stack 

- **SQL Server** - Data cleaning, transformation, and analysis
- **Power BI** - Develop interactive dashboards and create insightful visualizations

## Project Structure 

```
├── 01_data_preparation.sql          # Data cleaning and standardization
├── 02_overall_insights.sql          # Borough and grade distribution analysis
├── 03_violation_analysis.sql        # Violation patterns and critical violations
├── 04_cuisine_analysis.sql          # Cuisine-specific safety compliance
├── Restaurant_Health_Inspection_Analysis_NYC.pbix  # Power BI dashboard
```

## Data Preparation Process 

### Data Cleaning Steps:
1. **Missing Value** 
   - Replaced NULL cuisine descriptions values with 'Not Specified'
   - Set missing grades to 'Inspection pending'
   - Standardized inspection types for pending inspections
   - Handled borough data inconsistencies

2. **Data Standardization** 
   - Grouped similar cuisines into broader categories:
     - Asian (Chinese, Filipino, Indian , Indonesian, Pakistani, etc.)
     - American (Californian, Barbecue, Hotdogs, etc.)
     - European (English, Russian, Spanish, Czech, etc.)
     - Mediterranean/Middle Eastern (Egyptian, Turkish, Moroccan, etc.)
     - Latin/Caribbean (Mexican, Tex-Mex, Brazilian, etc.)
     - Australian / Oceanic (Australian, Hawaiian, etc.)
     - And more...

3. **Data Type Conversion** 
   - Converted inspection and grade dates to DATETIME format

## Key Analysis Areas

### 1. Overall Insights 
- **Borough Analysis**: Inspections by NYC borough
- **Grade Distribution across NYC**: A, B, C grades across the NYC
- **Inspection Types**: Analysis of initial inspection, re-inspection, and pre-permit inspections

### 2. Violation Analysis 
- **Top Violations**: Top 10 violation codes and violation descriptions
- **Critical vs Non-Critical**: Comparison of violation severity
- **Regional Patterns**: Boroughs with highest critical violation counts

### 3. Cuisine Analysis 
- **Grade**: Grade based on cuisine type
- **Score Analysis**: Top 5 cuisines with lowest average inspection scores
- **Safety Patterns**: Cuisines with highest critical violations

## 🔍 Key Findings & Insights 

### Top Research Questions Answered:
1. **Which violations are most common, and where do they occur most frequently?** 2
2. **Which cuisines and neighborhoods have the lowest food safety performance?** 3
3. **How do restaurant grades and violations vary across boroughs and over time?** 3
4. **Where should the city focus inspections, policies, or education to improve food safety?** 1

## 📈 Power BI Dashboard Features 

The interactive Power BI dashboard (`Restaurant_Health_Inspection_Analysis_NYC.pbix`) includes:

- 🗺️ **Geographic Visualizations**: Borough-wise maps
- 📊 **Grade Distribution Charts**: Visual breakdown of restaurant grades based on Borough
- 🎯 **Violation Analysis**: Critical vs non-critical violation 
- 🍜 **Cuisine Performance**: Safety scores by cuisine type
- 📅 **Time Series Analysis**: Trends over critical violations
- 🎛️ **Interactive Filters**: Borough, cuisine, and date filters

## 🚀 How to Use This Project 

### Prerequisites 
- SQL Server, MySQL or compatible database system
- Power BI Desktop
- Access to NYC restaurant inspection dataset

### Setup Instructions
1. **Create a New Schema** 
   - Create a News Schema in MySQL

2. **Database Setup** 
   - Import the NYC restaurant inspection results dataset into MySQL
   - Make sure the table is named `inspection_results`

3. **Run SQL Analysis** 
   - Execute scripts in order: `01_data_preparation.sql` → `02_overall_insights.sql` → `03_violation_analysis.sql` → `04_cuisine_analysis.sql`

4. **Power BI Dashboard**
   - Open `Restaurant_Health_Inspection_Analysis_NYC.pbix`
   - Update data source connections to your database
   - Refresh data to load latest analysis results

## 💡 Recommendations

Based on the analysis, the project provides actionable recommendations for:

- **Target High-Risk Boroughs**: Allocate more inspection resources to boroughs showing the highest number of critical violations.
- **Strengthen Inspection Scheduling**: For boroughs with many re-inspections, implement targeted outreach to help establishments prepare before an inspection occurs.
- **Focus on the Top Violations**: Develop focused training and guidance materials specifically addressing the most common 10 violations.
- **Reduce Critical Violations**: Launch preventive programs targeting hygiene, food handling, and pest control—the most frequent critical violation categories.
- **Improve Scores for Low-Performing Cuisines**: Use the score analysis to create action plans for cuisines with the lowest average inspection scores.
- **Strengthen Collaboration with Cultural Associations**: Work with cuisine-specific restaurant associations (e.g., Latin, Asian, Middle Eastern groups) to share safety best practices.

## 🎓 Project Credit 

This project **Restaurant Health Inspection Analysis - NYC** dataset and requirements were provided by Analyst Builder ([https://www.analystbuilder.com/projects/restaurant-health-inspection-analysis-nyc-FhAOm](https://www.analystbuilder.com/projects/restaurant-health-inspection-analysis-nyc-FhAOm). The business requirements and dataset were provided by Analyst Builder, the analysis and visualization were implemented by myself with some guidance from GitHub repositories online.

---

<img width="905" height="508" alt="image" src="https://github.com/user-attachments/assets/be3a2d83-9e1e-43d3-875d-f83a8999d943" />


