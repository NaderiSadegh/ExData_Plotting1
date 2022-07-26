
header <- read.table("household_power_consumption.txt", sep=";",
                     na.strings = "?", stringsAsFactors=FALSE,nrows=1)
# reading the data from the dates 2007-02-01 to 2007-02-02
hhpc <- read.table("household_power_consumption.txt", sep=";",
                   na.strings = "?", stringsAsFactors=FALSE, skip=66637, nrows=2880)
# Assigning the header to the data
colnames(hhpc) <- unlist(header)


dateCol <- hhpc$Date
timeCol <- hhpc$Time
dateTime <- paste(dateCol, timeCol)
dateTimeCol <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")
hhpc <- cbind(hhpc, dateTimeCol)    # adding a "POSIXlt" column to the data set


# creating and writing the plot to a png file:
png(filename="plot3.png", width=480, height=480)
with(hhpc, {
    
    plot(dateTimeCol, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(dateTimeCol, Sub_metering_2, type="l", col="red")
    lines(dateTimeCol, Sub_metering_3, type="l", col="blue")
    
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           lty=1, col=c("black", "red", "blue"))
    
})
dev.off()

