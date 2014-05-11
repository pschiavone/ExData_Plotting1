## script creates line  chart with the x axis set to days

file = "household_power_consumption.txt" 

data = read.table(file = file, sep = ";", skip = 66637, nrows = 2880,
                  col.names = colnames(read.table(file, nrow = 1, header = TRUE, sep=";")))

days = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

plot(days, data$Global_active_power, type="l", xlab='', ylab="Global Active Power(kilowatts)")

dev.copy(png, file = "plot2.png") ## copyplot to a PNG file
dev.off() ## close the PNG device