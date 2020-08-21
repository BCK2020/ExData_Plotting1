# Extract data from file
house<- read.table("household_power_consumption 3.txt", header = TRUE, 
                   sep = ";")

# Changing Date from Character to Date & Time
house$Date<- as.Date(house$Date, tryFormats = c('%d-%m-%Y', "%d/%m/%Y"))

# Subseting the data based on date range
house_subset<-subset(house, Date == "2007-02-01" | Date == "2007-02-02")

# Joining Date & Time 
datetime <- paste(as.Date(house_subset$Date), house_subset$Time)
house_subset$Datetime <- as.POSIXct(datetime)

# Build third plot
png("plot3.png", width = 480, height = 480)


plot(house_subset$Datetime, house_subset$Sub_metering_1, 
     type = "l", xlab = "", ylab= "Energy Sub_metering")
lines(house_subset$Datetime, house_subset$Sub_metering_2,col='Red')
lines(house_subset$Datetime, house_subset$Sub_metering_3,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()