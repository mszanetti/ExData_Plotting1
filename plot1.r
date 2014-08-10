PATH2FILE <- "../household_power_consumption.txt"
data      <- read.table(PATH2FILE, sep=";", header=T, stringsAsFactors=F)
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S", tz="PDT")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data      <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02", ]

png("plot1.png", width=480, height=480)
plot(hist(as.numeric(data$Global_active_power)), col=2, main="Global Active Power", xlab="Global Active Power (Kilowatts)", xlim=c(0,6))
dev.off()
