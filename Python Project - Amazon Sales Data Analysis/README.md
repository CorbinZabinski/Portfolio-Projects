# Amazon Sales Data Analysis - Exploratory Data Analysis (EDA):

## Descriptive Statistics:
    Analyzed and visualized the distribution of product ratings and discount percentages.
    Identified the correlation between product ratings and the number of reviews.

## Category Analysis:
    Determined the top product categories and their average ratings.
    Identified which categories have the highest and lowest average ratings.
    Analyzed which categories offer the most significant discounts.

#### Fetching and Cleaning Data:
    Imported data using Pandas and performed initial cleanup.
    Converted rating data to numeric and removed rows with missing values.


## Descriptive Statistics:

#### Distribution of Ratings and Discounts:
        Plotted histograms to visualize the distribution of product ratings and discount percentages.

#### Correlation Analysis:
        Created a scatter plot to examine the relationship between product ratings and the number of reviews, using a logarithmic scale for better clarity.

        
## Category Analysis:

#### Data Preparation:
    Converted the 'category' field from a string to a list and exploded it to handle multiple categories per product.

#### Top Categories:
    Identified the most common categories and analyzed their average ratings.

#### Category Ratings:
    Determined categories with the highest and lowest average ratings.

#### Discount Analysis:
    Calculated average discounts for categories with significant representation (more than 50 occurrences) to identify those offering the most notable discounts.
