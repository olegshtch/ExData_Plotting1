get_data <- function() {
	t <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";"
									, na.strings = "?")
	t[t$Date == "1/2/2007" | t$Date == "2/2/2007", ]
	
}

x <- get_data()
x$DT <- strptime(paste(as.character(x$Date),as.character(x$Time), sep = " ")
								 	, format = "%d/%m/%Y %H:%M:%S")
Sys.setlocale(category = "LC_ALL", locale = "en_US")
png("plot3.png", 480, 480)
plot(x$DT, x$Sub_metering_1, type = "n", xlab = ""
		 	, ylab = "Energy sub metering")
lines(x$DT, x$Sub_metering_1, col = "black")
lines(x$DT, x$Sub_metering_2, col = "red")
lines(x$DT, x$Sub_metering_3, col = "blue")
legend("topright"
			 	, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
				, col = c("black", "red", "blue")
			  , lty = 1)

dev.off()
