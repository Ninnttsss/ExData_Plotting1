txt_file <- "household_power_consumption.txt"
data <- read.table(txt_file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data_sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(data_sub$Date, data_sub$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top-Left
plot(datetime, data_sub$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Top-Right
plot(datetime, data_sub$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Bottom-Left
plot(datetime, data_sub$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(datetime, data_sub$Sub_metering_2, col = "red")
lines(datetime, data_sub$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

# Bottom-Right
plot(datetime, data_sub$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()