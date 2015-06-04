# Loading the dataset
data<- read.csv("./Data/household_power_consumption.txt", header = T, sep = ';', na.strings = "?", 
                nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create plot1 on screen device
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

# Save plot1 to plot1.png
dev.copy(png, "plot1.png", height = 480, width = 480)
dev.off()