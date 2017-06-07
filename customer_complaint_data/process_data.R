# Project name: Consumer Complaint Database
# Source: https://catalog.data.gov/dataset/consumer-complaint-database/resource/2f297213-7198-4be1-af1e-2d2623e7f6e9

# Purpose: clean and process the raw data.

# 1. Import data

# Load the raw data sets
setwd("Z:/brandin/projects/ccd/data")
cc <- read.csv('Consumer_Complaints.csv')
postal <- read.csv('us_postal_codes.csv')

# Create new column in the data frame of cc

# Format Zipcode such that the two data sets have the same format
library(stringr)
postal$Postal.Code <- str_pad(postal$Postal.Code, 5, pad = "0")

# Joint the two tables based on zipcodes
library(sqldf)
ccfull<- sqldf("SELECT cc.*, postal.*
FROM cc
LEFT JOIN postal
ON cc.`Zip.code` = postal.`Postal.Code`")

# Save complete data as CSV
write.csv(ccfull, "ccfull.csv")
