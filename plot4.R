## In order not to have repeated code for downloading and subsettin data over and over again for each plot,
## i decided to do all the downloading/loading/subsetting of the data in a separate script named loadData.R
## which i will call in the beginning of each and everyone of my plot scripts.

## Call loadData.R in order to use the power consumption data in my plot.
source("loadData.R")

## Make a powCons copy named plot4
plot4 <- powCons

## Convert to numeric in order to use the columns in the plot.
plot4$Global_active_power <- as.numeric(plot4$Global_active_power)
plot4$Voltage <- as.numeric(plot4$Voltage)
plot4$Global_reactive_power <- as.numeric(plot4$Global_reactive_power)
plot4$Sub_metering_1 <- as.numeric(plot4$Sub_metering_1)
plot4$Sub_metering_2 <- as.numeric(plot4$Sub_metering_2)

## Create a new datetime field with certain format.
plot4$DateTime <- strptime(paste(plot4$Date,plot4$Time),format="%d/%m/%Y %H:%M:%S", tz="America/Chicago")

## Set locale in order to get english day names in my plot.
Sys.setlocale(category = "LC_ALL", locale = "English")

## Initialize a png file with certain name and dimensions.
png(file="plot4.png",width=480,height=480)

## Det the presentation of the plots to be a 2x2 grid.
par(mfrow=c(2,2))

## Create the first plot.
plot(plot4$DateTime, plot4$Global_active_power, type = "l",xlab = "",ylab = "Global Active Power")

## Create the second plot.
plot(plot4$DateTime, plot4$Voltage, type = "l",xlab = "datetime",ylab = "Voltage")

## Create the third plot.
plot(plot4$DateTime, plot4$Sub_metering_1, type= "l",xlab = "",ylab = "Energy sub metering",col="black")
## Add lines to the third plot.
lines(plot4$DateTime, plot4$Sub_metering_2, col="red")
lines(plot4$DateTime, plot4$Sub_metering_3, col="blue")
## Add legend to the third plot.
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create the fourth plot.
plot(plot4$DateTime, plot4$Global_reactive_power, type = "l",xlab = "datetime",ylab = "Global_reactive_power")

## Close the png device.
dev.off()

## Delete temp data frame plot4.
rm(plot4)