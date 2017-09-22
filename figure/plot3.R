#load library and data.
library("lubridate")
library("sqldf")
powerdata <- read.csv.sql("data/household_power_consumption.txt",
    sql = "select * from file where Date =='1/2/2007' or Date = '2/2/2007'",sep = ";",header = TRUE)
datatime <- dmy_hms(paste(powerdata$Date, powerdata$Time,sep = " "))
power2 <- data.frame(powerdata, datatime)
#make plots
png(filename = "Plot3.png",width = 480,height = 480)
plot(power2$datatime,power2$Sub_metering_1,type = "n",xlab="",ylab="Energy sub metering")
lines(power2$datatime,power2$Sub_metering_1)
lines(power2$datatime,power2$Sub_metering_2,col="red")
lines(power2$datatime,power2$Sub_metering_3,col="blue")
legend("topright", lty=1, col = c("black","red","blue"),
       legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()