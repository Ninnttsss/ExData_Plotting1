txt_file <- "household_power_consumption.txt"
data <- read.table(txt_file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data_sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(data_sub$Date, data_sub$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
plot(datetime, data_sub$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()