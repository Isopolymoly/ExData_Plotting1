# Heather Hanson
# October 9, 2014
# Exploratory Data Analysis  // Johns Hopkins ~ Coursera.org
# Class Project 1

# Plot 3:  time series plot of sub-metering power within date range Feb 1-2, 2007
# code based on my plot1.r & plot2.r files

print("load data sources")

household_pwr_consumption <- read.csv("household_power_consumption.txt", sep=";")


print("subset time period from data sources")

# subset to only February 1-2, 2007 
dateslice <- subset(household_pwr_consumption, as.Date(household_pwr_consumption$Date, format="%d/%m/%Y") >= c("2007/2/1") & as.Date(household_pwr_consumption$Date, format="%d/%m/%Y") <= c("2007/2/2"))
# convert to date format
dateslice$Date <- as.Date(dateslice$Date,format="%d/%m/%Y" )

# remove large dataset
rm("household_pwr_consumption")

# class discussion forums
# as.character, then as.numeric

#http://stackoverflow.com/questions/3418128/how-to-convert-a-factor-to-an-integer-numeric-without-a-loss-of-information
# according to this tip, using as.numeric(levels(factor))[factor] is more efficient than as.character, then as.numeric
#dateslice$GAP <- as.numeric(levels(dateslice$Global_active_power))[dateslice$Global_active_power]


#new for plot3.r
dateslice$sub1 <- as.numeric(levels(dateslice$Sub_metering_1))[dateslice$Sub_metering_1]
dateslice$sub2 <- as.numeric(levels(dateslice$Sub_metering_2))[dateslice$Sub_metering_2]

# sub metering 3 is already numeric
dateslice$sub3 <- dateslice$Sub_metering_3

print ("generate plots")

png(filename="plot3.png", width=480, height=480, units="px", restoreConsole=TRUE)


# draw one x-axis tick per day, starting @ 0
minutesPerDay <- 60*24
minutes2days <- 2*minutesPerDay
xticks_xaxp <- c(0, minutes2days, 2)  # [0-2*minutes per day], 2 days intervals]
xticks <- c(0,minutesPerDay, minutes2days)
xlabels=c("Thu", "Fri","Sat")


#### new for plot3

legend_text <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(dateslice$sub1, type="l", col="black",
    frame.plot=TRUE, axes=FALSE,
    ylab="Energy sub metering",
     xlab="",
     main=""
     )
####
lines(dateslice$sub2, type="l", col="red")
lines(dateslice$sub3, type="l", col="blue")

axis(1,at=xticks,labels=xlabels)
axis(2)
legend('topright', legend_text, lty=1, col=c("black", "red", "blue"))


dev.off()

print("done")
  
