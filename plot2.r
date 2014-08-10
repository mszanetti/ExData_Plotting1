PATH2FILE <- "../household_power_consumption.txt"
data      <- read.table(PATH2FILE, sep=";", header=T, stringsAsFactors=F)
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S", tz="PDT")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data      <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02", ]

png("plot2.png", width=480, height=480)
plot(data$Time, as.numeric(data$Global_active_power), type="l", col=1, main="", xlab="", ylab="Global Active Power (Kilowatts)")
dev.off()
