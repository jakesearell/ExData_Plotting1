# Exploratory data analysis wk. 1
# Peer-graded Assignment: Course Project 1
# Plot 2

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

# paste date and time cols together
Date_Time <- paste(hpc$Date, hpc$Time)
hpc <- cbind(hpc, Date_Time)

# convert date col from chr to date class
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y") 

# convert date_time col from chr to POSIXct class
hpc$Date_Time <- as.POSIXct(hpc$Date_Time, format = "%d/%m/%Y %H:%M:%S") 

# subset the data to only include relevant dates
dt <- hpc[Date %between% c("2007-02-01", "2007-02-02")]

# specify file format and file name for exporting plot - additional args for width and height
png("plot2.png", width = 480, height = 480)

# plot graph
plot(dt$Date_Time, dt$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# switch device off to output plot
dev.off()



