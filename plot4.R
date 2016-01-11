# this script is in two halves
#       the first half downloads the data into memory
#       the second half creates the plot

#       first half - data download

temp <- tempfile()

# DOWNLOADING ....
# PLEASE WAIT :-)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
# READING INTO MEMORY....
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=TRUE)
unlink(temp)
rm(temp)

#       second half - produce the plot from the downloaded data

# convert to date format to perform subsetting
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
# subset the data so we are only looking at the two dates in question
outdata<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

# print the plot to the file device, file device direct ensures that image is not distorted by screen layout as can happen with dev.copy()
png(filename = "plot4.png",bg = "transparent")
# set up the 2 by 2 grid canvas
par(mfcol = c(2,2))
# plot 1
plot(as.numeric(outdata$Global_active_power), type="l", ylab="Global Active Power (kilowatts)")
# plot 2
plot(as.numeric(outdata$Sub_metering_1), type="l", ylab = "Energy Sub Metering")
lines(as.numeric(outdata$Sub_metering_2), type="l", col="red")
lines(as.numeric(outdata$Sub_metering_3), type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col = c("black","red","blue"))
#plot 3
plot(as.numeric(outdata$Voltage), type="l", ylab="Voltage")
# plot 4
plot(as.numeric(outdata$Global_reactive_power), type="l", ylab="Global reactive power")
dev.off()

# print the plot to the scree device
# set up the 2 by 2 grid canvas
par(mfcol = c(2,2))
# plot 1
plot(as.numeric(outdata$Global_active_power), type="l", ylab="Global Active Power (kilowatts)")
# plot 2
plot(as.numeric(outdata$Sub_metering_1), type="l", ylab = "Energy Sub Metering")
lines(as.numeric(outdata$Sub_metering_2), type="l", col="red")
lines(as.numeric(outdata$Sub_metering_3), type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col = c("black","red","blue"))
#plot 3
plot(as.numeric(outdata$Voltage), type="l", ylab="Voltage")
# plot 4
plot(as.numeric(outdata$Global_reactive_power), type="l", ylab="Global reactive power")