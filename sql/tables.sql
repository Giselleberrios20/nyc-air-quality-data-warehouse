CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    time_period TEXT,
    start_date DATE
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
    name TEXT,
    measure TEXT,
    measure_info TEXT
);

CREATE TABLE fact_air_quality (
    fact_id SERIAL PRIMARY KEY,
    unique_id TEXT,
    indicator_key INT,
    location_key INT,
    date_key INT,
    data_value FLOAT,
    message TEXT,
    FOREIGN KEY (indicator_key) REFERENCES dim_indicator(indicator_key),
    FOREIGN KEY (location_key) REFERENCES dim_location(location_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);
