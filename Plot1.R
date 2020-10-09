## The following codes will product a graph of Global Active Power from 1/2/2007 to 2/2/2007

#Load data
electricity <- read.csv('household_power_consumption.txt', sep = ';')

#Filter and get data for selected date: 1/2/2007 and 2/2/2007
selected_electricity <- subset(electricity, electricity$Date == '1/2/2007' | electricity$Date == '2/2/2007')

#Create a histogram of the Global Active Power
hist(as.numeric(selected_electricity$Global_active_power), col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

#Output the graph to an png file
dev.copy(png, file = 'Plot1.png')
dev.off()