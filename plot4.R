# code for plot4

# clear objects from the workspace
rm(list=ls(all=TRUE))

# load data from the txt file (household_power_consumption.txt)
# .R code should be in the same folder with the txt file
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, stringsAsFactors=FALSE, sep=";", dec=".",  na.strings=c("?"))

# convert Date variable
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# select only two dates
data1 <- subset(data, (data$Date=="2007-02-01" | data$Date=="2007-02-02"))

# combine Date and Time and convert
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$DateTime <- as.POSIXct(datetime)

# create graph
png("plot4.png", width=480, height=480)
# create a 2x2 area for four graphs
par(mfrow=c(2,2)) 
# row 1, column 1
plot(data1$DateTime, data1$Global_active_power,
     type= "l",
     ylab= "Global Active Power",
     xlab="",
     lwd=1) 
# row 1, column 2
plot(data1$DateTime, data1$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")
# row 2, column 1
plot(data1$DateTime, data1$Sub_metering_1,
     type="l",
     xlab="",
     ylab= "Energy sub metering")
lines(data1$DateTime, data1$Sub_metering_2, type="l", col="red")
lines(data1$DateTime, data1$Sub_metering_3, type="l", col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       bty="n",
       lty=1) 
# row 2, column 2
plot(data1$DateTime, data1$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
dev.off()
