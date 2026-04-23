CREATE OR REPLACE TABLE `portfolio-493507.strava_clean.yearly_pace` AS
SELECT
  year,
  ROUND(AVG(pace_min_per_km),2) AS avg_pace
FROM `portfolio-493507.strava_clean.running_only`
GROUP BY year;
