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
hist(as.numeric(myData$Global_active_power), col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
## Saving to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()