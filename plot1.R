# code for plot1

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

# create graph
png("plot1.png", width=480, height=480)
hist(data1$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
dev.off()