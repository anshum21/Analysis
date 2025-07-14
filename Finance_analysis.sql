CREATE TABLE Assets (
    asset_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ticker VARCHAR2(10) UNIQUE NOT NULL,
    sector VARCHAR2(50)
);

CREATE TABLE Holdings (
    holding_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    investor_id NUMBER NOT NULL,
    ticker VARCHAR2(10),
    quantity NUMBER,
    weight NUMBER(10,6),
    FOREIGN KEY (ticker) REFERENCES Assets(ticker)
);

CREATE TABLE Prices (
    price_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ticker VARCHAR2(10),
    price_date DATE,
    open_price NUMBER(10,2),
    high_price NUMBER(10,2),
    low_price NUMBER(10,2),
    close_price NUMBER(10,2),
    adjusted_price NUMBER(10,2),
    daily_return NUMBER(10,6),
    volume NUMBER,
    FOREIGN KEY (ticker) REFERENCES Assets(ticker)
);


-- QUERY 1
--Total portfolio value (on aspecified date)

SELECT 
  h.investor_id,
  ROUND(SUM(h.quantity * p.close_price), 2) AS total_portfolio_value
FROM holdings h
JOIN prices p ON h.ticker = p.ticker
WHERE p.price_date = TO_DATE('2023-12-29', 'YYYY-MM-DD')
GROUP BY h.investor_id;

--QUERY 2:Value of each holding:
SELECT 
  h.investor_id,
  h.ticker,
  h.quantity,
  p.close_price,
  ROUND(h.quantity * p.close_price, 2) AS holding_value
FROM holdings h
JOIN prices p ON h.ticker = p.ticker
WHERE p.price_date = TO_DATE('2023-12-29', 'YYYY-MM-DD')
ORDER BY h.investor_id, holding_value DESC;

--QUERY 3: Allocation % of Each asset in portfolio:

WITH holding_value AS (
  SELECT 
    investor_id,
    h.ticker,
    ROUND(h.quantity * p.close_price, 2) AS value
  FROM holdings h
  JOIN prices p ON h.ticker = p.ticker
  WHERE p.price_date = TO_DATE('2023-12-29', 'YYYY-MM-DD')
),
total_value AS (
  SELECT investor_id, SUM(value) AS total FROM holding_value GROUP BY investor_id
)
SELECT 
  h.investor_id,
  h.ticker,
  h.value,
  ROUND((h.value / t.total) * 100, 2) AS allocation_percent
FROM holding_value h
JOIN total_value t ON h.investor_id = t.investor_id
ORDER BY h.investor_id, allocation_percent DESC;

--QUERY 4:Top performing ticker by daily return:

SELECT ticker, daily_return
FROM prices
WHERE price_date = TO_DATE('2023-12-29', 'YYYY-MM-DD')
ORDER BY daily_return DESC
FETCH FIRST 5 ROWS ONLY;


