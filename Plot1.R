setwd("C:/Users/ghuang02/Desktop/Coursera/Data Science/C4/Week 1/C4W1_proj")
### Read in household power consumption data for date 2007-02-01 and 2007-02-02
install.packages("sqldf")
library(sqldf)
hpc1 <- read.csv.sql("household_power_consumption.txt", header = TRUE,
                     sql = "select * from file where Date == '2/2/2007' or Date == '1/2/2007'", sep=";")
### replace ? with NA
hpc1[ hpc1 == "?" ] = NA
### Convert charactor to R date
hpc1$Date_n = as.Date(hpc1$Date,format="%d/%m/%Y")
### Convert charactor to R time
hpc1$Time_n = strptime(hpc1$Time,format="%H:%M:%S")

### Plot1
png('Plot1.png',width = 480, height = 480, units = "px")
hist(hpc1$Global_active_power,xlab = 'Global Active Power (killowatts)', main='Global Active Power', col='red')
dev.off()
