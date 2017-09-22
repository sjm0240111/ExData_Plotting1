#load library and data.
library("sqldf")
powerdata <- read.csv.sql("data/household_power_consumption.txt",
    sql = "select * from file where Date =='1/2/2007' or Date = '2/2/2007'",sep = ";",header = TRUE)
# #make plot
png(filename = "Plot1.png",width = 480,height = 480)
hist(powerdata$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global_active_power (Kilowatts)")
dev.off()