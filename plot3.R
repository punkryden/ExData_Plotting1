###################################################################
# Title : plot3.R
# Description : This script generate a plot of the three sub  
# metering energy of an household during 2 days (2007-02-01 and 2007-02-02)
###################################################################

#
# 1. Extract the lines of 2007-02-01 and 2007-02-02 from household_power_consumption.txt data file
#

fileName <- file("household_power_consumption.txt")
colName <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
hpc <- read.table(text = grep("^[1,2]/2/2007", readLines(fileName), value = TRUE), col.names = colName , sep = ";", header = TRUE)

#
# 2. Add a datetime column
#

hpc2 <- hpc
hpc2$datetime <- as.POSIXct(paste(as.Date(hpc2$Date, format="%d/%m/%Y"), hpc2$Time))

#
# 3. Generate Plot 3
#

# Open png device
png(file = "plot3.png", bg="transparent")

# Plot 3 (Week of the day in French!)
with(hpc2, {
plot(Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="") 
lines(Sub_metering_2~datetime, col="red")
lines(Sub_metering_3~datetime, col="blue")
})

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)

# Turn off dev device
dev.off()