#Read the data from a local drive after downloading from  UC Irvine ML website:   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
setwd("/Users/patm12/documents/coursera/dataVisualization/project1")
ep=read.table("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=F,header=T)
#select a subset of dates
ep=ep[ep$Date %in% c("1/2/2007","2/2/2007"),]
#create a dateTime field
ep$dateTime=paste(ep$Date,ep$Time)
ep$dateTime=strptime(ep$dateTime,format="%d/%m/%Y %H:%M:%S")

#create the plot and save to png file
png("plot4.png")

#layout is 2 X 2
par(mfrow=c(2, 2))

#plot1
plot(ep$dateTime,ep$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")

#plot2
plot(ep$dateTime,ep$Voltage,xlab="",ylab="Voltage",type="l")

#plot3
plot(ep$dateTime,ep$Sub_metering_1,xlab="",ylab="Energy Sub Metering",type="l")
lines(ep$dateTime, ep$Sub_metering_2,col="red")
lines(ep$dateTime, ep$Sub_metering_3,col="blue")
legend(x="topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),cex=.8,pt.cex = 1)

#plot4
plot(ep$dateTime,ep$Global_reactive_power,xlab="",ylab="Global_reactive_power",type="l",ylim=c(0,.5))
dev.off()