#Read the data from a local drive after downloading from  UC Irvine ML website:   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
setwd("/Users/patm12/documents/coursera/dataVisualization/project1")
ep=read.table("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=F,header=T)
#select a subset of dates
ep=ep[ep$Date %in% c("1/2/2007","2/2/2007"),]
#create a dateTime field
ep$dateTime=paste(ep$Date,ep$Time)
ep$dateTime=strptime(ep$dateTime,format="%d/%m/%Y %H:%M:%S")

#create the plot and save to png file
png("plot2.png")
plot(ep$dateTime,ep$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()