# Parial code for Assignment 1 of Exploratory Data Analysis (Coursera)
# This script takes data on power consumption "household_power_consumption.txt" from the local directory, formats the date and time fields and then produces a histogram in a png file.

setwd('/Users/Mark/Dropbox/School/Exploratory Data Analysis Coursera/Assignment 1/')
# library(data.table)

hpc <- read.table("household_power_consumption.txt", na.string = "?", skip = 66637, nrow = 2880, sep = ";",                col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE, sep=";")))
hpc$DateTime <- paste(hpc$Date,hpc$Time, sep = " ")
hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")
png("plot1.png")
with(hpc,(hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")))
dev.off()