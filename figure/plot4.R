#load library and data.
library("lubridate")
library("sqldf")
powerdata <- read.csv.sql("data/household_power_consumption.txt",
    sql = "select * from file where Date =='1/2/2007' or Date = '2/2/2007'",sep = ";",header = TRUE)
#create a datatime variable, whose class is POSIXct
datatime <- dmy_hms(paste(powerdata$Date, powerdata$Time,sep = " "))
power2 <- data.frame(powerdata, datatime)
#make plots
png(filename = "Plot4.png",width = 480,height = 480)
par(mfcol=c(2,2))
#(1,1)
plot(power2$datatime,power2$Global_active_power,type = "n",xlab="",ylab="Global Active Power")
lines(power2$datatime,power2$Global_active_power)
#(2,1)
plot(power2$datatime,power2$Sub_metering_1,type = "n",xlab="",ylab="Energy sub metering")
lines(power2$datatime,power2$Sub_metering_1)
lines(power2$datatime,power2$Sub_metering_2,col="red")
lines(power2$datatime,power2$Sub_metering_3,col="blue")
legend("topright", lty=1, col = c("black","red","blue"),cex=0.8,
       legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))
#(1,2)
plot(power2$datatime,power2$Voltage, type = "n",xlab="datetime",ylab="Voltage")
lines(power2$datatime,power2$Voltage)
#(2,2)
plot(power2$datatime,power2$Global_reactive_power, type = "n",xlab="datetime",ylab="Global_reactive_power")
lines(power2$datatime,power2$Global_reactive_power)
dev.off()