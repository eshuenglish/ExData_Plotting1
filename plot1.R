data <- read.table('/home/smith/household_power_consumption.txt',header =TRUE, sep = ';',
                   quote = '', na.strings = '?',stringsAsFactors = FALSE, skip= 66636 , nrows = 2880)
colnames(data) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage',
                       'GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')
data$Date <- as.Date(data$Date, '%d/%m/%Y')
png('plot1.png', width = 480, height = 480)
with(data, hist(GlobalActivePower, col = 'red', xlab = 'Global Active Power (Kilowatts)',main = 'Global Active Power'))
dev.off()
   