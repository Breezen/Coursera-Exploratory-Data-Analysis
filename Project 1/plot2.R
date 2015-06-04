# Loading the dataset
data<- read.csv("./Data/household_power_consumption.txt", header = T, sep = ';', na.strings = "?", 
                nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Create plot2
plot(data$Global_active_power~data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, "plot2.png", height = 480, width = 480)
dev.off()