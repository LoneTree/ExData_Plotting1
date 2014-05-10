plot4 <- function(){
## Read the data file in
x <- read.table("household_power_consumption.txt", header = TRUE, colClasses = "character", sep = ";")

## Subset the files for dates of interest
y <- subset(x, (x$Date == "1/2/2007" | x$Date == "2/2/2007"))

## Create date / time column and cbind it to add the column to y
dtm <- strptime(paste(y$Date, y$Time), format = "%d/%m/%Y %H:%M:%S")
y <- cbind(y, dtm)

## Open a PNG device to accept the plot to be created
png(file = "plot 4.png")

## Tell the PNG device that there will be a 2x2 matrix of plots
par(mfrow = c(2,2))
with(y, {
     plot(dtm, Global_active_power, type="l", xlab= "", ylab = "Global Active Power") ## Plot 1
     plot(dtm, Voltage, type = "l", xlab = "datetime", ylab = "Voltage") ## Plot 2
     plot(dtm, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") ## Plot 3
     lines(dtm, Sub_metering_2, col = "red")
     lines(dtm, Sub_metering_3, col = "blue")
     legend("topright", lty = c("solid", "solid", "solid"), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
     plot(dtm, Global_reactive_power, type = "l", xlab = "datetime") ## Plot 4
     
})
dev.off() ## Close the PNG device
}