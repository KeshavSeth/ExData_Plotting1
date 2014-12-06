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

## Plot 3
plot(data$Datetime, data$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2)

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()