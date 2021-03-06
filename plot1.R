
# Read headers and just the required data from the file into the data frame
header <- read.table('household_power_consumption.txt', header = FALSE,
                     sep = ';', nrows = 1, colClasses = 'character')
data <- read.table('household_power_consumption.txt', header = FALSE, sep = ';',
                   na.strings = c('?'), skip = 66637, nrows = 2880)
colnames(data) <- header[1, ]
data$Datetime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')

# Plot 1
png('./plot1.png', width = 480, height = 480, bg = 'transparent')
hist(data$Global_active_power, breaks = 12, col = 'red', ylab = 'Frequency',
     main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()

