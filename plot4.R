# Read file to dataframe
file <- "household_power_consumption.txt"
df <- read.table(file, header=T, sep=";", na.strings = c("?"))

# Cast Date Column
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Remove all dates except 2007-02-01 and 2007-02-02
df <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
rownames(df) <- NULL

# Create DateTime Column
df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

# Initialize PNG File
png("plot4.png", width=480, height=480)

# Initialize Plot Area (2x2)
par(mfrow=c(2,2))

# Top Left Chart
plot(df$DateTime,
     df$Global_active_power,
     type="l",
     main="",
     xlab="",
     ylab="Global Active Power")

# Top Right Chart
plot(df$DateTime,
     df$Voltage,
     type="l",
     main="",
     xlab="datetime",
     ylab="Voltage")

# Bottom Left Chart
plot(df$DateTime,
     df$Sub_metering_1,
     type="l",
     main="",
     xlab="",
     ylab="Energy sub metering",
     col="Black")
lines(df$DateTime, df$Sub_metering_2, col="Red", type="l")
lines(df$DateTime, df$Sub_metering_3, col="Blue", type="l")
legend("topright",
       lty=1,
       bty="n",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Bottom Right Chart
plot(df$DateTime,
     df$Global_reactive_power,
     type="l",
     main="",
     xlab="datetime",
     ylab="Global_reactive_power")

# Save to png file
dev.off()