#plot3 

library(lubridate)

#Read the data for just the dates required
feb1and2 <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?") [66637:69516,]


# Find weekdays
datetime <- strptime(paste(feb1and2$Date, feb1and2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#Open the plotting device
png(file= "plot3.png")


#Make the plot
with(feb1and2, plot(datetime, Sub_metering_1, type = "l", col="black", xlab="", ylab="Energy sub metering"))
with(feb1and2, lines(datetime, Sub_metering_2, type = "l", col="red"))
with(feb1and2, lines(datetime, Sub_metering_3, type = "l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#Close the plotting device
dev.off()


#Report
cat("Plot3.png has been saved in", getwd())