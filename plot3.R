## In order not to have repeated code for downloading and subsettin data over and over again for each plot,
## i decided to do all the downloading/loading/subsetting of the data in a separate script named loadData.R
## which i will call in the beginning of each and everyone of my plot scripts.

## Call loadData.R in order to use the power consumption data in my plot.
source("loadData.R")

## Make a powCons copy named plot3.
plot3<-powCons

## Convert to numeric in order to use the column in the plot.
plot3$Sub_metering_1 <- as.numeric(plot3$Sub_metering_1)
plot3$Sub_metering_2 <- as.numeric(plot3$Sub_metering_2)

## Create a new datetime field with certain format.
plot3$DateTime <- strptime(paste(plot3$Date,plot3$Time),format="%d/%m/%Y %H:%M:%S", tz="America/Chicago")

## Set locale in order to get english day names in my plot.
Sys.setlocale(category = "LC_ALL", locale = "English")

## Initialize a png file with certain name and dimensions.
png(file="plot3.png",width=480,height=480)

## Create a plot with certain characteristics as requested for my first measure (Sub_metering_1).
plot(plot3$DateTime, plot3$Sub_metering_1, type= "l",xlab = "",ylab = "Energy sub metering",col="black")

## Add lines to the plot, one for each of the other measures (Sub_metering_2, Sub_metering_3).
lines(plot3$DateTime, plot3$Sub_metering_2, col="red")
lines(plot3$DateTime, plot3$Sub_metering_3, col="blue")

## Add a legend to the plot.
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close the png device.
dev.off()

## Delete temp data frame plot3.
rm(plot3)