# Note: If the processed data has already existed, the follow sections 1,2,3 can be skipped
# section1: load the data from file, please, put the source data file("household_power_consumption.txt") in the path ../data" 
power_consumption <- read.csv("../data/household_power_consumption.txt", sep=";", na.strings="?", colClasses = c("character", "character", rep("numeric",7)))
# section2: convert the string values to Datetime object
power_consumption["Datetime_str"] <- paste(power_consumption$Date, power_consumption$Time, sep="-")
power_consumption$Datetime <- strptime(power_consumption$Datetime_str, format = "%d/%m/%Y-%H:%M:%S")

# section3: extract the data for drawing 
power_consumption_2007<-subset(power_consumption, as.Date(Datetime)>=as.Date("2007-02-01",format="%Y-%m-%d") & as.Date(Datetime)<=as.Date("2007-02-02",format="%Y-%m-%d"))

# section4: draw the diagram
par(mfrow=c(2,2))
plot(power_consumption_2007$Datetime, power_consumption_2007$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(power_consumption_2007$Datetime, power_consumption_2007$Voltage, type="l", xlab="datetime",ylab="Voltage")
plot(power_consumption_2007$Datetime,power_consumption_2007$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(power_consumption_2007$Datetime,power_consumption_2007$Sub_metering_1)
lines(power_consumption_2007$Datetime,power_consumption_2007$Sub_metering_2, col="red")
lines(power_consumption_2007$Datetime,power_consumption_2007$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd = 1, lty = c(1,1,1), cex=0.4)
plot(power_consumption_2007$Datetime, power_consumption_2007$Global_active_power, ylab="Global_active_power", xlab="datatime", type="l")