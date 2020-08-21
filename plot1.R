# Extract data from file
house<- read.table("household_power_consumption 3.txt", header = TRUE, 
                   sep = ";")

# Changing Date from Character to Date & Time
house$Date<- as.Date(house$Date, tryFormats = c('%d-%m-%Y', "%d/%m/%Y"))

# Subseting the data based on date range
house_subset1<-subset(house, Date == "2007-02-01" | Date == "2007-02-02")

# Changing to numeric
as.numeric(house_subset$Global_active_power)

# build first plot
png("plot1.png", width = 480, height = 480)

hist(as.numeric(house_subset1$Global_active_power), col = "red", 
     main = "Global Active Power", xlab= "Global active power(Kilowatts)")

dev.off()
