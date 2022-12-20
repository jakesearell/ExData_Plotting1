# Exploratory data analysis wk. 1
# Peer-graded Assignment: Course Project 1
# Plot 4 

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

# convert date from chr to date
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y") 

# convert date_time col from chr to POSIXct 
hpc$Date_Time <- as.POSIXct(hpc$Date_Time, format = "%d/%m/%Y %H:%M:%S") 

# subset the data to only include relevant dates
dt <- hpc[Date %between% c("2007-02-01", "2007-02-02")]

# specify file format for exporting plot - additional args for width and height
png("plot4.png", width = 480, height = 480)

# plot histogram
par(mfrow = c(2, 2)) 
with(dt, {
  # 1
  plot(dt$Date_Time, dt$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  # 2
  plot(dt$Date_Time, dt$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  # 3
  plot(dt$Date_Time, dt$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  points(dt$Date_Time, dt$Sub_metering_2, type = "l", col = "red")
  points(dt$Date_Time, dt$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # 4
  plot(dt$Date_Time, dt$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# switch device off to output plot
dev.off()



