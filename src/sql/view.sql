use sales;
CREATE INDEX customer_sales_product
    ON sales(customer_id, product_id);

CREATE VIEW sales_summary
AS
SELECT
    model, SUM(sales.quantity) AS total_sold
FROM sales
         JOIN products ON sales.product_id = products.product_id
GROUP BY model
ORDER BY total_sold DESC;

SELECT * FROM sales_summary;

