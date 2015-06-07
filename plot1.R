# Do Plot 1

# Read data file
dat = read.csv("household_power_consumption.txt", sep=";")

dat = transform(dat, Date = as.Date(Date, "%d/%m/%Y"))

# Subset the required data
p1 = dat[dat$Date=="2007-02-01"|dat$Date=="2007-02-02",]

p1 = transform(p1, Global_active_power = as.numeric(as.character(Global_active_power)))

# Initialize the output
png("plot1.png", width = 480, height = 480)

hist(p1$Global_active_power, col="red", main = "Golbal Active Power", xlab = "Global Active Power (kilowatts)")

# Finish the output
dev.off()
