## Getting full dataset
full_dataset <- read.csv("../household_power_consumption.txt", header=TRUE, 
                         sep=';', na.strings="?")
full_dataset$Date <- as.Date(full_dataset$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(full_dataset,
               subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_dataset)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(Datetime, Global_active_power, type = "l",
         ylab = "Global Active Power (kilowatts)")
    plot(Datetime, Voltage, type = "l",
         ylab = "Voltage (volt)")
    plot(Datetime, Sub_metering_1, type = "l",
         ylab = "Energy Sub metering")
    lines(Datetime, Sub_metering_2, col='Red')
    lines(Datetime, Sub_metering_3, col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Datetime, Global_reactive_power, type="l", 
         ylab="Global Reactive Power (kilowatts)")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()