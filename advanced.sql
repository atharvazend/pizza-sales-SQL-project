-- Calculate the percentage contribution of each pizza type to total revenue.


SELECT 
    pizza_types.category,
    round((SUM(order_details.quantity * pizzas.price) / (SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizaa_id = pizzas.pizza_id))*100,2) as revenue
    
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizaa_id
GROUP BY pizza_types.category 
ORDER BY revenue DESC;




-- Analyze the cumulative revenue generated over time.

select order_date, sum(revenue) over(order by order_date) as cumulative_revenu
from 
(SELECT 
    orders.order_date,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizaa_id = pizzas.pizza_id
        JOIN
    orders ON orders.order_id = order_details.order_id
GROUP BY orders.order_date ) as revenue_per_day ;



-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select name, revenue from
(select category , name, revenue ,rank() over(partition by category order by revenue desc) as rn 
from 
(
select pizza_types.category, pizza_types.name, SUM(order_details.quantity * pizzas.price) AS revenue
from pizza_types join pizzas on pizzas.pizza_type_id = pizza_types.pizza_type_id 
join order_details on order_details.pizaa_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as b) as a
where rn <=3;





