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

## Plot 2
plot(data$Datetime, data$Global_active_power, type = "l", 
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()