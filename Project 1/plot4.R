# Loading the dataset
data<- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# set env para
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# Create plots
with(data, {
    plot(data$Datetime, data$Global_active_power, type = "l",
         ylab = "Global Active Power (kilowatts)", xlab = "")
    plot(data$Datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    x <- data$Datetime
    y1 <- data$Sub_metering_1
    y2 <- data$Sub_metering_2
    y3 <- data$Sub_metering_3
    plot(x, y1, type = "n", ylab="Energy sub metering", xlab="")
    lines(x, y1, type = "l", col = "black")
    lines(x, y2, type = "l", col = "red")
    lines(x, y3, type = "l", col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty="n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(data$Datetime, data$Global_reactive_power, type = "l",
         ylab = "Global_reactive_power", xlab = "datetime")
})

# Save png
dev.copy(png, "plot4.png", height = 480, width = 480)
dev.off()