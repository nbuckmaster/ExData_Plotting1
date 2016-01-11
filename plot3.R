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


# set the x axis and scale
v1 <- c(0,1500,2900) # -> defines position of tick marks.
v2 <- c("Thu","Fri","Sat") # defines labels of tick marks.

# print the plot to the file device, file device direct ensures that image is not distorted by screen layout as can happen with dev.copy()
png(filename = "plot3.png",bg = "transparent")
plot(as.numeric(outdata$Sub_metering_1),xaxt = "n", type="l", ylab = "Energy Sub Metering")
lines(as.numeric(outdata$Sub_metering_2), type="l", col="red")
lines(as.numeric(outdata$Sub_metering_3), type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col = c("black","red","blue"))
axis(side = 1, 
     at = v1, 
     labels = v2,
     tck=-.03)
dev.off()

# print the plot to the scree device
plot(as.numeric(outdata$Sub_metering_1),xaxt = "n", type="l", ylab = "Energy Sub Metering")
lines(as.numeric(outdata$Sub_metering_2), type="l", col="red")
lines(as.numeric(outdata$Sub_metering_3), type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col = c("black","red","blue"))
axis(side = 1, 
     at = v1, 
     labels = v2,
     tck=-.03)