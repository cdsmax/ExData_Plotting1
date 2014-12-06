# get the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 'household_power_consumption.zip')

# read the data
power <- read.table(unzip('household_power_consumption.zip'), sep = ";", na.strings = "?", header = TRUE)

# subset only to relevant part
powersub<- subset(power, (power$Date == "1/2/2007" | power$Date== "2/2/2007"))

# combine the Date and Time cols to have per-minute granularity in plot
powersub$DateTime <- strptime(paste(powersub$Date, powersub$Time, sep=' '), "%d/%m/%Y %T")

# plot the timeseries for global active power
png(filename='plot2.png', width = 480, height = 480)

plot(
    powersub$DateTime, 
    powersub$Global_active_power, 
    type = 'l', 
    ylab = 'Global Active Power (kilowatts)',
    xlab = ''
  )

dev.off()
