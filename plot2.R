

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
png(filename="plot2.png",width=480,height=480)
plot(dataSets_F$Global_active_power~dataSets_F$DateTime, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

