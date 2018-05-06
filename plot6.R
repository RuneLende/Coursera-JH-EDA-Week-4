library(dplyr)
library(ggplot2)
library(stringr)
#load files
EI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 5 - Motoremissio
# Only Baltimore is of interest..
baltimore_veh <- EI %>% filter(fips=="24510")


# Extracting sources related to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC

# The set related to Baltimore and vehicles
baltimore_vehiclesEI <- baltimore_veh[baltimore_veh$SCC %in% vehiclesSCC,]

# Grouping by year and finding the total
motor_emissions <- baltimore_vehiclesEI  %>% group_by(year) %>% summarise(total = sum(Emissions))

barplot(motor_emissions$total, names.arg = c("1999", "2002", "2005", "2008"), 
        ylab = "Emission", xlab = "Year", col = "blue", main = "Change in emission for motor vehicle in Baltimore City")

png("plot5.png")
barplot(motor_emissions$total, names.arg = c("1999", "2002", "2005", "2008"), 
        ylab = "Emission", xlab = "Year", col = "blue", main = "Change in emission for motor vehicle in Baltimore City")
dev.off()