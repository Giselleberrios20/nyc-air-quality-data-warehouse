import pandas as pd
from google.cloud import storage

# Load Data

raw = pd.read_csv("../data/raw/air_quality_raw.csv")

# Clean

processed = raw[[
    "indicator_id",
    "geo_place_name",
    "time_period",
    "data_value"
]].copy()

processed.rename(columns={
    "geo_place_name": "neighborhood",
    "data_value": "avg_value"
}, inplace=True)

# Save cleaned
processed.to_csv("../data/processed/air_quality_processed.csv", index=False)

print("Processing complete: Saved to /data/processed/air_quality_processed.csv")

# GOOGLE CLOUD STORAGE

def upload_to_gcs(bucket_name, local_file_path, destination_blob_name):
    """Uploads a local file to a Google Cloud Storage bucket"""
    client = storage.Client()
    bucket = client.bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)
    
    blob.upload_from_filename(local_file_path)
    print(f"Uploaded {local_file_path} to gs://{bucket_name}/{destination_blob_name}")

# Upload RAW file
upload_to_gcs(
    bucket_name="air-quality-data-giselle",
    local_file_path="../data/raw/air_quality_raw.csv",
    destination_blob_name="air_quality_raw.csv"
)

# Upload PROCESSED file
upload_to_gcs(
    bucket_name="air-quality-data-giselle",
    local_file_path="../data/processed/air_quality_processed.csv",
    destination_blob_name="air_quality_processed.csv"
)

print("Uploads to Google Cloud Complete :) ")
