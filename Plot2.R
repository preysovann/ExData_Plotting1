## The following codes will generate a graph of Global Active Power vs. Time

#Load data
electricity <- read.csv('household_power_consumption.txt', sep = ';')

#Filter and get data for selected date: 1/2/2007 and 2/2/2007
selected_electricity <- subset(electricity, electricity$Date == '1/2/2007' | electricity$Date == '2/2/2007')

#Prepare and convert date and time item
selected_electricity$Time <- paste(selected_electricity$Date, selected_electricity$Time)
selected_electricity$Time <- strptime(selected_electricity$Time, format = '%d/%m/%Y %H:%M:%S')
selected_electricity$Date <- as.Date(selected_electricity$Date, format = '%d/%m/%Y')

#Plot Global Active Power vs. Time
plot(selected_electricity$Time, as.numeric(selected_electricity$Global_active_power), type = 'l', xlab = '', ylab = 'Global Active Power (killowatts)')


#Output the graph to an png file
dev.copy(png, file = 'Plot2.png')
dev.off()