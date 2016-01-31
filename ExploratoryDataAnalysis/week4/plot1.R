# QUESTION 1
# Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, make a plot showing 
# the total PM2.5 emission from all sources for each of the years
# 1999, 2002, 2005, and 2008.

# Define a pasta pardão e descompacta o arquivo 
setwd("/home/andre/R/datasciencecoursera/ExploratoryDataAnalysis/week4")
unzip("./data/exdata-data-NEI_data.zip", exdir = "./data/")
# Carrega os dados 
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Aggregate by sum the total emissions by year
agg <- aggregate(Emissions ~ year,NEI, sum)
# adjust scale
agg$Emissions <- round((agg$Emissions / 10^6),2)
#
# plot line
png("plot1.png",width=480,height=480,units="px") # bg="transparent"
plot(agg, type = "l", xlab = "Year", 
     main = expression('PM'[2.5]*" Emissions in USA (1999-2008)"), 
     ylab = expression('Total PM'[2.5]*" Emissions (10^6 Tons)"))
dev.off()
# plot bar
png("plot1a.png",width=480,height=480,units="px")
barplot(agg$Emissions, names.arg=agg$year, xlab="Year",
    ylab=expression('Total PM'[2.5]*" Emissions (10^6 Tons)"),
    main=expression('PM'[2.5]*" Emissions in USA (1999-2008)"))
dev.off()