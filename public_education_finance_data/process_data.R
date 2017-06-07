# Project name: Public School System Finances 
# Source: https://www.census.gov/govs/school/historical_data.html

# Purpose: clean and process the raw data downloaded from the web site from 2005-2014.

# 1. Import data

# CHANGE THIS AS NEEDED:
setwd("C:/Users/brandin/code/projects/asssf/data")


asssf = NULL
for (i in 2005:2014){
  xname <- paste ("elsec",i,".txt",sep="")
  #yname <- paste ("y",i,sep="")
  ydata = read.csv(xname,row.names=NULL)
  ydata["YEAR"] = i
  if (! "A40" %in% colnames(ydata)) ydata["A40"] = NA
  if (! "U11" %in% colnames(ydata)) ydata["U11"] = NA
  if (! "U30" %in% colnames(ydata)) ydata["U30"] = NA
  if (! "U50" %in% colnames(ydata)) ydata["U50"] = NA
  if (! "J85" %in% colnames(ydata)) ydata["J85"] = NA
  if (! "C18" %in% colnames(ydata)) ydata["C18"] = NA
  
  a = sort(variable.names(ydata))
  writeLines(sprintf("Year %d => %d columns", i, length(a)))
  asssf <- rbind(asssf, ydata)
}


# Save complete data as CSV
write.csv(asssf, "asssf.csv")
