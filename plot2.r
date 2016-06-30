#Loading and Subsetting Data
household_power_consumption<-read.table("household_power_consumption.txt",header = T,stringsAsFactors = F,sep = ";",dec = ".")
subsetdata<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]

datetime<- strptime(paste(subsetdata$Date,subsetdata$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(subsetdata$Global_active_power)
png("plot2.png",width = 480,height = 480)
plot(datetime,globalActivePower,type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")
dev.off()