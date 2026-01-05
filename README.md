# Airline Arrival Delay Analysis (U.S. Flights)

## Overview
This project analyzes airline reliability using U.S. flight data.  
Two metrics are used to compare airlines:
- Average arrival delay (how late flights usually are)
- Arrival delay variability (how consistent arrival times are)

Only airlines with at least 50 recorded flights are included to ensure reliable comparisons.

## Key Findings
- Some airlines have similar average arrival delays but very different levels of consistency.
- High delay variability indicates unreliable arrival times, even when average delays look acceptable.
- Average delay alone does not fully capture airline reliability.
- Evaluating both average delay and variability provides a clearer picture of performance.

## Tools Used
- SQL (PostgreSQL)
- Tableau Public
- GitHub

## Visualization
![Dashboard](dashboard.png)

## Tableau Public Link
https://public.tableau.com/app/profile/eliza.wanye/viz/airlines_delay_17675874272350/Dashboard1

## SQL Query
'''sql
SELECT "OP_UNIQUE_CARRIER", "DEST", ROUND(AVG("ARR_DELAY")) AS avg_delay_minutes, ROUND(STDDEV("ARR_DELAY")) AS delay_variability, COUNT(*) AS number_of_flights
FROM flight_data_with_weather_final
WHERE "CANCELLED" = 0 AND "ARR_DELAY" IS NOT NULL 
GROUP BY "OP_UNIQUE_CARRIER", "DEST"
HAVING COUNT(*) >= 50
ORDER BY delay_variability DESC;
