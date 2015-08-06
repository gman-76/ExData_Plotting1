data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?")
data$Date = as.Date(data$Date,"%d/%m/%Y")
data = data[data$Date=="2007/2/1" | data$Date=="2007/2/2",]
png("plot1.png", width = 480, height = 480)
par(mar=c(5,5,3,1))
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red1",ylim=c(0,1200),cex.main=1,cex.lab=0.8,cex.axis=0.8)
dev.off()
