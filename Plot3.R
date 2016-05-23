table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?") # read the data from the text file
DatesTable <- subset(table, table$Date == "2/2/2007" | table$Date == "1/2/2007") #Take only the data with the range specified
DatesTable$Date <- as.Date(DatesTable$Date,"%d/%m/%Y")
DatesTable <- within(DatesTable, { timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })
DatesTable$timestamp <- strptime(DatesTable$timestamp, "%d/%m/%Y %H:%M:%S")
png("Plot3.png", height = 480, width = 480, bg = "white", pointsize = 12) #Create the png file where the histogram will be saved
plot(DatesTable$timestamp, DatesTable$Sub_metering_1, type = "l", ylab = "Energy Sub metering", xlab = " ")
lines(DatesTable$timestamp, DatesTable$Sub_metering_2, col = "red")
lines(DatesTable$timestamp, DatesTable$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))
dev.off() #close the png file
