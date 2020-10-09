## The following codes will create a graph, plotting each type of sub-metering by datetime

#Load data
electricity <- read.csv('household_power_consumption.txt', sep = ';')

#Filter and get data for selected date: 1/2/2007 and 2/2/2007
selected_electricity <- subset(electricity, electricity$Date == '1/2/2007' | electricity$Date == '2/2/2007')

#Prepare and convert date and time item
selected_electricity$Time <- paste(selected_electricity$Date, selected_electricity$Time)
selected_electricity$Time <- strptime(selected_electricity$Time, format = '%d/%m/%Y %H:%M:%S')
selected_electricity$Date <- as.Date(selected_electricity$Date, format = '%d/%m/%Y')

#Plot energy sub-metering by time
plot(selected_electricity$Time, as.numeric(selected_electricity$Sub_metering_1), type = 'n', xlab = '', ylab = 'Energy sub-metering')
with(selected_electricity, lines(Time, as.numeric(Sub_metering_1)))
with(selected_electricity, lines(Time, as.numeric(Sub_metering_2), col = 'red'))
with(selected_electricity, lines(Time, as.numeric(Sub_metering_3), col = 'blue'))
legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

#Output the graph to an png file
dev.copy(png, file = 'Plot3.png')
dev.off()