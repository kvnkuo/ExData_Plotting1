# Do Plot 3

# Read data file
dat = read.csv("household_power_consumption.txt", sep=";")

dat = transform(dat, Date = as.Date(Date, "%d/%m/%Y"))

# Subset the required data
p1 = dat[dat$Date=="2007-02-01"|dat$Date=="2007-02-02",]

p1 = transform(p1, Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))

p1 = transform(p1, Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))

p1 = transform(p1, Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))

xAxis = strptime(paste(p1$Date,p1$Time),"%Y-%m-%d %H:%M:%S")

# Initialize the output
png("plot3.png", width = 480, height = 480)

plot(xAxis, p1$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")

points(xAxis, p1$Sub_metering_2, type="l", col="red")

points(xAxis, p1$Sub_metering_3, type="l", col="blue")

myLegend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

legend("topright", myLegend, lwd=1, col=c("black","red","blue"))

# Finish the output
dev.off()