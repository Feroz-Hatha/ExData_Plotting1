data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
sub_data <- subset(data, Date == as.Date("2007-02-01")
                   | Date == as.Date("2007-02-02"))
sub_data <- sub_data[complete.cases(sub_data), ]
png(file = "plot1.png", width = 480, height = 480)
hist(sub_data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()