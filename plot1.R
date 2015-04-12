# Read file to dataframe
file <- "household_power_consumption.txt"
df <- read.table(file, header=T, sep=";", na.strings = c("?"))

# Cast Date Column
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Remove all dates except 2007-02-01 and 2007-02-02
df <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
rownames(df) <- NULL

# Initialize PNG File
png("plot1.png", width=480, height=480)

# Display Histogram
hist(df$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

# Save to png file
dev.off()