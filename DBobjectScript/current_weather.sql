-- A query to get latest observation

SELECT temperature AS lämpötila, wind_speed AS tuuli, wind_direction AS suunta
FROM public.observation
ORDER BY timestamp DESC LIMIT 1;


