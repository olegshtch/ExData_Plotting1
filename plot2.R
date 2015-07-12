get_data <- function() {
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
								, "household_power_consumption.zip", method = "wget", extra = "-c")
	unzip("household_power_consumption.zip")
	t <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";"
								, na.strings = "?")
	t[t$Date == "1/2/2007" | t$Date == "2/2/2007", ]
	
}

x <- get_data()
x$DT <- strptime(paste(as.character(x$Date),as.character(x$Time), sep = " ")
								 , format = "%d/%m/%Y %H:%M:%S")
Sys.setlocale(category = "LC_ALL", locale = "en_US")
png("plot2.png", 480, 480)
plot(x$DT, x$Global_active_power, type = "l"
		 , ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
