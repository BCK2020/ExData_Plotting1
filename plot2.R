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

# Changing to numeric
as.numeric(house_subset$Global_active_power)

# Build second plot
png("plot2.png", width = 480, height = 480)

plot(house_subset$Datetime, house_subset$Global_active_power,  main = "Global Active Power", 
     type = "l", xlab = "", ylab= "Global active power(Kilowatts")

dev.off()

