library(data.table)
f<- file.path(getwd(), "household_power_consumption.txt")
#there are 1440 minutes per day and we are reading 2 days: 2880 rows
dt <- read.table(f, nrows=2880, skip=66637,sep=';') 
setnames(dt,c("V1","V2","V3","V4","V5","V6","V7","V8","V9"), c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plots

dt$datestring<-paste(dt$Date,dt$Time,sep=" ")
dt$datestring<-strptime(dt$datestring,"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

#Plot1
plot(dt$datestring,dt$Global_active_power,type="l",xlab="",ylab="Global Active Power")
#Plot 3
plot(dt$datestring,dt$Voltage,type="l",xlab="datetime",ylab="Voltage")

#Plot 3
with(dt,plot(datestring,Sub_metering_1,main="",xlab="",ylab="Energy sub metering",type="n"))
with(dt,points(datestring,Sub_metering_1,col="black",type="l"))
with(dt,points(datestring,Sub_metering_2,col="red",type="l"))
with(dt,points(datestring,Sub_metering_3,col="blue",type="l"))
legend("topright",lty=1,col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot 4
plot(dt$datestring,dt$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,"plot4.png",width=450,height=450)
dev.off()
