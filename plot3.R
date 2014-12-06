# get the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 'household_power_consumption.zip')

# read the data
power <- read.table(unzip('household_power_consumption.zip'), sep = ";", na.strings = "?", header = TRUE)

# subset only to relevant part
powersub<- subset(power, (power$Date == "1/2/2007" | power$Date== "2/2/2007"))

# combine the Date and Time cols to have per-minute granularity in plot
powersub$DateTime <- strptime(paste(powersub$Date, powersub$Time, sep=' '), "%d/%m/%Y %T")

png(filename='plot3.png', width = 480, height = 480)

# start plot with 1 line
plot(
  powersub$DateTime, 
  powersub$Sub_metering_1, 
  type = 'l', 
  ylab = 'Energy sub metering',
  xlab = ''
)

# add second sub_metering line
lines(
    powersub$DateTime, 
    powersub$Sub_metering_2, 
    type = 'l', 
    col = 'red'
    )

# add third sub_meterting line
lines(
  powersub$DateTime, 
  powersub$Sub_metering_3, 
  type = 'l', 
  col = 'blue'
)

# add legend in the corner
legend(
    'topright', 
    c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
    lty = 1, 
    col = c('black', 'red', 'blue')
  )

dev.off()