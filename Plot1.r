##window()
new <- read.table("household_power_consumption.txt",sep=";",skip=grep("1/2/2007",readLines("household_power_consumption.txt")),nrows=2879)
temp <- "Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3"
temp <- strsplit(temp,";")
temp <- cbind(unlist(temp))
colnames(new) <- temp
newdub <- new
newdub$Global_active_power <- as.numeric(as.character(newdub$Global_active_power))
png(filename="Plot1.png",height=480,width=480)
hist(newdub$Global_active_power, col ="red",ylim=c(0,1200),xlim=c(0,6),xlab="Global Active Power(kilowatts)",ylab="Frequency", main = "Global Active Power")
dev.off()