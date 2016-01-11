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
v1 <- c(0,1000,2000,3000) # -> defines position of tick marks.
v2 <- c("0","2","4","6") # defines labels of tick marks.


# print to the file device
png(file="plot1.png",bg = "transparent")
hist(as.numeric(outdata$Global_active_power),main = "Global active power",xaxt = "n", xlab="Global Active Power (kilowatts)")
# add the x axis using the pre configured scale above
axis(side = 1, 
     at = v1, 
     labels = v2,
     tck=-.03)
dev.off()



# print the plot to the screen device with no x axis
hist(as.numeric(outdata$Global_active_power),main = "Global active power",xaxt = "n", xlab="Global Active Power (kilowatts)")
# add the x axis using the pre configured scale above
axis(side = 1, 
     at = v1, 
     labels = v2,
     tck=-.03)

