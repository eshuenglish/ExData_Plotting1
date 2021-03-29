data <- read.table('/home/smith/household_power_consumption.txt',header =FALSE, sep = ';',
                   quote = '', na.strings = '?',stringsAsFactors = FALSE, skip= 66637 , nrows = 2880)
cols <- strsplit(readLines('/home/smith/household_power_consumption.txt',1),split = ';')
names(data) <-make.names(cols[[1]])
data$dataTime <- strptime(paste(data$Date, data$Time),format = '%d/%m/%Y %H:%M:%S')
png('plot2.png', width = 480, height = 480)
with(data, plot(dataTime,Global_active_power,xlab = NA, ylab = 'Global Active Power (Kilowatts)', type ='l'))
dev.off()
