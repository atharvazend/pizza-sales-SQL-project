-- retrive the total number of order placed  (total number of orders = 21350 )
SELECT 
    COUNT(order_id)
FROM
    orders;

-- Calculate the total revenue generated from pizza sales. (output = 817860.0499)
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizaa_id = pizzas.pizza_id;

-- Identify the highest-priced pizza.(output = The greek pizaa 35.95)

SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;


-- Identify the most common pizza size ordered. (output = L )

SELECT 
    pizzas.size, COUNT(order_details.order_details_id)
FROM
    pizzas
        JOIN
    order_details ON order_details.pizaa_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY pizzas.size limit 1;

-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pizza_types.name, SUM(order_details.quantity)
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizaa_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY SUM(order_details.quantity) DESC
LIMIT 5;




