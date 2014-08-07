##read the file

TotalData<-read.table("household_power_consumption.txt",sep=";", header=TRUE)

## Date format to the Date column
AsADate<-as.Date(TotalData[,1],"%d/%m/%Y")
## Find the location of the date "2007-02-01" and "2007-02-02"
location1<-grep("2007-02-01",AsADate)
location2<-grep("2007-02-02",AsADate)
##Subsetting the Data
Data<-TotalDate[c(location1,location2),]

## joint Date and time in just one column
Data$Date<-strptime(paste(Data$Date, Data$Time),"%d/%m/%Y %H:%M:%S")

##plot the data
G_A_P<-(as.numeric(as.character(Data$Global_active_power)))
plot(Data$Date,G_A_P,ylab="Global Active Power (Kilowatts)", xlab="",main="", lty=1, lwd=1, type="s")

## Copy the plot to a PNG file
dev.copy(png,file="plot2.png")

## Close the PNG device
dev.off()
