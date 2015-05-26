## This file creates plot4.png

## Read in data
data <- read.table("household_power_consumption.txt", header=T, sep = ";", na.strings = "?", stringsAsFactors = F)
## use dplyr package for data manipulation
require(dplyr)  
## filter data only contains date from 2007-02-01 to 2007-02-02
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
## format Date and Time
data <- mutate(data, datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))



## create plot4 using base plotting system
png("plot4.png", width = 480, height = 480, bg = "transparent")
## setting the layout
par(mfrow = c(2, 2))

## plot  image1
with(data, plot(datetime, Global_active_power, "l", xlab = "", ylab = "Global Acive Power (kilowatts)"))

## plot image2
with(data, plot(datetime, Voltage, "l"))

## plot image3
with(data, plot(datetime, Sub_metering_1, "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(data, lines(datetime, Sub_metering_2, "l", col = "red"))
with(data, lines(datetime, Sub_metering_3, "l", col = "blue"))
## adding legend
legend("topright", bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

## plot image4
with(data, plot(datetime, Global_reactive_power, "l"))
dev.off()