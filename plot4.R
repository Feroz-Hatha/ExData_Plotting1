data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
sub_data <- subset(data, Date == as.Date("2007-02-01")
                   | Date == as.Date("2007-02-02"))
sub_data <- sub_data[complete.cases(sub_data), ]
Date_Time <- paste(sub_data$Date, sub_data$Time)
reqd_data <- cbind(sub_data, Date_Time)
reqd_data$Date_Time <- as.POSIXct(Date_Time)
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(reqd_data, {
  plot(Global_active_power ~ Date_Time, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Date_Time, type = "l", 
       ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Date_Time, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ Date_Time, col = "red")
  lines(Sub_metering_3 ~ Date_Time, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Date_Time, type = "l", 
       ylab = "Global_reactive_power", xlab = "datetime")
})
dev.off()