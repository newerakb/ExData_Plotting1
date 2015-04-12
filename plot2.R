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
png("plot2.png", width=480, height=480)

# Display Line Chart
plot(df$DateTime,
     df$Global_active_power,
     type="l",
     main="",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Save to png file
dev.off()