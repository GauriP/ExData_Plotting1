new <- read.table("household_power_consumption.txt",sep=";",skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrows=2879)
temp <- "Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3"
temp <- strsplit(temp,";")
temp <- cbind(unlist(temp))
colnames(new) <- temp
newdub <- new
newdub$Global_active_power <- as.numeric(as.character(newdub$Global_active_power))
nw<- as.Date(new$Date, format="%d/%m/%Y")
tmp <- as.POSIXct(paste(nw,new$Time),"%Y-%m-%d %H:%M:%S")
png(filename="Plot2.png",height=480,width=480)
plot(tmp, newdub$Global_active_power,pch=".",xlab="",ylab="Global Active Power(kilowatts)")
lines(tmp, newdub$Global_active_power,type="l")
dev.off()