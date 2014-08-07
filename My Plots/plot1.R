##read the file

TotalData<-read.table("household_power_consumption.txt",sep=";", header=TRUE)

## Date format to the Date column
AsADate<-as.Date(TotalData[,1],"%d/%m/%Y")
## Find the location of the date "2007-02-01" and "2007-02-02"
location1<-grep("2007-02-01",AsADate)
location2<-grep("2007-02-02",AsADate)
##Subsetting the Data
Data<-TotalDate[c(location1,location2),]



## Create plot on screen with title, color, x label
with(Data,hist(as.numeric(as.character(Global_active_power)),main="Global Active Power", col="red", xlab="Global Active Power (Kilowatts)"))

## Copy the plot to a PNG file
dev.copy(png,file="plot1.png")

## Close the PNG device
dev.off()
