## script creates line chart with the x axis set to days

file = "household_power_consumption.txt" 

data = read.table(file = file, sep = ";", skip = 66637, nrows = 2880,
                  col.names = colnames(read.table(file, nrow = 1, header = TRUE, sep=";")))

days = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

plot(days, data$Sub_metering_1, type="l", col="black", xlab='', ylab="Energy Sub Metering")
lines(days, data$Sub_metering_2, col="red")
lines(days, data$Sub_metering_3, col="blue")
legend("topright", legend=c(names(data)[7:9]), lty=1, col=c("black", "red", "blue"), cex=.25)

dev.copy(png, file = "plot3.png") ## copyplot to a PNG file
dev.off() ## close the PNG device