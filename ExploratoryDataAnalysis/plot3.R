setwd("/home/andre/R/datasciencecoursera/ExploratoryDataAnalysis")
arquivo <- read.table("household_power_consumption.txt", na.strings = "?",
                      header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#dados <- arquivo[(arquivo[,1] == "1/2/2007" | arquivo[,1] == "2/2/2007"), ]
dados <- arquivo[arquivo$Date %in% c("1/2/2007","2/2/2007") ,]
dados$Date <- strptime(paste(dados$Date, dados$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# gerar gráfico
png("plot3.png", width=480, height=480)
plot( dados$Date, dados$Sub_metering_1, type="l", 
      ylab="Energy sub metering", xlab="")
lines(dados$Date, dados$Sub_metering_2, type="l", col="red")
lines(dados$Date, dados$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()