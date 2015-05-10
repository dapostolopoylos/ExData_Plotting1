## In order not to have repeated code for downloading and subsettin data over and over again for each plot,
## i decided to do all the downloading/loading/subsetting of the data in a separate script named loadData.R
## which i will call in the beginning of each and everyone of my plot scripts.

## Call loadData.R in order to use the power consumption data in my plot.
source("loadData.R")

## Make a powCons copy named plot1.
plot1<-powCons

## Convert to numeric in order to use the column in the plot.
plot1$Global_active_power <- as.numeric(plot1$Global_active_power)

## Initialize a png file with certain name and dimensions.
png(file="plot1.png",width=480,height=480)

## Create a histogramm with certain characteristics as requested.
hist(plot1$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

## Close the png device.
dev.off()

## Delete temp data frame plot1.
rm(plot1)

