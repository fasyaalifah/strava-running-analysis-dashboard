CREATE OR REPLACE TABLE `portfolio-493507.strava_clean.hr_vs_pace` AS
SELECT
  year,
  month,
  ROUND(avg_hr) AS hr,
  ROUND(AVG(pace_min_per_km),2) AS avg_pace
FROM `portfolio-493507.strava_clean.running_only`
WHERE avg_hr IS NOT NULL
GROUP BY year, month, hr;
