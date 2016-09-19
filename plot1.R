# The data set is already downloaded, set current directory.
setwd("C:/Users/awl_y/desktop/R-chuanfu/class4/project1")

# Read data and the date "Feb/02" or "Feb/01" of 2007 were subsetted and saved to data2
data1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
date1 <- data1$Date
data2 <- data1[(date1=="1/2/2007" | date1=="2/2/2007"), ]
Global_active_power <- as.numeric(data2$Global_active_power)

png(file="plot 1.png")
hist(Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()