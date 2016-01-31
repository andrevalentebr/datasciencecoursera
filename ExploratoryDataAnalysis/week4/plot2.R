# QUESTION 2
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Define a pasta pardão e descompacta o arquivo 
setwd("/home/andre/R/datasciencecoursera/ExploratoryDataAnalysis/week4")
unzip("./data/exdata-data-NEI_data.zip", exdir = "./data/")
# Carrega os dados 
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
# Select only Baltimore City in Maryland
NEIbaltimore <- NEI[NEI$fips=="24510",]
# Aggregate by sum the total emissions by year
agg <- aggregate(Emissions ~ year,NEIbaltimore, sum)
#
# plot line
png("plot2.png",width=480,height=480,units="px") # bg="transparent"
plot(agg, type = "l", xlab = "Year", 
     main = expression('PM'[2.5]*" Emissions in Baltimore City Maryland (1999-2008)"), 
     ylab = expression('Total PM'[2.5]*" Emissions"))
dev.off()
#
# plot bar
png("plot2a.png",width=480,height=480,units="px")
barplot(agg$Emissions, names.arg=agg$year, xlab="Year",
        main=expression('PM'[2.5]*" Emissions in Baltimore City Maryland (1999-2008)"),
        ylab=expression('Total PM'[2.5]*" Emissions"),
        )
dev.off()


