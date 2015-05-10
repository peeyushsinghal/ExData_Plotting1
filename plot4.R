## reading data 
powerdata <- read.table(filepath, header = TRUE, sep =";", stringsAsFactors = FALSE, dec=".")
## subsetting data - to pick data only for 2 dates
subsetpowerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]


## converting sub_metering_x (x=1,2,3) from character to numeric
sub_metering_1 <- as.numeric(subsetpowerdata$Sub_metering_1)
sub_metering_2 <- as.numeric(subsetpowerdata$Sub_metering_2)
sub_metering_3 <- as.numeric(subsetpowerdata$Sub_metering_3)

## converting time and date (characters) into datatime
datetime <- strptime(paste(subsetpowerdata$Date, subsetpowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## converting Global_active_power to numeric from character
Global_active_power<- as.numeric(subsetpowerdata$Global_active_power)
## converting Global_reactive_power to numeric from character
Global_reactive_power<- as.numeric(subsetpowerdata$Global_reactive_power)
## converting Voltage to numeric from character
Voltage<- as.numeric(subsetpowerdata$Voltage)

##------Plotting Data----

## opening png device
png("plot4.png", width=480, height =480)
## 2X2 plot
par(mfrow = c(2, 2)) 
## C[1,1] plot
plot(datetime,Global_active_power,type ="l", xlab ="", ylab ="Global Active Power (kilowatts)")

## C[1,2] plot
plot(datetime,Voltage,type="l", xlab="datetime", ylab ="Voltage")

## C[2,1] plot
plot(datetime,sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
## adding lines
lines(datetime, sub_metering_3, type="l", col="blue")
lines(datetime, sub_metering_2, type="l", col="red")
## adding legend
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty =1, lwd=2, col = c("black","red","blue"))

## C[2,2]plot
plot(datetime,Global_reactive_power,type ="l", xlab ="datetime", ylab ="Global_reactive_power")
## closing png device
dev.off()
## end