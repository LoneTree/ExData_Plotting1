##Read the full file in
full.file <- read.table("Household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

##Subset the data to only February 1, 2007 and February 2, 2007
trim.file <- subset(full.file, (full.file$Date == "1/2/2007" | full.file$Date == "2/2/2007"))

## Create a new column that combines date and time and bind it to the trimmed file. 
## I have no idea why this outputs days names in the plot.
dnt <- strptime(paste(trim.file$Date, trim.file$Time), format = "%d/%m/%Y %H:%M:%S")
trim.file.2 <- cbind(trim.file, dnt)

png(file = "plot 2.png")
with(trim.file.2, 
     plot(dnt, Global_active_power, 
          type = "l", 
          xlab = "", 
          ylab = "Global Active Power (kilowatts)"))
dev.off()
