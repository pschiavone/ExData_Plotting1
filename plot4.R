## script creates line chart with the x axis set to days

file = "household_power_consumption.txt" 

data = read.table(file = file, sep = ";", skip = 66637, nrows = 2880,
                  col.names = colnames(read.table(file, nrow = 1, header = TRUE, sep=";")))

days = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2), mar=c(4,4,1,1))


plot(days, data$Global_active_power, type="l", xlab='', ylab="Global Active Power(kilowatts)")

plot(days, data$Sub_metering_1, type="l", col="black", xlab='', ylab="Energy Sub Metering")
lines(days, data$Sub_metering_2, col="red")
lines(days, data$Sub_metering_3, col="blue")
legend("topright", legend=c(names(data)[7:9]), lty=1, col=c("black", "red", "blue"), cex=.25)

plot(days, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(days, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png") ## copyplot to a PNG file
dev.off() ## close the PNG device

