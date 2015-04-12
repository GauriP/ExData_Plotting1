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
nw<- as.Date(newdub$Date, format="%d/%m/%Y")
tmp <- as.POSIXct(paste(nw,newdub$Time),"%Y-%m-%d %H:%M:%S")

png(filename="Plot3.png",height=480,width=480)
plot(tmp,newdub$Sub_metering_3,pch=".",ylab="Energy Sub Metering",ylim=c(0,40) )
lines(tmp, newdub$Sub_metering_1,col="black")
lines(tmp, newdub$Sub_metering_2,col="red")
lines(tmp, newdub$Sub_metering_3,col="blue")
dev.off()

