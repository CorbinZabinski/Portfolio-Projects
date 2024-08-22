# Fast Food Nutrition Analysis

## Project Overview
This project explores the nutritional content of various fast food items to uncover insights about calorie counts, trans fats, protein content, and overall healthiness. Using SQL, I analyzed a dataset containing nutritional information from different fast food chains, answering key questions that provide valuable insights for health-conscious consumers.

## Questions Answered

1. **Highest Calorie Items**: 
   - Identified the three highest calorie items from each fast food company in the dataset.

2. **Trans Fats Analysis**:
   - Determined which companies use the most trans fats in their products.

3. **Protein per Calorie**:
   - Found the items with the highest protein content per calorie, with a special focus on burgers and sandwiches.

4. **Caloric Comparison**:
   - Listed items that have fewer calories than their company’s average, filtering out less significant items like sodas and sauces.

5. **Healthiest Items**:
   - Ranked the healthiest items based on several factors, including saturated fat, trans fat, sodium, sugar, fiber, and protein content.

## Data Cleaning and Preparation
- Removed irrelevant data entries to ensure the analysis focused on significant and comparable items.
- Filtered out items with low nutritional value or incomplete data, such as certain beverages and sauces.

## Analysis Highlights

### 1. Highest Calorie Items
- A window function (`RANK()`) was used to rank items by calorie content within each company.

### 2. Trans Fats Analysis
- Calculated the percentage of trans fats relative to total fats to identify companies with the highest trans fat usage.

### 3. Protein per Calorie
- Focused on protein content relative to calorie count, providing insights into the most protein-dense items available.

### 4. Caloric Comparison
- Items were compared against the average caloric content of each company’s offerings to highlight lower-calorie options.

### 5. Healthiest Items
- A multi-criteria ranking system was developed, using dense ranking to evaluate items on both healthy and unhealthy factors, resulting in an overall healthiness score.

## Conclusion
This analysis provides a detailed look at fast food nutritional content, offering insights that can help consumers make healthier choices. The SQL queries developed here demonstrate my ability to handle complex data sets, perform meaningful analyses, and draw actionable conclusions.

## How to Use
- Clone the repository and run the SQL scripts in your preferred SQL environment.
- The dataset used is included in the repository for easy reference.
