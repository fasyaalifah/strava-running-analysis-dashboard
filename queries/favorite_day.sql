CREATE OR REPLACE TABLE `portfolio-493507.strava_clean.favorite_day` AS
SELECT
  day_name,
  COUNT(*) AS total_runs
FROM `portfolio-493507.strava_clean.running_only`
GROUP BY day_name;
