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
plot(data$fdatetime,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",yaxs="i")
points(data$fdatetime,data$Sub_metering_1, col="black",type="l")
points(data$fdatetime,data$Sub_metering_2, col="red",type="l")
points(data$fdatetime,data$Sub_metering_3, col="blue",type="l")
legend("topright",col=c("black","red","blue"),lwd=2, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),xy.coords(,30:40),cex=.5)
# png Graph File
dev.copy(png,file="./plot3.png", width=480,height=480)
dev.off()