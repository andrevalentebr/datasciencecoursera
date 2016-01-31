# QUESTION 3
# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these four sources
# have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system to make a plot answer this question.
#
# Define a pasta pardão e descompacta o arquivo 
setwd("/home/andre/R/datasciencecoursera/ExploratoryDataAnalysis/week4")
unzip("./data/exdata-data-NEI_data.zip", exdir = "./data/")
# Carrega os dados 
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
# Select only Baltimore City in Maryland
NEIbaltimore <- NEI[NEI$fips=="24510",]
#
agg <- aggregate(Emissions ~ year + type, NEIbaltimore, sum)
#
library(ggplot2)
# plot line
png("plot3.png",width=640,height=480,units="px") # bg="transparent"
g <- ggplot(NEIbaltimore, aes(year, Emissions, color = type))
g <- g + geom_point(stat = "summary", fun.y = "sum") +
    geom_line(stat = "summary", fun.y = "sum") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle(expression('PM'[2.5]*" Emissions in Baltimore City Maryland (1999-2008)"))
print(g)
dev.off()
#
# plot bar
png("plot3a.png",width=640,height=480,units="px")
g <- ggplot(NEIbaltimore,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~type,scales = "free",space="free") + 
    labs(x="year", y=expression('Total PM'[2.5]*" Emissions")) + 
    labs(title=expression('PM'[2.5]*" Emissions in Baltimore City Maryland (1999-2008)"))
print(g)
dev.off()
