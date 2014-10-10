# Heather Hanson
# October 9, 2014
# Exploratory Data Analysis  // Johns Hopkins ~ Coursera.org
# Class Project 1

# Plot 1:  histogram of global active power within date range Feb 1-2, 2007

print("load data sources")

household_pwr_consumption <- read.csv("household_power_consumption.txt", sep=";")


print("subset time period from data sources")

# subset to only February 1-2, 2007 
dateslice <- subset(household_pwr_consumption, as.Date(household_pwr_consumption$Date, format="%d/%m/%Y") >= c("2007/2/1") & as.Date(household_pwr_consumption$Date, format="%d/%m/%Y") <= c("2007/2/2"))
dateslice$Date <- as.Date(dateslice$Date,format="%d/%m/%Y" )


# class discussion forums
# as.character, then as.numeric

#http://stackoverflow.com/questions/3418128/how-to-convert-a-factor-to-an-integer-numeric-without-a-loss-of-information
# according to this tip, using as.numeric(levels(factor))[factor] is more efficient than as.character, then as.numeric
dateslice$GAP <- as.numeric(levels(dateslice$Global_active_power))[dateslice$Global_active_power]


print ("generate plots")


png(filename="plot1.png", width=480, height=480, units="px", restoreConsole=TRUE)

hist(dateslice$GAP, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
     )

dev.off()

print("done")
  
