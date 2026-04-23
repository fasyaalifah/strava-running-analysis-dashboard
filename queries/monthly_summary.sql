CREATE OR REPLACE TABLE `portfolio-493507.strava_clean.monthly_summary` AS
SELECT
  year,
  month,
  COUNT(*) AS total_runs,
  ROUND(SUM(distance_km),2) AS total_km
FROM `portfolio-493507.strava_clean.running_only`
GROUP BY year, month;
