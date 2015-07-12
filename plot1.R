#Read Data
dat<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#Factors to Charactors for strptime and as.Date
newdate<-as.character(dat$Date)
newtime<-as.character(dat$Time)
datetime<-paste(newdate,newtime)
dat$fdatetime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")
dat$fdate<-as.Date(newdate,"%d/%m/%Y")
#Subset data for specific dates
dates<-as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d")
data<-subset(dat,fdate%in%dates)
#Graph Data
hist(data[,3],main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
#png Graph File
dev.copy(png,file="./plot1.png")
dev.off()