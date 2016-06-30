#Loading and Subsetting Data
household_power_consumption<-read.table("household_power_consumption.txt",header = T,stringsAsFactors = F,sep = ";",dec = ".")
subsetdata<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]

datetime<- strptime(paste(subsetdata$Date,subsetdata$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)
png("plot3.png",width = 480,height = 480)
plot(datetime,subMetering1,type = "l",xlab = "",ylab = "Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


