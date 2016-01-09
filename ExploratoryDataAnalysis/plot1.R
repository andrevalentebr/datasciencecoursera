setwd("/home/andre/R/datasciencecoursera/ExploratoryDataAnalysis")
arquivo <- read.table("household_power_consumption.txt", na.strings = "?",
                    header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#dados <- arquivo[(arquivo[,1] == "1/2/2007" | arquivo[,1] == "2/2/2007"), ]
dados <- arquivo[arquivo$Date %in% c("1/2/2007","2/2/2007") ,]
dados$Date <- paste(as.Date(dados$Date, format="%d/%m/%Y"),dados$Time, sep = " ")
dados$Date <- strptime(dados$Date, format="%Y-%m-%d %H:%M:%S")
#str(dados)
png("plot1.png", width=480, height=480)
hist(dados$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()