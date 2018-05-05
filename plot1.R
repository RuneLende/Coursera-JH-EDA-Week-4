#Load file
NEI <- readRDS("summarySCC_PM25.rds")

# Base plotting system

annual_emissions <- group_by(NEI, year) %>% summarise(total = sum(Emissions)/1000)
barplot(annual_emissions$total, names.arg = c("1999", "2002", "2005", "2008"), ylab = "Emissions PM2.5 (Mtons)", xlab = "Year", col = "green", main = "Total Emissions (PM 2.5) in Mtonns")

png("plot1.png")
barplot(annual_emissions$total, names.arg = c("1999", "2002", "2005", "2008"), ylab = "Emissions PM2.5 (Mtons)", xlab = "Year", col = "green", main = "Total Emissions (PM 2.5) in Mtonns")
dev.off()