## using R version 3.1.2 
## plot1.R is kept at location x/, then the data file is kept at x/data/

##------Reading Data-------
## setting file path
filepath <- "./data/household_power_consumption.txt"
## reading data 
powerdata <- read.table(filepath, header = TRUE, sep =";", stringsAsFactors = FALSE, dec=".")
## subsetting data - to pick data only for 2 dates
subsetpowerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

##------Plotting Data----
## converting Global_active_power to numeric from character
Global_active_power<- as.numeric(subsetpowerdata$Global_active_power)
## opening png device
png("plot1.png", width=480, height =480)
## plotting 
hist(Global_active_power,col="red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
## closing png device
dev.off()
## end
