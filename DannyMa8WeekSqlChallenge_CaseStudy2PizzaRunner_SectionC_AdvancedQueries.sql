--1) What are the standard ingredients for each pizza?
/*
SELECT 
--COUNT(DISTINCT pr.pizza_id) as pizzas,
pt.topping_name
FROM pizza_runner.pizza_recipes as pr
CROSS JOIN LATERAL unnest(string_to_array(pr.toppings, ', ')) AS s
INNER JOIN pizza_runner.pizza_toppings as pt on pt.topping_id = s::integer
GROUP BY pt.topping_name
HAVING COUNT(DISTINCT pr.pizza_id)=2;
*/
--2) What was the most commonly added extra?
/*
SELECT 
pt.topping_name,
COUNT(pizza_id) as added_extra
FROM pizza_runner.customer_orders
CROSS JOIN LATERAL unnest(string_to_array(extras, ', ')) AS s
INNER JOIN pizza_runner.pizza_toppings as pt on pt.topping_id = s::integer
WHERE LENGTH(s)>0 AND s <> 'null'
GROUP BY pt.topping_name
ORDER by added_extra desc
LIMIT 1;
*/
--3) What was the most common exclusion?
/*
SELECT 
pt.topping_name,
COUNT(pizza_id) as exclusions
FROM pizza_runner.customer_orders
CROSS JOIN LATERAL unnest(string_to_array(exclusions, ', ')) AS s
INNER JOIN pizza_runner.pizza_toppings as pt on pt.topping_id = s::integer
WHERE LENGTH(s)>0 AND s <> 'null'
GROUP BY pt.topping_name
ORDER by exclusions desc
LIMIT 1;
*/
