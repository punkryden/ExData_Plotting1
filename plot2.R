###################################################################
# Title : plot2.R
# Description : This script generate a plot of the Global Active 
# Power of an household during 2 days (2007-02-01 and 2007-02-02)
###################################################################

#
# 1. Extract the lines of 2007-02-01 and 2007-02-02 from household_power_consumption.txt data file
#

fileName <- file("household_power_consumption.txt")
colName <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
hpc <- read.table(text = grep("^[1,2]/2/2007", readLines(fileName), value = TRUE), col.names = colName , sep = ";", header = TRUE)

#
# 2. Add a Datetime column
#

hpc2 <- hpc
hpc2$Datetime <- as.POSIXct(paste(as.Date(hpc2$Date, format="%d/%m/%Y"), hpc2$Time))

#
# 3. Generate Plot 2
#

# Open png device
png(file = "plot2.png", bg="transparent")

# Plot 2 (Week of the day in French!)
plot(hpc2$Global_active_power~hpc2$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Turn off dev device
dev.off()