##Read the full file in
full.file <- read.table("Household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

##Subset the data to only February 1, 2007 and February 2, 2007
trim.file <- subset(full.file, (full.file$Date == "1/2/2007" | full.file$Date == "2/2/2007"))

##Coerce colmns to their appropriate classes
trim.file$Date <- as.Date("trim.file$Date", format = "%d/%m/%Y")
trim.file$Global_active_power <- as.numeric(trim.file$Global_active_power)

##Create the histogram plot and write it to a 480 x 480 PNG file 
png(file = "Plot 1.png")
with(trim.file, hist(Global_active_power, col = "red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency"))
dev.off()
