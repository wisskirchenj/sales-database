use sales;
CREATE VIEW model_report AS
SELECT
    model,
    price,
    sum(total_price) AS total_sale_per_model,
    i.quantity AS inventory_per_model,
    sum(total_price) / i.quantity AS sales_inventory_ratio
FROM products p
JOIN inventory i on p.product_id = i.product_id
JOIN sales s on p.product_id = s.product_id
GROUP BY p.product_id
ORDER BY sales_inventory_ratio DESC;