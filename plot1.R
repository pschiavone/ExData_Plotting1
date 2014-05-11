## script creates histogram chart with the color,
file = "household_power_consumption.txt" 

data = read.table(file = file, sep = ";", skip = 66637, nrows = 2880,
                  col.names = colnames(read.table(file, nrow = 1, header = TRUE, sep=";")))
                  
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(killowatts)")                  

dev.copy(png, file = "plot1.png") ## copyplot to a PNG file
dev.off() ## close the PNG device