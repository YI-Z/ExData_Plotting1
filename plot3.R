## This file creates plot3.png

## Read in data
data <- read.table("household_power_consumption.txt", header=T, sep = ";", na.strings = "?", stringsAsFactors = F)
## use dplyr package for data manipulation
require(dplyr)  
## filter data only contains date from 2007-02-01 to 2007-02-02
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
## format Date and Time
data <- mutate(data, datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))



## create plot3 using base plotting system
png("plot3.png", width = 480, height = 480, bg = "transparent")
## plot the image
with(data, plot(datetime, Sub_metering_1, "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(data, lines(datetime, Sub_metering_2, "l", col = "red"))
with(data, lines(datetime, Sub_metering_3, "l", col = "blue"))
## adding legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

dev.off()