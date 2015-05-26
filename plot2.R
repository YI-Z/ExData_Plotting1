## This file creates plot2.png

## Read in data
data <- read.table("household_power_consumption.txt", header=T, sep = ";", na.strings = "?", stringsAsFactors = F)
## use dplyr package for data manipulation
require(dplyr)  
## filter data only contains date from 2007-02-01 to 2007-02-02
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
## format Date and Time
data <- mutate(data, datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))



## create plot2 using base plotting system
png("plot2.png", width = 480, height = 480, bg = "transparent")
with(data, plot(datetime, Global_active_power, "l", xlab = "", ylab = "Global Acive Power (kilowatts)") )
dev.off()