#plot2  

library(lubridate)

#Read the data for just the dates required
feb1and2 <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?") [66637:69516,]


# Find weekdays
datetime <- strptime(paste(feb1and2$Date, feb1and2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#Open the plotting device
png(file= "plot2.png")


#Make the plot
plot(datetime, feb1and2$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")


#Close the plotting device
dev.off()


#Report
cat("Plot2.png has been saved in", getwd())