/* ============================================================
   Title: CUSTOMER SHOPPING ANALYSIS using SQL
   Database: PostgreSQL
   Table: customer
   Author: Pratik Satish Billade
   ============================================================ */

-- 1. Understanding how revenue is distributed across gender segments.

SELECT gender, SUM(purchase_amount) as sales_amount
FROM customer
GROUP BY gender;

-- 2. Identifying high-value purchases that occurred despite discounts.

SELECT customer_id, purchase_amount
FROM customer 
WHERE discount_applied = 'Yes' 
    AND purchase_amount >= (SELECT AVG(purchase_amount) FROM customer);

-- 3. Identifying top 5 products with the highest average review rating.

SELECT item_purchased, ROUND(AVG(review_rating::numeric), 2) AS average_product_rating
FROM customer
GROUP BY item_purchased
ORDER BY average_product_rating DESC 
LIMIT 5;

-- 4. Comparing the average Purchase Amounts between Standard and Express Shipping.

SELECT shipping_type, ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
WHERE shipping_type = 'Express' OR shipping_type = 'Standard'
GROUP BY shipping_type;

-- 5. Do subscribed customers spend more? Compare average spend and total revenue ---
--between subscribers and non-subscribers.

SELECT subscription_status,
       COUNT(customer_id) AS total_customers,
       ROUND(AVG(purchase_amount), 2) AS average_spending,
       SUM(purchase_amount) AS total_sales_amount
FROM customer
GROUP BY subscription_status
ORDER BY average_spending DESC;

-- 6. Identifying products most frequently purchased with discounts.

SELECT item_purchased,
       ROUND(100 * COUNT(*) FILTER (WHERE discount_applied = 'Yes') / COUNT(*), 2)
       AS percentage_of_purchases_with_discount
FROM customer
GROUP BY item_purchased
ORDER BY percentage_of_purchases_with_discount DESC
LIMIT 5;

-- 7. Segmenting customers into New, Returning, and Loyal based on their total 
-- number of previous purchases, and show the count of each segment. 

WITH customer_type AS (
    SELECT
        customer_id,
        previous_purchases,
        CASE
            WHEN previous_purchases = 1 THEN 'New'
            WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
            ELSE 'Loyal'
        END AS customer_segment
    FROM customer
)
SELECT customer_segment, COUNT(*) AS "number_of_customers" 
FROM customer_type 
GROUP BY customer_segment;

-- 8. Are customers who are repeat buyers (more than 5 previous purchases) also likely to subscribe?

SELECT subscription_status, COUNT(customer_id) AS repeat_orders
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status;

-- 9. Identifying the top 3 most purchased products within each category.

WITH item_counts AS (
    SELECT category,
           item_purchased,
           COUNT(customer_id) AS total_orders,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS item_rank
    FROM customer
    GROUP BY category, item_purchased
)
SELECT item_rank, category, item_purchased, total_orders
FROM item_counts
WHERE item_rank <=3
ORDER BY category, item_rank;

-- 10. What is the revenue contribution of each age group?

SELECT age_group , SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;



