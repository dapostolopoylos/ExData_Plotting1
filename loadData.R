## Load package  sqldf that will be used in data subsetting
library(sqldf)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## Check if thw default data directory exists, if not create it.
if(!file.exists("./data")){
    dir.create("./data")
}

## Check if the power consumption file has been downloaded, if not download it.
if(!file.exists("./data/exdata-data-household_power_consumption.zip")){
    download.file(url,destfile="./data/exdata-data-household_power_consumption.zip",quiet=TRUE,mode="wb")
}

## Check if the power consumption file has been unzipped, if not unzip it.
if(!file.exists("./data/household_power_consumption.txt")){
    setwd("./data")
    unzip("exdata-data-household_power_consumption.zip", unzip = "internal")
    setwd("G:/Data Sciense Specialization/Exploratory Data Analysis/Week 1")
}
                     
## Load power consumption data in R 
powCons <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

## Select only the observations from the following dates: '1/2/2007','2/2/2007'
powCons <- sqldf("select * from powCons where powCons.Date in ('1/2/2007','2/2/2007')")
