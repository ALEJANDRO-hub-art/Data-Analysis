# 📊 **Food Marketing Data Analysis — Full Project Description**

📘 **Project Overview** 

This project analyzes customer behavior for a food retail/marketing company using historical customer and campaign data. The goal is to understand who spends the most, who is most likely to accept marketing campaigns, and which channels (web, catalog, in-store) are most effective.
Using Python and exploratory data analysis, you engineered key features (e.g., Age_Group, Total_Children, Education_Status, Marital_Status_str, MntTotal) and visualized relationships between:
- Demographics (age, marital status, children, education) 
- Purchase behavior (web, catalog, store purchases) 
- Total spending (MntTotal) 
- Campaign response (Accepted_Campaigns) 

From these insights, you define practical customer segments and marketing recommendations to maximize revenue and campaign ROI.

🎯 **Business Problem** 

The business needs to answer:
- **Which customers generate the most revenue?**  
  (Middle-aged customers (around 31–70 years old), especially those with few or no children, generate the most revenue.)
- **Which customers are most likely to respond to marketing campaigns?**  
  (Younger adults (23–30) and older customers (71+) are the most likely to respond to campaigns.)
- **Which channels (web, catalog, store) should we prioritize for marketing efforts?**  
  (Campaign efforts should prioritize the catalog channel for higher acceptance and the store/web channels for higher spending volume.)
- **How should we segment customers to target campaigns more effectively?**  
  (Segment customers by age group, number of children, and shopping channel behavior to target high-spending clusters differently from high-response clusters.)

Essentially: How can we best allocate marketing budget across customer segments and channels to maximize profit and new spend?

🛠 **Tech Stack** 

- Language: Python
- Environment: Jupyter Notebook

**Libraries:** 

- pandas – data loading, cleaning, feature engineering
- seaborn – statistical visualizations (heatmaps, barplots, regplots, jointplots)
- matplotlib – plot formatting and titles

**Data Cleaning**
- Removed duplicates

**Analysis & Insights by Graph** 

Below I walk through the graphs in the notebook and summarize what each one is telling you, plus likely cause–effect interpretations (with the caveat that the data is observational, so we’re inferring plausible business drivers, not proving strict causality).

**1. Correlation Heatmaps** 

Insights:
- The full correlation heatmap shows how numerical variables move together (spending, purchases, demographics, campaign acceptance).
- Higher purchase activity (more web/catalog/store purchases) likely contributes to higher total spend (MntTotal).Demographics alone are not strong direct drivers; instead, behavioral factors (how customers shop) better explain revenue and campaign response.

**2. Barplot of percentage of accepted campaigns per age group. Age vs Campaign Acceptance** 
- Core age audience (31–70): Represent a large share of customers. Less likely to accept campaigns compared to the very young and very old.
- Young adults (23–30) and older customers (71+): Higher campaign acceptance rates.

Insights: 
- Age is influencing both spend and willingness to engage:
  31–70 may already be loyal, habitual shoppers; campaigns may not significantly change their behavior (low marginal effect on acceptance).
- Younger (23–30) and older (71+) customers:  
  These groups might be more price-sensitive or more attentive to offers, so campaigns have a stronger impact on their behavior.
  
Business implication: 
- Use 31–70 as your core revenue base but recognize they are less responsive; think loyalty benefits and retention, not aggressive discounting.
- Provide tailored and persuasive promotions to customers aged 23–30 and 71+, as these segments are more responsive to marketing and can be more effectively encouraged to increase or resume spending.

**3. Bar chart of Age vs Spending (All Customers vs Campaign Acceptors)** 

Insights: 
- 30–70 spend the most money overall.
- Among campaign acceptors, the spending pattern still favors the middle-aged groups.
- Younger and older groups accept campaigns more frequently, but their absolute spend level is lower.
- Being in the 30–70 range is causing higher baseline consumption (likely due to higher incomes, stable households).
- Campaigns do not dramatically increase acceptance rates in these high-spend groups but can nudge additional spend.
- For younger and older customers, campaigns are more effective in changing behavior, even if their base spend is smaller.

Business implication: 
- For growth and new spend, focus on high-acceptance age bands at the edges (23–30, 71+).

**4. Bar chart of Purchase Channel Analysis (Web vs Catalog vs Store)** 

Insights: 
- Catalog purchases show higher likelihood of campaign acceptance.
- In-store (and likely web) drive higher total spend, i.e., larger baskets and more traffic.
- You recommended a channel split of roughly 40% catalog, 30% store, 30% web for campaign efforts.
- Catalog customers may be more engaged with promotional communication by design (they interact with mailed/online catalogs), so campaigns have stronger conversion effects.
- Store and web channels likely have more overall traffic, so even with slightly lower campaign acceptance, they are responsible for larger absolute revenue.

Business implication: 
- Double down on catalog customers, where campaigns clearly “work” better (higher acceptance).
- Focus on store and web, leveraging their higher traffic and basket size to scale revenue.
- A balanced approach is recommended: 40% catalog, 30% store, 30% web in campaign budget allocation to capture both high responsiveness and high volume.

**5. Regression plot Children / Family Size vs Campaign Acceptance** 
   
Insights: 
- As Total_Children increases, the number/probability of accepted campaigns decreases.
- Households with no kids or fewer kids are more responsive to marketing campaigns.
- Having more children likely reduces disposable income and time, making customers: More cautious about extra or premium purchases. Less likely to react to non-essential marketing offers.
- So family size is acting as a brake on campaign effectiveness.

Business implication: 
- For high-ROI campaigns, prioritize customers with zero or few children.
- For large-family segments, if targeted, use value-focused offers (family packs, discounts) rather than generic promotions.

**6. Education vs Campaigns and Spending** 

Insights: 
- Acceptance of campaigns does not change much across education levels.
- Total spending (MntTotal) does not vary dramatically by education either.
- Education does not appear to be a strong causal driver of either spend or campaign response in this customer base.
- Other factors (age, children, channel behavior) are more impactful.

Business implication: 
- Do not segment or target based on education; it adds complexity with little gain.
- Keep education as a descriptive variable, not a primary segmentation axis.

**7. Marital Status vs Spend and Campaigns** 

Insights: 
- Married, Single, and Together customers account for most of the spending.
- Widow and Divorced segments are smaller and spend less in total.
- Differences in campaign acceptance rate across marital statuses are not large enough to be the main driver of segmentation.
- Being married/single/together seems correlated with greater economic activity and household spending in this dataset.
- However, marital status does not strongly cause higher or lower responsiveness to campaigns.

Business implication: 
- Focus on Married, Single, Together segments for revenue volume (since they already spend more).

**Final Summary**
- Age, children, and purchase channel behavior are the primary drivers you should use for segmentation.
- Education and marital status provide useful background context but are not strong causal drivers of campaign response.

**The notebook’s graphs collectively support a strategy that:**
- Targets middle-aged, child-free high spenders for revenue maximization.
- Uses campaigns aggressively on young and older customers to grow their spend.
- Balances catalog, store, and web campaign efforts, with a slight tilt towards catalog for responsiveness and store/web for volume.

















