data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
sub_data <- subset(data, Date == as.Date("2007-02-01")
                   | Date == as.Date("2007-02-02"))
sub_data <- sub_data[complete.cases(sub_data), ]
Date_Time <- paste(sub_data$Date, sub_data$Time)
reqd_data <- cbind(sub_data, Date_Time)
reqd_data$Date_Time <- as.POSIXct(Date_Time)
png(file = "plot2.png", width = 480, height = 480)
with(reqd_data, plot(Global_active_power ~ Date_Time, type = "l",
                     ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()