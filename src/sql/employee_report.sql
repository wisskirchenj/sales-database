use sales;
CREATE VIEW employee_report AS
WITH
    total_sale_month AS (
        SELECT
            sum(total_price) AS total,
            date_format(sale_date, '%M %Y') AS mon
        FROM sales
        GROUP BY mon),
    employee_data AS (
        SELECT
            sum(total_price) AS sold,
            concat(first_name, ' ', last_name) AS employee_name,
            position,
            date_format(s.sale_date, '%M %Y') AS month_year
        FROM employees e
        JOIN sales.sales s on e.employee_id = s.employee_id
        WHERE position = 'Sales Associate'
        GROUP BY month_year, employee_name)
SELECT
    employee_name,
    position,
    month_year,
    CASE
        WHEN 100 * sold / total < 5.0 THEN 0
        WHEN 100 * sold / total < 10.0 THEN 2000
        WHEN 100 * sold / total < 20.0 THEN 5000
        WHEN 100 * sold / total < 30.0 THEN 10000
        WHEN 100 * sold / total < 40.0 THEN 15000
        ELSE 25000
    END AS employee_bonus
FROM total_sale_month
JOIN employee_data ON mon = month_year
ORDER BY month_year, employee_bonus;
