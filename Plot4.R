## Dates used to subset
Dates <- c("1/2/2007", "2/2/2007")
## Read in the data
table <- read.table(file="household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE)
## Create data frame with data
data <- as.data.frame(table)
## Subsetting Data
myData <- data[which(data$Date %in% Dates),]
## Stripping Time
myData$Time <- strptime(do.call(paste0, myData[c(1,2)]), "%d/%m/%Y%H:%M:%S")
## Stripping Date
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
par(mfrow=c(2,2))
## Creating Plots
##Plot 1
with(myData, {
      plot(x=Time, y=as.numeric(Global_active_power), type="l",xlab="", ylab="Global Active Power")        
## Plot 2
        plot(x=Time, y=as.numeric(Voltage), type="l", xlab="datetime", ylab="Voltage")
## Plot 3
        plot(x=Time, y=as.numeric(Sub_metering_1), type="l", xlab="", ylab="Energy Sub Metering")
        points(x=Time, y=as.numeric(Sub_metering_2), type="l", col="red")
        points(x=Time, y=as.numeric(Sub_metering_3), type="l", col="blue")
## Plot 3 legend
        legend("topright", pch=NA, lwd=1, col= c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),pt.cex=1.3, cex=0.75)
## Plot 4
plot(x=Time, y=as.numeric(Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
})

## Saving to png
dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()