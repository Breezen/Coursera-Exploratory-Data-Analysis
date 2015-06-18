NEI <- readRDS("./Data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./Data/exdata-data-NEI_data/Source_Classification_Code.rds")

Baltimore <- subset(NEI, fips == 24510)

png(filename = 'plot2.png')
barplot(tapply(X = Baltimore$Emissions, INDEX = Baltimore$year, FUN = sum), main = 'Total Emission in Baltimore City, Maryland', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()