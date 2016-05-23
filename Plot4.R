table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?") # read the data from the text file
DatesTable <- subset(table, table$Date == "2/2/2007" | table$Date == "1/2/2007") #Take only the data with the range specified
DatesTable$Date <- as.Date(DatesTable$Date,"%d/%m/%Y")
DatesTable <- within(DatesTable, { timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })
DatesTable$timestamp <- strptime(DatesTable$timestamp, "%d/%m/%Y %H:%M:%S")
png("Plot4.png", height = 480, width = 480, bg = "white", pointsize = 12) #Create the png file where the histogram will be saved
par(mfrow= c(2,2))
plot(DatesTable$timestamp, DatesTable$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")
plot(DatesTable$timestamp, DatesTable$Voltage, type= "l", xlab = "datetime", ylab = "Voltage")
plot(DatesTable$timestamp, DatesTable$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = " ")
lines(DatesTable$timestamp, DatesTable$Sub_metering_2, col = "red")
lines(DatesTable$timestamp, DatesTable$Sub_metering_3, col = "blue")
plot(DatesTable$timestamp, DatesTable$Global_reactive_power, type= "l", xlab = "datetime", ylab= "Global_reactive_power")
dev.off() #close the png file
