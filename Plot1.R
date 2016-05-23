table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?") # read the data from the text file
DatesTable <- subset(table, table$Date == "2/2/2007" | table$Date == "1/2/2007") #Take only the data with the range specified
png("Plot1.png", height = 480, width = 480, bg = "white", pointsize = 12) #Create the png file where the histogram will be saved
hist(DatesTable$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", border = "black", col = "red") #build the histogram
dev.off() #close the png file

 
