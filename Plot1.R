library(dplyr)
library(lubridate)
q<-read.table("C:/Users/Admin/Documents/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",sep=";",header = T,dec = ".",stringsAsFactors=FALSE)
str(q)
q$Global_active_power<-as.numeric(q$Global_active_power)
q$Global_reactive_power<-as.numeric(q$Global_reactive_power)
q$Voltage<-as.numeric(q$Voltage)
q$Global_intensity<-as.numeric(q$Global_intensity)
q$Sub_metering_1<-as.numeric(q$Sub_metering_1)
q$Sub_metering_2<-as.numeric(q$Sub_metering_2)
q$Sub_metering_3<-as.numeric(q$Sub_metering_3)
q1 <- q[q$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(q1$Date, q1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Sys.setlocale("LC_ALL","English")

############# 1
png("plot1.png", width=480, height=480)
hist(q1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
