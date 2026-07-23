-- 1. How many total accounts are registered in the platform?
SELECT COUNT(DISTINCT account_id) AS total_accounts
FROM gold_fact_accounts;

-- 2. How many users are currently active?
SELECT COUNT(user_id) AS total_active_users FROM gold_fact_users
WHERE user_status = 'active';

-- 3. Number of accounts based on each industry
SELECT industry, COUNT(account_id) AS account_count FROM gold_fact_accounts
GROUP BY industry
ORDER BY account_count DESC;

-- 4. Top 5 Countries by Account Volume
SELECT  COALESCE(country_name, country_code) AS country, COUNT(account_id) AS total_accounts FROM gold_fact_accounts
GROUP BY COALESCE(country_name, country_code)
ORDER BY total_accounts DESC
LIMIT 5;

-- 5. Active Accounts & Churn Rate by Country
SELECT 
    COALESCE(country_name, country_code) AS country,
    COUNT(DISTINCT account_id) AS total_accounts,
    COUNT(DISTINCT CASE WHEN account_status = 'active' THEN account_id END) AS active_accounts,
    COUNT(DISTINCT CASE WHEN account_status = 'cancelled' THEN account_id END) AS churned_accounts,
    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN account_status = 'cancelled' THEN account_id END) / COUNT(DISTINCT account_id), 
        2) AS churn_rate
FROM gold_fact_accounts
GROUP BY COALESCE(country_name, country_code)
ORDER BY total_accounts DESC;

-- 6. Which customer acquisition channels yield the highest activation accounts?
SELECT 
    a.acquisition_channel,
    COUNT(DISTINCT e.account_id) AS activated_accounts 
FROM gold_fact_accounts a
LEFT JOIN gold_fact_product_event e 
    ON a.account_id = e.account_id 
    AND e.event_name IN ('create_deal', 'enable_automation', 'move_deal_stage')
GROUP BY a.acquisition_channel;


-- 7. Activation Rate by industry
WITH cte AS(
	SELECT  t2.industry, COUNT(t1.account_id) AS 'Activated_Accounts' 
    FROM  gold_fact_users t1 LEFT JOIN gold_fact_accounts t2 ON t1.account_id = t2.account_id
    WHERE t1.is_Admin = TRUE
    GROUP BY t2.industry
)

SELECT industry, ROUND(Activated_Accounts/(SELECT COUNT(*) FROM gold_fact_users),3)*100 AS 'activation_rate' FROM cte;


-- 8. Activation Rate Overall
SELECT ROUND(COUNT(t1.account_id)/(SELECT COUNT(*) FROM gold_fact_users),2)*100 AS 'activation_rate' 
FROM gold_fact_users t1 JOIN gold_fact_users t2 ON t1.account_id = t2.account_id
WHERE t1.is_admin = TRUE

