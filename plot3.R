## reading data 
powerdata <- read.table(filepath, header = TRUE, sep =";", stringsAsFactors = FALSE, dec=".")
## subsetting data - to pick data only for 2 dates
subsetpowerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

##------Plotting Data----

## converting sub_metering_x (x=1,2,3) from character to numeric
sub_metering_1 <- as.numeric(subsetpowerdata$Sub_metering_1)
sub_metering_2 <- as.numeric(subsetpowerdata$Sub_metering_2)
sub_metering_3 <- as.numeric(subsetpowerdata$Sub_metering_3)

## converting time and date (characters) into datatime
datetime <- strptime(paste(subsetpowerdata$Date, subsetpowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## opening png device
png("plot3.png", width=480, height =480)
## making basic plot
plot(datetime,sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
## adding lines
lines(datetime, sub_metering_3, type="l", col="blue")
lines(datetime, sub_metering_2, type="l", col="red")
## adding legend
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty =1, lwd=2, col = c("black","red","blue"))
## closing png device
dev.off()
## end