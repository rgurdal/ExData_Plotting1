#plot4

library(lubridate)

#Read the data for just the dates required
feb1and2 <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?") [66637:69516,]

# Find weekdays
datetime <- strptime(paste(feb1and2$Date, feb1and2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#Open the plotting device
png(file= "plot4.png")

#Make the plots
par(mfrow = c(2,2))
#1
plot(datetime, feb1and2$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
#2
plot(datetime, feb1and2$Voltage, type = "l", xlab="datetime", ylab="Voltage")
#3
with(feb1and2, plot(datetime, Sub_metering_1, type = "l", col="black", xlab="", ylab="Energy sub metering"))
with(feb1and2, lines(datetime, Sub_metering_2, type = "l", col="red"))
with(feb1and2, lines(datetime, Sub_metering_3, type = "l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
plot(datetime, feb1and2$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")



#Close the plotting device
dev.off()

#Report
cat("Plot4.png has been saved in", getwd())