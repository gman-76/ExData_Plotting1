data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?")
data$Date = as.Date(data$Date,"%d/%m/%Y")
data = data[data$Date=="2007/2/1" | data$Date=="2007/2/2",]
data$DT = paste(data$Date,data$Time)
data$DateTime = strptime(data$DT,"%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(x=data$DateTime,y=data$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(x=data$DateTime,y=data$Global_active_power,type="l")
dev.off()