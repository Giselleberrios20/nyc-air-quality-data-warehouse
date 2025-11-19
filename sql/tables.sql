-- Create RAW air quality table
CREATE TABLE raw_air_quality (
    unique_id TEXT,
    indicator_id INT,
    name TEXT,
    measure TEXT,
    measure_info TEXT,
    geo_type_name TEXT,
    geo_join_id TEXT,
    geo_place_name TEXT,
    time_period TEXT,
    start_date TIMESTAMP,
    data_value FLOAT,
    message TEXT
);

-- Create PROCESSED air quality table
CREATE TABLE processed_air_quality (
    indicator_id INT,
    geo_place_name TEXT,
    time_period TEXT,
    avg_value FLOAT
);
