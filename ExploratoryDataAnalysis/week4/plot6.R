# QUESTION 6
# Compare emissions from motor vehicle sources in Baltimore City with
# emissions from motor vehicle sources in Los Angeles County, California
# (fips == "06037"). Which city has seen greater changes over time in
# motor vehicle emissions?
#
# Define a pasta pardão e descompacta o arquivo 
setwd("/home/andre/R/datasciencecoursera/ExploratoryDataAnalysis/week4")
unzip("./data/exdata-data-NEI_data.zip", exdir = "./data/")
# Carrega os dados 
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
# Select only Baltimore City in Maryland and ON-ROAD in NEI type
data <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD",]
#
# Aggregate by sum the total emissions by year
agg <- aggregate(Emissions ~ year,NEIb, sum)
