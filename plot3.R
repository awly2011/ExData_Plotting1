# The data set is already downloaded, set current directory.
setwd("C:/Users/awl_y/desktop/R-chuanfu/class4/project1")
library(reshape2)

# Read data and the date "Feb/02" or "Feb/01" of 2007 were subsetted and saved to data2
data1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
date1 <- data1$Date
data2 <- data1[(date1=="1/2/2007" | date1=="2/2/2007"), ]


# Join Date and Time columns together to get the time variable
time1 <- paste(data2$Date, data2$Time)
time1 <- as.POSIXct(strptime(time1, "%d/%m/%Y %H:%M:%S"))


# Build a new data frame with four columns: time1, Sub_metering_1, Sub_metering_2, Sub_metering_3
# Then melt the data frame to a new frame meltdata3
Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
Sub_metering_3 <- as.numeric(data2$Sub_metering_3)
data3 <- data.frame(time1, Sub_metering_1, Sub_metering_2, Sub_metering_3)
meltdata3 <- melt(data3, id = c("time1"))

# First draw graph without any lines and points, then three lines added seperately
png(file="plot 3.png")
with(meltdata3, plot(time1, value, type = "n", xlab = "", ylab = "Energy sub metering"))
with(subset(meltdata3, variable == "Sub_metering_1"), lines(time1, value, type = "l"))
with(subset(meltdata3, variable == "Sub_metering_2"), lines(time1, value, col="red", type = "l"))
with(subset(meltdata3, variable == "Sub_metering_3"), lines(time1, value, col="blue", type = "l"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()