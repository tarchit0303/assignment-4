household<-read.table(file="C:/Users/acer/Documents/data analysis coursera/assignment coursera 4/household_power_consumption.txt",header=TRUE,sep=";",colClasses = "character",na.strings = "?")
february<-subset(household,Date %in% c("1/2/2007","2/2/2007"))
february$Date<-as.Date(february$Date,format="%d/%m/%Y")
datetime<-paste(february$Date,february$Time)
february$datetime<-as.POSIXct(datetime)
par(mfrow=c(2,2),mar=c(4,4,2,1),cex=0.55,cex.lab="1.4")
with(february,{
        plot(datetime,Global_active_power,type = "l",xlab="",ylab="Global Active Power")
        plot(datetime,Voltage,type = "l",xlab="datetime",ylab="Voltage")
        {
                plot(datetime,Sub_metering_1,type = "l",xlab = "",ylab="Energy sub metering")
                lines(february$datetime,february$Sub_metering_2,col="red")
                lines(february$datetime,february$Sub_metering_3,col="blue")
                legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1,bty="n",adj = -0.5,x.intersp = -2,cex = 1.3)
        }
        plot(datetime,Global_reactive_power,type = "l",xlab="datetime",ylab="Global_reactive_power")
})
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()
