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


### Plot3
png('Plot3.png',width = 480, height = 480, units = "px")
plot(hpc1$date_time,hpc1$Sub_metering_1,type="l",ylim=c(0.0,38.0), xlab='',ylab = 'Energy sub metering',col='black')
par(new=T)
plot(hpc1$date_time,hpc1$Sub_metering_2,type="l",ylim=c(0.0,38.0),xlab='',ylab = 'Energy sub metering',col='red')
par(new=T)
plot(hpc1$date_time,hpc1$Sub_metering_3,type="l",ylim=c(0.0,38.0),xlab='',ylab = 'Energy sub metering',col='blue')
legend('topright',c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'), col=c("black", "red", "blue"), lty=1, cex=0.8)
par(new=F)
dev.off()
