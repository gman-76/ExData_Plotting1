data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?")
data$Date = as.Date(data$Date,"%d/%m/%Y")
data = data[data$Date=="2007/2/1" | data$Date=="2007/2/2",]
data$DT = paste(data$Date,data$Time)
data$DateTime = strptime(data$DT,"%Y-%m-%d %H:%M:%S")
png("plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))
par(mar=c(5,5,2,0))
par(cex.lab=0.8,cex.axis=0.8)
    
plot(x=data$DateTime,y=data$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(x=data$DateTime,y=data$Global_active_power,type="l")

plot(x=data$DateTime,y=data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(x=data$DateTime,y=data$Sub_metering_1,type="l",col="black")
lines(x=data$DateTime,y=data$Sub_metering_2,type="l",col="red")
lines(x=data$DateTime,y=data$Sub_metering_3,type="l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), lwd=c(2,2,2), bty="n")

plot(x=data$DateTime,y=data$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(x=data$DateTime,y=data$Voltage,type="l")

plot(x=data$DateTime,y=data$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(x=data$DateTime,y=data$Global_reactive_power,type="l")

dev.off()