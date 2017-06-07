# Project name: HADS
# American Housing Survey: Housing Affordability Data System
# Source: https://www.huduser.gov/portal/datasets/hads/hads.html

# Purpose: clean and process the raw data downloaded from huduser.gov, years 1985-2013.

# 1. Import data

# CHANGE THIS AS NEEDED:
setwd("C:/Users/brandin/code/projects/hads/text")

y2013 = read.csv("hads2013.txt")
y2003 = read.csv("hads2003.txt")

variable.names(y2003)
variable.names(y2013)
a = sort(variable.names(y2003))
b = sort(variable.names(y2013))

# Check if all variables of data sets are the same.
a == b # TRUE

# Add YEAR to each data frame
y2013["YEAR"] = 2013
y2003["YEAR"] = 2003


# Merge data sets
hads <- rbind(y2003, y2013)

# Save complete data as CSV
write.csv(hads, "hads.csv")
