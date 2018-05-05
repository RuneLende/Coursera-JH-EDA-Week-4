#Of the four types of sources indicated by the 
#type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions
#from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

#Load files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)
# Plot 3 - using ggplot

baltimore_emission_by_type <- NEI %>% filter(fips == 24510) %>% group_by(year,type) %>% summarise(total = sum(Emissions)/1000)
baltimore_emission_by_type$year <- as.factor(baltimore_emission_by_type$year)
ggplot(baltimore_emission_by_type, aes(x = year, y = total)) + geom_bar(stat = "identity", fill = "green") + facet_grid(.~type) + ggtitle("Baltimore Emissions (PM2.5)") + labs(x = "Year", y = "Total Emissions (PM2.5) Mtons") + ggtitle("Emissions (PM2.5) Baltimore City per Type")
png("plot3.png")
ggplot(baltimore_emission_by_type, aes(x = year, y = total)) + geom_bar(stat = "identity", fill = "green") + facet_grid(.~type) + ggtitle("Baltimore Emissions (PM2.5)") + labs(x = "Year", y = "Total Emissions (PM2.5) Mtons") + ggtitle("Emissions (PM2.5) Baltimore City per Type")
dev.off()