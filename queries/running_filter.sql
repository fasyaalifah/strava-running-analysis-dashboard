CREATE OR REPLACE TABLE `portfolio-493507.strava_clean.running_only` AS
SELECT *
FROM `portfolio-493507.strava_clean.strava_activity_clean`
WHERE
  LOWER(TRIM(sport_type)) = 'run'
  AND distance_km >= 1
  AND pace_min_per_km BETWEEN 3 AND 12;


-- ANALISIS BULANAN
CREATE OR REPLACE TABLE `portfolio-493507.strava_clean.monthly_summary` AS
SELECT
  year,
  month,
  COUNT(*) AS total_runs,
  ROUND(SUM(distance_km),2) AS total_km
FROM `portfolio-493507.strava_clean.running_only`
GROUP BY year, month;
