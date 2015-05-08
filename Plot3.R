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
## Creating Plot
with(myData, plot(Time, as.numeric(Sub_metering_1),  type = "l", ylab = "Energy Sub Metering" , xlab =""),axis(2, at=c(10, 20, 30), labels=T))

with(myData, points(Time, as.numeric(Sub_metering_2), type="l", col="red"))
with(myData, points(Time, as.numeric(Sub_metering_3), type="l", col="blue"))
## Adding legend
legend("topright", pch = NA, lwd = 3, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pt.cex=1.3, cex=0.75)
## Saving to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()