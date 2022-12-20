# Exploratory data analysis wk. 1
# Peer-graded Assignment: Course Project 1
# Plot 1

# load packages 
library(tidyverse)
library(data.table)

# set working directory
setwd("/Users/jakesearell/Documents/GitHub/ExData_Plotting1/")

# check file size
file.size("./household_power_consumption.txt")

# read in text file
hpc <- fread("./household_power_consumption.txt", col.names = c("Date", "Time", "Global_active_power",
                                                                "Global_reactive_power", "Voltage",
                                                                "Global_intensity", "Sub_metering_1",
                                                                "Sub_metering_2", "Sub_metering_3"))

# convert date and time col classes from chr to date and time respectively
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y") 
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

# subset the data to only include relevant dates
dt <- hpc[Date %between% c("2007-02-01", "2007-02-02")]

# specify file format for exporting plot - additional args for width and height
png("plot1.png", width = 480, height = 480)

# plot histogram
hist(dt$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# switch device off to output plot
dev.off()
