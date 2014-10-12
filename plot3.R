####################
##Exploratory Data Analysis
##Project 1 plot 3
####################

##Reading and cleaning data
##Set proper working directory containing dataset
colNames <- c("date", "time", "global_active_power", "global_reactive_power", "voltage",
              "global_intensity", "sub_metering1", "sub_metering2", "sub_metering3")
colClasses = c("character", "character", rep("numeric",7) )

data <- read.table("./Data/household_power_consumption.txt",header=T,sep=";",
                   col.names=colNames,colClasses=colClasses,na.strings="?")
data$date <- as.Date(data$date, format="%d/%m/%Y")
data<-  data[data$date >= as.Date("2007-02-01") & data$date<=as.Date("2007-02-02"),]

#Creating plot as png file
png(filename="plot3.png", width=480, height=480, units="px",bg="transparent")

with(data, plot(sub_metering1,type="l",xaxt="n",xlab="",ylab="Energy sub metering"))
lines(data$sub_metering2, col="red")
lines(data$sub_metering3, col="blue")
legend("topright",lty=1,col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(side=1, at=c(0, length(data$date)/2, length(data$date)),
     labels=c("Thu", "Fri", "Sat"))

dev.off()
