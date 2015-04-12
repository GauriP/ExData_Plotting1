new <- read.table("household_power_consumption.txt",sep=";",skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrows=2879)
temp <- "Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3"
temp <- strsplit(temp,";")
temp <- cbind(unlist(temp))
colnames(new) <- temp
newdub <- new
newdub$Global_active_power <- as.numeric(as.character(newdub$Global_active_power))
newdub$Sub_metering_1 <- as.numeric(as.character(newdub$Sub_metering_1))
newdub$Sub_metering_2 <- as.numeric(as.character(newdub$Sub_metering_2))
newdub$Sub_metering_3 <- as.numeric(as.character(newdub$Sub_metering_3))
newdub$Voltage <- as.numeric(as.character(newdub$Voltage))
newdub$Global_reactive_power <- as.numeric(as.character(newdub$Global_reactive_power))

nw<- as.Date(newdub$Date, format="%d/%m/%Y")
tmp <- as.POSIXct(paste(nw,newdub$Time),"%Y-%m-%d %H:%M:%S")

png(filename="Plot4.png",height=480,width=480)
par(mfrow=c(2,2))

plot(tmp, newdub$Global_active_power,pch=".",xlab="",ylab="Global Active Power(kilowatts)")
lines(tmp, newdub$Global_active_power,type="l")

plot(tmp,newdub$Voltage,pch=".",xlab="datetime",ylab="Voltage")
lines(tmp,newdub$Voltage,col="black")

plot(tmp,newdub$Sub_metering_3,pch=".",ylab="Energy Sub Metering",ylim=c(0,40) )
lines(tmp, newdub$Sub_metering_1,col="black")
lines(tmp, newdub$Sub_metering_2,col="red")
lines(tmp, newdub$Sub_metering_3,col="blue")

plot(tmp,newdub$Global_reactive_power,pch=".",xlab="datetime",ylab="Global reactive power")
lines(tmp,newdub$Global_reactive_power,col="black")
dev.off()