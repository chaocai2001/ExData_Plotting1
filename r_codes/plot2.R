# Note: If the processed data has already existed, the follow sections 1,2,3 can be skipped
# section1: load the data from file, please, put the source data file("household_power_consumption.txt") in the path ../data" 
power_consumption <- read.csv("../data/household_power_consumption.txt", sep=";", na.strings="?", colClasses = c("character", "character", rep("numeric",7)))
# section2: convert the string values to Datetime object
power_consumption["Datetime_str"] <- paste(power_consumption$Date, power_consumption$Time, sep="-")
power_consumption$Datetime <- strptime(power_consumption$Datetime_str, format = "%d/%m/%Y-%H:%M:%S")

# section3: extract the data for drawing 
power_consumption_2007<-subset(power_consumption, as.Date(Datetime)>=as.Date("2007-02-01",format="%Y-%m-%d") & as.Date(Datetime)<=as.Date("2007-02-02",format="%Y-%m-%d"))

# section4: draw the diagram
plot(power_consumption_2007$Datetime, power_consumption_2007$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")