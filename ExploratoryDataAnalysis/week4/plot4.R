# QUESTION 4
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?
#
# Define a pasta pardão e descompacta o arquivo 
setwd("/home/andre/R/datasciencecoursera/ExploratoryDataAnalysis/week4")
unzip("./data/exdata-data-NEI_data.zip", exdir = "./data/")
# Carrega os dados 
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
# Filter rows by Coal string in Short.Name in SCC database
# match field SCC in NEI and SCC databases
coal <- grepl("coal", SCC$Short.Name, ignore.case = TRUE)
coal <- SCC[coal, ]
coal <- NEI[NEI$SCC %in% coal$SCC, ]
#  Another form with merge function
#NEISCC <- merge(NEI, SCC, by="SCC")
#coal  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
#coal <- NEISCC[coal, ]
#
agg <- aggregate(Emissions ~ year, coal, sum)
#
agg$Emissions <- round((agg$Emissions / 10^5),2)
#
# gglplot line
png("plot4.png",width=480,height=480,units="px")
g <- ggplot(agg, aes(year, Emissions))
g <- g + geom_point(stat = "summary", fun.y = "sum",size=3, colour="#CC0000") +
    geom_line(stat = "summary", fun.y = "sum", , colour="#000099") +
    ylab(expression('Total PM'[2.5]*" Emissions (10^5 tons)")) +
    ggtitle(expression('PM'[2.5]*" Emissions Coal in USA (1999-2008)"))
print(g)
dev.off()
# ggplot bar
png("plot4a.png",width=480,height=480,units="px")
g <- ggplot(agg, aes(factor(year),Emissions)) +
    geom_bar(stat="identity", fill="#FF9999", colour="black") + 
    labs(x="year", y=expression('Total PM'[2.5]*" Emissions (10^5 tons)")) + 
    labs(title=expression('PM'[2.5]*" Emissions Coal in USA (1999-2008)"))
print(g)
dev.off()
# plot line
png("plot4b.png",width=480,height=480,units="px")
plot(agg, type = "l", xlab = "Year", 
     main = expression('PM'[2.5]*" Emissions Coal in USA (1999-2008)"), 
     ylab = expression('Total PM'[2.5]*" Emissions (10^5 tons)"))
dev.off()
# plot bar
png("plot4c.png",width=480,height=480,units="px")
barplot(agg$Emissions, names.arg=agg$year, xlab="Year",
        ylab=expression('Total PM'[2.5]*" Emissions (10^5 tons)"),
        main=expression('PM'[2.5]*" Emissions Coal in USA (1999-2008)"))
dev.off()




















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
