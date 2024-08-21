/*
Fast Food Nutrion 

Questions to answer
1. What are the 3 highest calorie items from each fast food place in the datatset?
2. What companies use the most trans fats?
3. What items have the most protein per calorie?
4. What items have less calories than their company's average item calories?
5. What are the healthiest items you can get?
*/

-- Clean Data
DELETE FROM fast_food
WHERE company LIKE '%Fat"%'
OR item LIKE 'Cinnabon® Delights™ (12 Pack – Serves 4)%';


-- 1. What are the 3 highest calorie food items from each fast food place in the datatset?

WITH rnk_cal AS (
	SELECT company, item, calories, RANK() OVER (PARTITION BY company ORDER BY calories DESC) As calorie_rank
	FROM fast_food
    WHERE total_fat_g > 3
)
SELECT * 
FROM rnk_cal
WHERE calorie_rank <= 3
ORDER BY company, calories DESC;



-- 2. What companies use the most trans fats? (For items with trans fat)

SELECT Company, AVG(Percent_of_Trans_Fat) AS Percent_Trans_Fat
FROM(
	SELECT Company, trans_fat_g / total_fat_g * 100 AS Percent_of_Trans_Fat
	FROM Fast_food
	WHERE trans_fat_g > 0
) AS trans_fat_percent
GROUP BY company
ORDER BY Percent_Trans_Fat DESC;



-- 3a. What items have the most protein per calorie? (In milligrams) -- Omitting insignificant items and drinks

SELECT Company, Item, Calories, Protein_g, (protein_g / calories)*1000 AS 'Protein/cal (mg)'
FROM Fast_food
WHERE protein_g > 3
AND total_fat_g > 1
AND item NOT LIKE '%latte%'
AND item NOT LIKE '%cappuccino%'
AND item NOT LIKE '%milk%'
AND item NOT LIKE '%mocha%'
AND item NOT LIKE '%frappe%'
ORDER BY (protein_g / calories)*1000 DESC;

-- 3b. What about burgers and sandwiches specifically?

SELECT Company, Item, Calories, Protein_g, (protein_g / calories)*1000 AS 'Protein/cal (mg)'
FROM Fast_food
WHERE protein_g > 3
AND total_fat_g > 1
AND item LIKE '%burger%'
OR item LIKE '%sandwich%'
OR item LIKE 'McD%'
OR item LIKE 'McC%'
OR item LIKE '%McR%'
OR item LIKE '% tasty%'
OR item LIKE '% Mac%'
ORDER BY (protein_g / calories)*1000 DESC;



-- 4. What items have less calories than their company's average item calories?  (Omitting Sodas and most sauces)

WITH AvgCalories AS (
    SELECT company, AVG(calories) AS avg_calories
    FROM fast_food
    WHERE calories > 100
    GROUP BY company
)
SELECT ff1.company, ff1.item, ff1.calories, ac.avg_calories
FROM fast_food ff1
JOIN AvgCalories ac ON ff1.company = ac.company
WHERE ff1.calories < ac.avg_calories
  AND ff1.calories > 100
  AND ff1.total_fat_g > 1
  AND ff1.item NOT LIKE '%sauce%'
ORDER BY company, ff1.calories ASC;



-- 5. What are the healthiest items? (based on rankings for the UNHEALTHY categories 'Saturated Fat', 'Trans Fat', 'Sodium', 'Sugar' and HEALTHY categories 'Fiber' and 'Protein') -- Omitting some drinks
-- Displaying average rank for each item and overall ranking (lower is healthier)

SELECT *, DENSE_RANK() OVER (ORDER BY average_rank) AS Ranking
	FROM(
	SELECT Company, Item, Calories, Rnk_sat_fat, Rnk_tran_fat, Rnk_chol, Rnk_sodium, Rnk_sugar, Rnk_fiber, Rnk_protein, 
		(rnk_sat_fat*0.8 + rnk_tran_fat*3 + rnk_sodium*0.2 + rnk_sugar*0.8 + rnk_fiber*1.5 + rnk_protein*0.5) / 6 AS Average_Rank
	FROM (
		SELECT Company, Item, calories, total_fat_g,
			DENSE_RANK() OVER (ORDER BY saturated_fat_g / calories) AS rnk_sat_fat, 
			DENSE_RANK() OVER (ORDER BY trans_fat_g / calories) AS rnk_tran_fat,
			DENSE_RANK() OVER (ORDER BY cholesterol_mg / calories) AS rnk_chol,
			DENSE_RANK() OVER (ORDER BY sodium_mg / calories) AS rnk_sodium, 
			DENSE_RANK() OVER (ORDER BY carbs_g / calories) AS rnk_carbs,
			DENSE_RANK() OVER (ORDER BY sugars_g / calories) AS rnk_sugar,
			DENSE_RANK() OVER (ORDER BY fiber_g / calories DESC) AS rnk_fiber,
			DENSE_RANK() OVER (ORDER BY protein_g / calories DESC) AS rnk_protein
		FROM fast_food
	) AS rnk_food
	WHERE total_fat_g > 1
	AND calories > 100
	ORDER BY Average_Rank ASC
) AS rnk





