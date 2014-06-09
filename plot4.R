
# Read headers and just the required data from the file into the data frame
header <- read.table('household_power_consumption.txt', header = FALSE,
                     sep = ';', nrows = 1, colClasses = 'character')
data <- read.table('household_power_consumption.txt', header = FALSE, sep = ';',
                   na.strings = c('?'), skip = 66637, nrows = 2880)
colnames(data) <- header[1, ]
data$Datetime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')

# Plot 4
png('./plot4.png', width = 480, height = 480, bg = 'transparent')
par(mfrow=c(2,2))

# Subplot 4.1
plot(data$Datetime, data$Global_active_power, type = 'l', main = '', xlab = '',
     ylab = 'Global Active Power')

# Subplot 4.2
plot(data$Datetime, data$Voltage, type = 'l', main = '', xlab = 'datetime',
     ylab = 'Voltage')

# Subplot 4.3
plot(data$Datetime, data$Sub_metering_1, type = 'l', main = '', xlab = '',
     ylab = 'Energy sub metering')
lines(data$Datetime, data$Sub_metering_2, col = 'red')
lines(data$Datetime, data$Sub_metering_3, col = 'blue')
legend('topright', lty = c(1, 1, 1), col = c('black', 'red', 'blue'), bty = 'n',
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# Subplot 4.4
plot(data$Datetime, data$Global_reactive_power, type = 'l', main = '',
     xlab = 'datetime', ylab = 'Global_reactive_power')
dev.off()

