get_data <- function() {
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
								, "household_power_consumption.zip", method = "wget", extra = "-c")
	unzip("household_power_consumption.zip")
	t <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";"
								, na.strings = "?")
	t[t$Date == "1/2/2007" | t$Date == "2/2/2007", ]
	
}

x <- get_data()
Sys.setlocale(category = "LC_ALL", locale = "en_US")
png("plot1.png", 480, 480)
hist(x$Global_active_power, main = "Global Active Power", col = "red"
		 , xlab = "Global Active Power (kilowatts)")
dev.off()
