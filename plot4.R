# get the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 'household_power_consumption.zip')

# read the data
power <- read.table(unzip('household_power_consumption.zip'), sep = ";", na.strings = "?", header = TRUE)

# subset only to relevant part
powersub<- subset(power, (power$Date == "1/2/2007" | power$Date== "2/2/2007"))

# combine the Date and Time cols to have per-minute granularity in plot
powersub$DateTime <- strptime(paste(powersub$Date, powersub$Time, sep=' '), "%d/%m/%Y %T")

png(filename='plot4.png', width = 480, height = 480)

# set up the chart for 4 plots
par(
    mfrow = c(2,2), 
    mar = c(4,4,2,1), 
    oma = c(0,0,2,0)
  )

# global power plot
plot(
    powersub$DateTime, 
    powersub$Global_active_power, 
    type = 'l', 
    ylab = 'Global Active Power',
    xlab = ''
  )

# voltage plot
plot(
  powersub$DateTime, 
  powersub$Voltage, 
  type = 'l', 
  ylab = 'Voltage',
  xlab = 'datetime'
)

# energy sub_metering
plot(
  powersub$DateTime, 
  powersub$Sub_metering_1, 
  type = 'l', 
  ylab = 'Energy sub metering',
  xlab = ''
)

lines(
  powersub$DateTime, 
  powersub$Sub_metering_2, 
  type = 'l', 
  col = 'red'
)

lines(
  powersub$DateTime, 
  powersub$Sub_metering_3, 
  type = 'l', 
  col = 'blue'
)

legend(
  'topright', 
  c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
  lty = 1,
  bty = 'n',
  col = c('black', 'red', 'blue')
)

# global reactive power
plot(
  powersub$DateTime, 
  powersub$Global_reactive_power, 
  type = 'l', 
  ylab = 'Global_reactive_power',
  xlab = 'datetime'
)

dev.off()