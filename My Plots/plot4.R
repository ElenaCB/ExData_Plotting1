##read the file

TotalData<-read.table("household_power_consumption.txt",sep=";", header=TRUE)

## Date format to the Date column
AsADate<-as.Date(TotalData[,1],"%d/%m/%Y")
## Find the location of the date "2007-02-01" and "2007-02-02"
location1<-grep("2007-02-01",AsADate)
location2<-grep("2007-02-02",AsADate)
##Subsetting the Data
Data<-TotalDate[c(location1,location2),]

## Change as a numeric the values of the table for the columns Sub_metering_1,
## Sub_metering_2, Sub_metering_3, Voltage, Global_active_power and
## Global_reactive_power
sub_m_1<-as.numeric(as.character(Data$Sub_metering_1))
sub_m_2<-as.numeric(as.character(Data$Sub_metering_2))
sub_m_3<-as.numeric(as.character(Data$Sub_metering_3))
Vol<-as.numeric(as.character(Data$Voltage))
G_A_P<-as.numeric(as.character(Data$Global_active_power))
G_R_P<-as.numeric(as.character(Data$Global_reactive_power))


## Create the plots per row, column and the respective plot in each place.
par(mfcol=c(2,2))
with(Data,{
plot(Date,G_A_P,ylab="Global Active Power", xlab="",main="", lty=1, lwd=1, type="s")
plot(Date,sub_m_1, type="l", col="black", ylab="Energy sub metering", main="",xlab="")
lines(Date,sub_m_2, type="l", col="red")
lines(Date,sub_m_3, type="l", col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,bty = "n")
plot(Date,Vol,xlab="datetime", ylab="Voltage", main="",type="s")
plot(Date,G_R_P,xlab="datetime",ylab="Global_reactive_power",main="",type="s")
})


## Copy the plot to a PNG file
dev.copy(png,file="plot4.png")

## Close the PNG device
dev.off()
