get_data <- function() {
	t <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";"
								, na.strings = "?")
	t[t$Date == "1/2/2007" | t$Date == "2/2/2007", ]
	
}

x <- get_data()
x$DT <- strptime(paste(as.character(x$Date),as.character(x$Time), sep = " ")
								 , format = "%d/%m/%Y %H:%M:%S")

Sys.setlocale(category = "LC_ALL", locale = "en_US")
png("plot4.png", 480, 480)
par(mfrow = c(2, 2))

# first
plot(x$DT, x$Global_active_power, type = "l"
		 , ylab = "Global Active Power", xlab = "")

#second
plot(x$DT, x$Voltage, type = "l"
		 , ylab = "Voltage", xlab = "datetime")

# third
plot(x$DT, x$Sub_metering_1, type = "n", xlab = ""
		 , ylab = "Energy sub metering")
lines(x$DT, x$Sub_metering_1, col = "black")
lines(x$DT, x$Sub_metering_2, col = "red")
lines(x$DT, x$Sub_metering_3, col = "blue")
legend("topright"
			 , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
			 , col = c("black", "red", "blue")
			 , lty = 1
			 , bty = "n")

#forth
plot(x$DT, x$Global_reactive_power, type = "l"
		 , ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
