# The data set is already downloaded, set current directory.
setwd("C:/Users/awl_y/desktop/R-chuanfu/class4/project1")

# Read data and the date "Feb/02" or "Feb/01" of 2007 were subsetted and saved to data2
data1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
date1 <- data1$Date
data2 <- data1[(date1=="1/2/2007" | date1=="2/2/2007"), ]
Global_active_power <- as.numeric(data2$Global_active_power)


# Join Date and Time columns together to get the time variable
time1 <- paste(data2$Date, data2$Time)
time1 <- as.POSIXct(strptime(time1, "%d/%m/%Y %H:%M:%S"))

png(file="plot 2.png")
plot(time1, Global_active_power, type="l", ylab="Global Active Power(kilowatts)", xlab="")
dev.off()
