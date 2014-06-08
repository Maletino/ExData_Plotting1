df <- read.table("household_power_consumption.txt",header = TRUE, na.strings = "?", sep = ";")
df$Time <- strptime(paste(df$Date," ",df$Time), format = "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
feb <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]
hist(feb$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()