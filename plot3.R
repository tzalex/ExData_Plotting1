# code for plot3

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
png("plot3.png", width=480, height=480)
plot(data1$DateTime, data1$Sub_metering_1, 
     type="l",
     xlab="",
     ylab="Energy sub metering",
     col="black")
lines(data1$DateTime, data1$Sub_metering_2, type="l", col = "red")
lines(data1$DateTime, data1$Sub_metering_3, type="l", col = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1)
dev.off()