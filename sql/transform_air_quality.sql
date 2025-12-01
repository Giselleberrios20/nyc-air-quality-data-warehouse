DROP TABLE IF EXISTS aq_transformed;

CREATE TABLE aq_transformed AS
SELECT DISTINCT
    CAST(start_date AS DATE) AS measurement_date,
    EXTRACT(YEAR FROM CAST(start_date AS DATE)) AS year,
    EXTRACT(QUARTER FROM CAST(start_date AS DATE)) AS quarter,
    EXTRACT(MONTH FROM CAST(start_date AS DATE)) AS month,
    EXTRACT(DAY FROM CAST(start_date AS DATE)) AS day,
    unique_id,
    indicator_id,
    name AS indicator_name,
    measure,
    measure_info,
    geo_type_name,
    geo_join_id,
    geo_place_name,
    time_period,
    data_value,
    message,
    CASE
        WHEN data_value IS NULL THEN 'Unknown'
        WHEN data_value < 10 THEN 'Very Low'
        WHEN data_value < 25 THEN 'Low'
        WHEN data_value < 40 THEN 'Moderate'
        WHEN data_value < 60 THEN 'High'
        ELSE 'Very High'
    END AS air_quality_level,
    ROUND(data_value, 1) AS data_value_rounded
FROM nyc_air_quality_raw
WHERE start_date IS NOT NULL
  AND data_value IS NOT NULL;

ALTER TABLE aq_transformed
    ALTER COLUMN indicator_id TYPE INTEGER,
    ALTER COLUMN data_value TYPE NUMERIC(10,2),
    ALTER COLUMN data_value_rounded TYPE NUMERIC(10,1);

DROP TABLE IF EXISTS aq_yearly_summary;

CREATE TABLE aq_yearly_summary AS
SELECT
    year,
    geo_type_name,
    geo_join_id,
    geo_place_name,
    indicator_id,
    indicator_name,
    SUM(data_value) AS total_data_value,
    AVG(data_value) AS avg_data_value
FROM aq_transformed
GROUP BY
    year,
    geo_type_name,
    geo_join_id,
    geo_place_name,
    indicator_id,
    indicator_name;
