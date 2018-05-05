library(dplyr)
library(ggplot2)
library(stringr)
#load files
EI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 4 - Emissions from Coal Combustion Related Sources

# merge the two data sets 
NEISCC <- merge(EI, SCC, by="SCC")
rm(EI, SCC)
# Find word 'coal' in column 'EI.Sector'
coalRecord <- grepl(pattern = 'coal', x = NEISCC$EI.Sector , ignore.case = TRUE )

NEISCC_coal <- NEISCC[coalRecord,]

# Aggregate total emissions by year
aggregatedTotalByYear <- aggregate(Emissions ~ year  , NEISCC_coal , sum)

# Plot 4

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions/1000)) + 
  geom_bar(stat="identity", col = "green") +
  xlab("year") +
  ylab("Total PM 2.5 Emissions Mtonns") +
  ggtitle("US Emissions coal combustion-related sources from 1999 to 2008")
print(g)
png("plot4.png")
print(g)
dev.off()