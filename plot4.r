#Loading and Subsetting Data
household_power_consumption<-read.table("household_power_consumption.txt",header = T,stringsAsFactors = F,sep = ";",dec = ".")
subsetdata<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]

datetime<- strptime(paste(subsetdata$Date,subsetdata$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(subsetdata$Global_active_power)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)
globalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()