# QUESTION 5
# How have emissions from motor vehicle sources changed from 1999–2008 in
# Baltimore City?
#
# Define a pasta pardão e descompacta o arquivo 
setwd("/home/andre/R/datasciencecoursera/ExploratoryDataAnalysis/week4")
unzip("./data/exdata-data-NEI_data.zip", exdir = "./data/")
# Carrega os dados 
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
# Select only Baltimore City in Maryland and ON-ROAD in NEI type
NEIb <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
# another way is search in SCC by follow...
# NEIbalt <- NEI[NEI$fips=="24510",]
# motorv <- grepl("Mobile - On-Road ", SCC$EI.Sector, ignore.case = TRUE)
# motorv <- SCC[motorv, ]
# motorv <- NEIbalt[NEIbalt$SCC %in% motorv$SCC, ]
#
# Aggregate by sum the total emissions by year
agg <- aggregate(Emissions ~ year,NEIb, sum)
#
# gglplot line
png("plot5.png",width=480,height=480,units="px")
g <- ggplot(agg, aes(year, Emissions))
g <- g + geom_point(stat = "summary", fun.y = "sum",size=4, colour="#CC0000") +
    geom_line(stat = "summary", fun.y = "sum",size=1 , colour="#000099") +
    ylab(expression('Total PM'[2.5]*" Emissions (tons)")) +
    ggtitle(expression('PM'[2.5]*" Emissions Motor Vehicles Sources in USA (1999-2008)"))
print(g)
dev.off()