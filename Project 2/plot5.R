NEI <- readRDS("./Data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./Data/exdata-data-NEI_data/Source_Classification_Code.rds")

onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')
sum <- aggregate(onroad[, 'Emissions'], by = list(onroad$year), sum)
colnames(sum) <- c('year', 'Emissions')

library(ggplot2)
png('plot5.png')
ggplot(data = sum, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year), stat = "identity") + guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = 2))
dev.off()