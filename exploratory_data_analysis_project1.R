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

############# 2
png("plot2.png", width=480, height=480)
plot(datetime,q1$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab = "")
dev.off()

############# 3
png("plot3.png", width=480, height=480)
plot(datetime,q1$Sub_metering_1,type="l",col="black",ylab="Energy Submetering",xlab = "")
lines(datetime,q1$Sub_metering_2,type="l",col="red")
lines(datetime,q1$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


############# 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime,q1$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(datetime,q1$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(datetime,q1$Sub_metering_1,type="l",col="black",ylab="Energy Submetering",xlab = "")
lines(datetime,q1$Sub_metering_2,type="l",col="red")
lines(datetime,q1$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime,q1$Global_reactive_power,type="l",ylab="Global_reactive_power")
dev.off()