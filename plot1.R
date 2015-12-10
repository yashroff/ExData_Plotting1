library(data.table)
f<- file.path(getwd(), "household_power_consumption.txt")
#there are 1440 minutes per day and we are reading 2 days: 2880 rows
dt <- read.table(f, nrows=2880, skip=66637,sep=';') 
setnames(dt,c("V1","V2","V3","V4","V5","V6","V7","V8","V9"), c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot 1
hist(dt$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.copy(png,"plot1.png",width=450,height=450)
dev.off()
