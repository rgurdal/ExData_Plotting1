#plot1

#Read the data for just the dates (lines) required
feb1and2 <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?") [66637:69516,]

#Open the plotting device
png(file= "plot1.png")

#Make the plot
hist(feb1and2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close the plotting device
dev.off()

#Report
cat("Plot1.png has been saved in", getwd())
