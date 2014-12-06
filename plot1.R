# get the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 'household_power_consumption.zip')

# read the data
power <- read.table(unzip('household_power_consumption.zip'), sep = ";", na.strings = "?", header = TRUE)

# subset only to relevant part
powersub<- subset(power, (power$Date == "1/2/2007" | power$Date== "2/2/2007"))

# save histogram to png
png(filename='plot1.png', width = 480, height = 480)

hist(
    powersub$Global_active_power, 
    xlab="Global Active Power (kilowatts)", 
    main="Global Active Power", 
    col="red"
  )

dev.off()