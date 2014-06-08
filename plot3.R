df <- read.table("household_power_consumption.txt",header = TRUE, na.strings = "?", sep = ";")
df$Time <- strptime(paste(df$Date," ",df$Time), format = "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
feb <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]
with (feb, {
      plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
      lines(Time, Sub_metering_2, type = "l", col = "red")
      lines(Time, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", lwd = "1", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()