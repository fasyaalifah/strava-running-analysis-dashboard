CREATE OR REPLACE TABLE `portfolio-493507.strava_clean.distance_distribution` AS
SELECT
  ROUND(distance_km) AS jarak_km,
  COUNT(*) AS frekuensi
FROM `portfolio-493507.strava_clean.running_only`
GROUP BY jarak_km;
