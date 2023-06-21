-- Data Exploration with Airbnb data - Hawaii edition
-- Data source: http://insideairbnb.com/get-the-data/

-- Role: Potential rental property investor
-- Question: Which listings are the top earners in Hawaii? 

SELECT 
id, listing_url, name, 
neighbourhood, 
bedrooms,
booked_out_30,
REPLACE(CONVERT(VARCHAR, CONVERT(MONEY, price), 1), '.00', '') AS price,
REPLACE(CONVERT(VARCHAR, CONVERT(MONEY, proj_rev_30), 1), '.00', '') AS proj_rev_30
FROM
(SELECT TOP 20
id, listing_url, name, 
neighbourhood_group_cleansed AS neighbourhood, 
bedrooms,
30 - availability_30 AS booked_out_30,
price,
price * (30 - availability_30) AS proj_rev_30
FROM listings
ORDER BY proj_rev_30 DESC) AS top_20_table

-- Conclusion: The result shows the top 20 listings in descending orders.

-- Note: Upon a deeper dive into the data, I noted that the top listings were $99,999 per night, which is unreasonable.
-- Therefore, I conclude that although the SQL query correctly pulls the data, the underlying data is unreliable.