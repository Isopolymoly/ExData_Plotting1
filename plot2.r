# Heather Hanson
# October 9, 2014
# Exploratory Data Analysis  // Johns Hopkins ~ Coursera.org
# Class Project 1

# Plot 2:  time series plot of global active power within date range Feb 1-2, 2007
# code based on my plot1.r

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

#### new for plot2.4


# draw one x-axis tick per day, starting @ 0
minutesPerDay <- 60*24
minutes2days <- 2*minutesPerDay
xticks_xaxp <- c(0, minutes2days, 2)  # [0-2*minutes per day], 2 days intervals]
xticks <- c(0,minutesPerDay, minutes2days)
xlabels=c("Thu", "Fri","Sat")


plot(dateslice$GAP, type="l",
    frame.plot=TRUE, axes=FALSE,
    ylab="Global Active Power (kilowatts)",
     xlab="",
     main=""
     )

axis(1,at=xticks,labels=xlabels)
axis(2)

dev.off()

print("done")
  
