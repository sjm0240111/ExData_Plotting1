#load library and data.
library("lubridate")
library("sqldf")
powerdata <- read.csv.sql("data/household_power_consumption.txt",
    sql = "select * from file where Date =='1/2/2007' or Date = '2/2/2007'",sep = ";",header = TRUE)
#create a datatime variable, whose class is POSIXct
datatime <- dmy_hms(paste(powerdata$Date, powerdata$Time,sep = " "))
power2 <- data.frame(powerdata, datatime)
#make plots
png(filename = "Plot2.png",width = 480,height = 480)
plot(power2$datatime,power2$Global_active_power,type = "n",xlab="",ylab="Global Active Power (Kilowatts)")
lines(power2$datatime,power2$Global_active_power)
dev.off()