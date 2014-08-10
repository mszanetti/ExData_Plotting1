PATH2FILE <- "../household_power_consumption.txt"
data      <- read.table(PATH2FILE, sep=";", header=T, stringsAsFactors=F)
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S", tz="PDT")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data      <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02", ]

png("plot3.png", width=480, height=480)
plot(data$Time, as.numeric(data$Sub_metering_1), type="l", col=1, main="", xlab="", ylab="Energy Sub Metering")
lines(data$Time, as.numeric(data$Sub_metering_2), col=2)
lines(data$Time, as.numeric(data$Sub_metering_3), col=4)
legend("topright", c("Sub Metering 1","Sub Metering 2","Sub Metering 3"), col=c(1,2,4), lty=c(1,1,1))
dev.off()
