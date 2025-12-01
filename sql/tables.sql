CREATE TABLE dim_date (
    date_key SERIAL PRIMARY KEY,
    measurement_date DATE,
    year INT,
    quarter INT,
    month INT,
    day INT,
    time_period TEXT
);

CREATE TABLE dim_location (
    location_key SERIAL PRIMARY KEY,
    geo_type_name TEXT,
    geo_join_id TEXT,
    geo_place_name TEXT
);

CREATE TABLE dim_indicator (
    indicator_key SERIAL PRIMARY KEY,
    indicator_id INT,
    indicator_name TEXT,
    measure TEXT,
    measure_info TEXT
);

CREATE TABLE fact_air_quality (
    fact_id SERIAL PRIMARY KEY,
    date_key INT,
    location_key INT,
    indicator_key INT,
    data_value NUMERIC(10,2),
    data_value_rounded NUMERIC(10,1),
    air_quality_level TEXT
);

