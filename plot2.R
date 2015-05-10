## In order not to have repeated code for downloading and subsettin data over and over again for each plot,
## i decided to do all the downloading/loading/subsetting of the data in a separate script named loadData.R
## which i will call in the beginning of each and everyone of my plot scripts.

## Call loadData.R in order to use the power consumption data in my plot.
source("loadData.R")

## Make a powCons copy named plot2.
plot2<-powCons

## Convert to numeric in order to use the column in the plot.
plot2$Global_active_power <- as.numeric(plot2$Global_active_power)

## Create a new datetime field with certain format.
plot2$DateTime <- strptime(paste(plot2$Date,plot2$Time),format="%d/%m/%Y %H:%M:%S", tz="America/Chicago")

## Set locale in order to get english day names in my plot.
Sys.setlocale(category = "LC_ALL", locale = "English")

## Initialize a png file with certain name and dimensions.
png(file="plot2.png",width=480,height=480)

## Create a line plot as requested.
plot(plot2$DateTime, plot2$Global_active_power, type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

## Close the png device.
dev.off()

## Delete temp data frame plot2.
rm(plot2)