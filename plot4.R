data <- read.table('/home/smith/household_power_consumption.txt',header =FALSE, sep = ';',
                   quote = '', na.strings = '?',stringsAsFactors = FALSE, skip= 66637 , nrows = 2880)
cols <- strsplit(readLines('/home/smith/household_power_consumption.txt',1),split = ';')
names(data) <-make.names(cols[[1]])
data$dataTime <- strptime(paste(data$Date, data$Time),format = '%d/%m/%Y %H:%M:%S')

png('plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))
with(data, plot(dataTime,Global_active_power, ylab = 'Global_reactive_power', type ='l'))
with(data, plot(dataTime,Voltage,xlab = 'datetime', ylab = 'Voltage', type ='l'))
with(data, plot(dataTime,Sub_metering_1,xlab = NA, ylab = 'Energy sub-metering', type ='l'))
with(data,lines(dataTime,Sub_metering_2, col='red'))
with(data,lines(dataTime,Sub_metering_3, col='blue'))
legend('topright',legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'),
       lwd = 1)
with(data, plot(dataTime,Global_reactive_power,xlab = 'datetime', ylab = 'Global_reactive_power', type ='l'))
dev.off()