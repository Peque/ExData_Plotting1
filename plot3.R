
# Read headers and just the required data from the file into the data frame
header <- read.table('household_power_consumption.txt', header = FALSE,
                     sep = ';', nrows = 1, colClasses = 'character')
data <- read.table('household_power_consumption.txt', header = FALSE, sep = ';',
                   na.strings = c('?'), skip = 66637, nrows = 2880)
colnames(data) <- header[1, ]
data$Datetime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')

# Plot 3
png('./plot3.png', width = 480, height = 480, bg = 'transparent')
plot(data$Datetime, data$Sub_metering_1, type = 'l', main = '', xlab = '',
     ylab = 'Energy sub metering')
lines(data$Datetime, data$Sub_metering_2, col = 'red')
lines(data$Datetime, data$Sub_metering_3, col = 'blue')
legend('topright', lty = c(1, 1, 1), col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()

