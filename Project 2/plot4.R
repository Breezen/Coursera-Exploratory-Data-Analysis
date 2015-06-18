NEI <- readRDS("./Data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./Data/exdata-data-NEI_data/Source_Classification_Code.rds")

coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]
merge <- merge(x = NEI, y = coal, by = 'SCC')
sum <- aggregate(merge[, 'Emissions'], by = list(merge$year), sum)
colnames(sum) <- c('Year', 'Emissions')

library(ggplot2)
png('plot4.png')
ggplot(data = sum, aes(x = Year, y = Emissions / 1000)) + geom_line(aes(group = 1, col = Emissions)) + geom_point(aes(size = 2, col = Emissions)) + ggtitle(expression('Total Emissions of PM'[2.5])) + ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + geom_text(aes(label = round(Emissions / 1000, digits = 2), size = 2, hjust = 1.5, vjust = 1.5)) + theme(legend.position = 'none') + scale_colour_gradient(low = 'black', high = 'red')
dev.off()