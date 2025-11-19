import pandas as pd

#Load the RAW dataset
raw = pd.read_csv("../data/raw/air_quality_raw.csv")

#Clean
processed = raw[[
    "indicator_id",
    "geo_place_name",
    "time_period",
    "data_value"
]].copy()

#Rename columns
processed.rename(columns={
    "geo_place_name": "neighborhood",
    "data_value": "avg_value"
}, inplace=True)

#Save cleaned file into /data/processed
processed.to_csv("../data/processed/air_quality_processed.csv", index=False)

print("Processing complete! Saved to /data/processed/air_quality_processed.csv")
