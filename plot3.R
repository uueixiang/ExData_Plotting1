

## Exploratory Data Analysis Course Project 1


## read data
dataSets <- read.table("household_power_consumption.txt", 
                       sep=";", header=T, na.strings="?")


## data conversion
dataSets$Date <- as.Date(dataSets$Date, format="%d/%m/%Y")
dateTime <- paste(dataSets$Date, dataSets$Time)
dataSets$DateTime <- as.POSIXct(dateTime)
##dataSets$DateTime <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")


## filter data (only 2007-02-01 to 2007-02-02)
dataSets_F <- dataSets[dataSets$Date >= "2007-02-01" & dataSets$Date <= "2007-02-02",]


## plot
png(filename="plot3.png",width=480,height=480)
plot(dataSets_F$Sub_metering_1~dataSets_F$DateTime, 
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(dataSets_F$Sub_metering_2~dataSets_F$DateTime, 
     col="red")
lines(dataSets_F$Sub_metering_3~dataSets_F$DateTime, 
     col="blue")
legend("topright", col=c("black","red","blue"),
       lty=1, lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

