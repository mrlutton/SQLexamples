WITH revenue AS (
  -- Calculate revenue per eatery
  SELECT eatery,
         SUM(meal_price * order_quantity) AS revenue
    FROM meals
    JOIN orders ON meals.meal_id = orders.meal_id
   GROUP BY eatery
),

cost AS (
  -- Calculate cost per eatery
  SELECT eatery,
         SUM(meal_cost * stocked_quantity) AS cost
    FROM meals
    JOIN stock ON meals.meal_id = stock.meal_id
   GROUP BY eatery
),

profit AS (
  -- Calculate profit per eatery by combining revenue and cost
  SELECT r.eatery,
         revenue - cost AS profit
    FROM revenue r
    JOIN cost c ON r.eatery = c.eatery
)
SELECT eatery,
       profit
  FROM profit
ORDER BY eatery ASC;
