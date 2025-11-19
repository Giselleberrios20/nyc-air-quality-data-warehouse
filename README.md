# NYC Air Quality Data Warehouse

This project is for Assignment 1. It includes data sourcing, data storage, and building a data warehouse model using the NYC Open Data Air Quality dataset.

## 1. Data Source
The data comes from NYC Open Data.  
Dataset: Air Quality  
Link: https://data.cityofnewyork.us/Environment/Air-Quality/c3uy-2p5r  
This dataset contains measurements of air quality indicators for different neighborhoods in New York City.

## 2. Data Dictionary
A full data dictionary is located in the folder:  
data_dictionary/  
It includes field names, descriptions, and data types.

## 3. Python Script
My script is in:  
src/process_data.py  

This script:  
Loads the raw CSV  
Selects useful columns  
Renames the columns  
Saves a cleaned file  
Uploads both files to Google Cloud Storage  

To run the script, install the package:  
pip install google-cloud-storage  

Then run the script:  
python src/process_data.py  

## 4. Storage Choice
I used Google Cloud Storage (GCS) to store my data.  
Bucket name: air-quality-data-giselle  

Files stored:  
air_quality_raw.csv  
air_quality_processed.csv  

The bucket is private.

## 5. Data Warehouse Model
This project uses a star schema with one fact table and three dimension tables.

### Dimension Tables

dim_date  
date_key  
time_period  
start_date  

dim_location  
location_key  
geo_type_name  
geo_join_id  
geo_place_name  

dim_indicator  
indicator_key  
indicator_id  
name  
measure  
measure_info  

### Fact Table

fact_air_quality  
fact_id  
unique_id  
indicator_key  
location_key  
date_key  
data_value  
message  

### Simple Diagram  
dim_indicator →  
                  \  
                   fact_air_quality  
                  /  
dim_location →  
dim_date →  

## 6. SQL Script
The SQL used to create the tables is stored in:  
sql/tables.sql  

## 7. Project Structure
nyc-air-quality-data-warehouse  
data  
data_dictionary  
sql/tables.sql  
src/process_data.py  
README.md  

## 8. Cloud Storage Location
Files are stored in:  
gs://air-quality-data-giselle/ 
