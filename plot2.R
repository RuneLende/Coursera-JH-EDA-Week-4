NEI <- readRDS("summarySCC_PM25.rds")
library(dplyr)
# Plot 2 - Barplot

baltimore_emission <- NEI %>% filter(fips == 24510) %>% group_by(year) %>% summarise(total = sum(Emissions)/1000)
barplot(baltimore_emission$total, names.arg = c("1999", "2002","2005",  "2008"), xlab = "Year", ylab = "Emissions PM2.5 (Mtons)", main = "Baltimore Annual Emissions (PM 2.5) in Mtonns", col = "green", ylim = c(0, 3.8))

png("plot2.png")
barplot(baltimore_emission$total, names.arg = c("1999", "2002", "2005",  "2008"), xlab = "Year", ylab = "Emissions PM2.5 (Mtons)", main = "Baltimore Annual Emissions (PM 2.5) in Mtonns", col = "green", ylim = c(0, 3.8))
dev.off()