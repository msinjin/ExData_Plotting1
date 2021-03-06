# Parial code for Assignment 1 of Exploratory Data Analysis (Coursera)
# This script takes data on power consumption "household_power_consumption.txt" from the local directory, formats the date and time fields and then produces a four-pane plot in a png file.

setwd('/Users/Mark/Dropbox/School/Exploratory Data Analysis Coursera/Assignment 1/')
# library(data.table)

hpc <- read.table("household_power_consumption.txt",  na.string = "?", skip = 66637, nrow = 2880, sep = ";",                col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE, sep=";")))
hpc$DateTime <- paste(hpc$Date,hpc$Time, sep = " ")
hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfrow = c(2,2))
with(hpc,{
        plot(DateTime, Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
        plot(DateTime, Voltage, type = "l", main = "", xlab = "datetime", ylab = "Voltage")
        plot(DateTime, Sub_metering_1, col = "black", type = "l", main = "", xlab = "", ylab = "Energy sub metering")
        lines(DateTime, Sub_metering_2, col = "red")
        lines(DateTime, Sub_metering_3, col = "blue")
        legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black","red","blue"), bty = "n" )
        plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()