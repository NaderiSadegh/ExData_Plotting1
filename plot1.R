
header <- read.table("household_power_consumption.txt", sep=";",
                     na.strings = "?", stringsAsFactors=FALSE,nrows=1)
# reading the data from the dates 2007-02-01 to 2007-02-02
hhpc <- read.table("household_power_consumption.txt", sep=";",
                   na.strings = "?", stringsAsFactors=FALSE, skip=66637, nrows=2880)
# Assigning the header to the data
colnames(hhpc) <- unlist(header)


# creating and writing the plot to a png file:
png(filename="plot1.png", width=480, height=480)
with(hhpc, hist(Global_active_power, col = "red", 
                main = "Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()


