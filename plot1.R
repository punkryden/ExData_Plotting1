###################################################################
# Title : plot1.R
# Description : This script generate an histo of the Global Active 
# Power of an household during 2 days (2007-02-01 and 2007-02-02)
###################################################################

#
# 1. Extract the lines of 2007-02-01 and 2007-02-02 from household_power_consumption.txt data file
#

fileName <- file("household_power_consumption.txt")
colName <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
hpc <- read.table(text = grep("^[1,2]/2/2007", readLines(fileName), value = TRUE), col.names = colName , sep = ";", header = TRUE)

#
# 2. Generate Plot 1
#

# Open png device
png(file = "plot1.png", bg="transparent")

# Plot 1
hist(hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# Turn off dev device
dev.off()