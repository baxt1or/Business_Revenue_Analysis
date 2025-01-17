WITH monthly_revenue AS (SELECT
TO_CHAR(date, 'YYYY-MM') AS month,
SUM(revenue) AS total_revenue
FROM df
WHERE date IS NOT NULL
GROUP BY 1)

AS (SELECT
*,
(total_revenue - LAG(total_revenue) OVER(ORDER BY month)) /LAG(total_revenue) OVER(ORDER BY month) AS growth_rate
FROM monthly_revenue)