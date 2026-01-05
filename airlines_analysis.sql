-- How does delay variability differ across airlines and routes?
SELECT "OP_UNIQUE_CARRIER", "DEST", ROUND(AVG("ARR_DELAY")) AS avg_delay_minutes, ROUND(STDDEV("ARR_DELAY")) AS delay_variability, COUNT(*) AS number_of_flights
FROM flight_data_with_weather_final
WHERE "CANCELLED" = 0 AND "ARR_DELAY" IS NOT NULL 
GROUP BY "OP_UNIQUE_CARRIER", "DEST"
HAVING COUNT(*) >= 50
ORDER BY delay_variability DESC;