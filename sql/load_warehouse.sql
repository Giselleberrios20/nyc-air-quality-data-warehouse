INSERT INTO dim_date (measurement_date, year, quarter, month, day, time_period)
SELECT DISTINCT
    measurement_date,
    year,
    quarter,
    month,
    day,
    time_period
FROM aq_transformed;

INSERT INTO dim_location (geo_type_name, geo_join_id, geo_place_name)
SELECT DISTINCT
    geo_type_name,
    geo_join_id,
    geo_place_name
FROM aq_transformed;

INSERT INTO dim_indicator (indicator_id, indicator_name, measure, measure_info)
SELECT DISTINCT
    indicator_id,
    indicator_name,
    measure,
    measure_info
FROM aq_transformed;

INSERT INTO fact_air_quality (
    date_key,
    location_key,
    indicator_key,
    data_value,
    data_value_rounded,
    air_quality_level
)
SELECT
    d.date_key,
    l.location_key,
    i.indicator_key,
    t.data_value,
    t.data_value_rounded,
    t.air_quality_level
FROM aq_transformed t
JOIN dim_date d
    ON t.measurement_date = d.measurement_date
JOIN dim_location l
    ON t.geo_type_name = l.geo_type_name
   AND t.geo_join_id = l.geo_join_id
   AND t.geo_place_name = l.geo_place_name
JOIN dim_indicator i
    ON t.indicator_id = i.indicator_id;
