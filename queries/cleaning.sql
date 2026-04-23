WITH base AS (
  SELECT
    Date AS activity_timestamp,
    DATE(Date) AS activity_date,
    EXTRACT(YEAR FROM Date) AS year,
    EXTRACT(MONTH FROM Date) AS month,
    FORMAT_DATE('%A', DATE(Date)) AS day_name,

    -- SUDAH KM
    SAFE_CAST(Distance AS FLOAT64) AS distance_km,

    -- SUDAH MENIT
    SAFE_CAST(moving_time AS FLOAT64) AS time_min,

    SAFE_CAST(average_heartrate AS FLOAT64) AS avg_hr,
    TRIM(sport_type) AS sport_type,
    Name
  FROM `portfolio-493507.Strava_Analyst_2017_2023.strava_activity`
),

with_pace AS (
  SELECT
    *,
    time_min / NULLIF(distance_km, 0) AS pace_min_per_km
  FROM base
  WHERE distance_km > 0
),

no_duplicate AS (
  SELECT DISTINCT * FROM with_pace
)

SELECT * FROM no_duplicate;
