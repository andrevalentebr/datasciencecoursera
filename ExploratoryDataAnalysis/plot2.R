setwd("/home/andre/R/datasciencecoursera/ExploratoryDataAnalysis")
arquivo <- read.table("household_power_consumption.txt", na.strings = "?",
                      header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#dados <- arquivo[(arquivo[,1] == "1/2/2007" | arquivo[,1] == "2/2/2007"), ]
dados <- arquivo[arquivo$Date %in% c("1/2/2007","2/2/2007") ,]
dados$Date <- strptime(paste(dados$Date, dados$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# gerar gráfico
png("plot2.png", width=480, height=480)
plot(dados$Date, dados$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()