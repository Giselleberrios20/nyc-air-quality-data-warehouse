# Assignment 2 Data Dictionary  
Dataset: NYC Air Quality  

## aq_transformed

| Field Name | Data Type | Description | Source Column | Destination Column |
|------------|-----------|-------------|----------------|---------------------|
| measurement_date | DATE | Date of the measurement | start_date | measurement_date |
| year | INT | Year from date | start_date | year |
| quarter | INT | Quarter from date | start_date | quarter |
| month | INT | Month from date | start_date | month |
| day | INT | Day from date | start_date | day |
| unique_id | TEXT | Unique record identifier | unique_id | unique_id |
| indicator_id | INT | Type of measured value | indicator_id | indicator_id |
| indicator_name | TEXT | Name of the indicator | name | indicator_name |
| measure | TEXT | How the indicator is measured | measure | measure |
| measure_info | TEXT | Measurement units and info | measure_info | measure_info |
| geo_type_name | TEXT | Geography type | geo_type_name | geo_type_name |
| geo_join_id | TEXT | Geographic join ID | geo_join_id | geo_join_id |
| geo_place_name | TEXT | Geographic place name | geo_place_name | geo_place_name |
| time_period | TEXT | Time period description | time_period | time_period |
| data_value | NUMERIC(10,2) | Actual air quality value | data_value | data_value |
| message | TEXT | Notes about the data value | message | message |
| air_quality_level | TEXT | Air quality category | data_value | air_quality_level |
| data_value_rounded | NUMERIC(10,1) | Rounded air quality value | data_value | data_value_rounded |

## aq_yearly_summary

| Field Name | Data Type | Description | Source Column | Destination Column |
|------------|-----------|-------------|----------------|---------------------|
| year | INT | Year of measurement | year | year |
| geo_type_name | TEXT | Geography type | geo_type_name | geo_type_name |
| geo_join_id | TEXT | Geographic join ID | geo_join_id | geo_join_id |
| geo_place_name | TEXT | Geographic place name | geo_place_name | geo_place_name |
| indicator_id | INT | Type of measured value | indicator_id | indicator_id |
| indicator_name | TEXT | Name of the indicator | indicator_name | indicator_name |
| total_data_value | NUMERIC(12,2) | Total yearly air quality value | data_value | total_data_value |
| avg_data_value | NUMERIC(10,2) | Average yearly air quality value | data_value | avg_data_value |

