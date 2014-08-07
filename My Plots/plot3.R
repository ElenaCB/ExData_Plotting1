##read the file

TotalData<-read.table("household_power_consumption.txt",sep=";", header=TRUE)

## Date format to the Date column
AsADate<-as.Date(TotalData[,1],"%d/%m/%Y")
## Find the location of the date "2007-02-01" and "2007-02-02"
location1<-grep("2007-02-01",AsADate)
location2<-grep("2007-02-02",AsADate)
##Subsetting the Data
Data<-TotalDate[c(location1,location2),]

## change as a numeric the values of the table for the columns Sub_metering_1,
## Sub_metering_2 and Sub_metering_3
sub_m_1<-as.numeric(as.character(Data$Sub_metering_1))
sub_m_2<-as.numeric(as.character(Data$Sub_metering_2))
sub_m_3<-as.numeric(as.character(Data$Sub_metering_3))


##plot the Date with Sub_metering_1 color black
plot(Data$Date,sub_m_1, type="l", col="black", ylab="Energy sub metering", main="",xlab="")

## plot the Date with Sub_metering_2, color red
lines(Data$Date,sub_m_2, type="l", col="red")

##plot the Date with Sub_metering_3, color blue
lines(Data$Date,sub_m_3, type="l", col="blue")

##Add the legend
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2)

## Copy the plot to a PNG file
dev.copy(png,file="plot3.png")

## Close the PNG device
dev.off()
