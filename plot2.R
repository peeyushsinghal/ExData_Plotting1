## setting file path
filepath <- "./data/household_power_consumption.txt"
## reading data 
powerdata <- read.table(filepath, header = TRUE, sep =";", stringsAsFactors = FALSE, dec=".")
## subsetting data - to pick data only for 2 dates
subsetpowerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

##------Plotting Data----
## converting Global_active_power to numeric from character
Global_active_power<- as.numeric(subsetpowerdata$Global_active_power)
## converting time and date (characters) into datatime
datetime <- strptime(paste(subsetpowerdata$Date, subsetpowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
## opening png device
png("plot2.png", width=480, height =480)
## plotting 
plot(datetime,Global_active_power,type ="l", xlab ="", ylab ="Global Active Power (kilowatts)")
## closing png device
dev.off()
## end