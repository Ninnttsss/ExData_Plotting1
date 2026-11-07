zip_file <- "household_power_consumption.zip"
txt_file <- "household_power_consumption.txt"

if (!file.exists(txt_file)) {
  if (!file.exists(zip_file)) {
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    # Uses R's default internal download method instead of curl
    download.file(url, destfile = zip_file, method = "auto")
  }
  unzip(zip_file)
}

data <- read.table(txt_file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data_sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

png(filename = "plot1.png", width = 480, height = 480)
hist(data_sub$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()