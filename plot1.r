#Loading and Subsetting Data
household_power_consumption<-read.table("household_power_consumption.txt",header = T,stringsAsFactors = F,sep = ";",dec = ".")
subsetdata<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]

#Plotting Histogram
globalActivePower<-as.numeric(subsetdata$Global_active_power)
png("plot1.png",width = 480,height = 480)
hist(globalActivePower,col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.off()