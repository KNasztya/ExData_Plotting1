getwd()
setwd("C:/Users/komorn/Documents/R course/04_Exploratory data/Week_1")

install.packages("sqldf")
library(sqldf)

#Download
filepath <- "./exdata_data_household_power_consumption/household_power_consumption.txt"

data<- read.csv.sql(filepath, sql = "select * from file where Date in ('1/2/2007','2/2/2007')"
                    , header = TRUE, sep = ";")

data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

#Plot4
# Give the chart file a name.
png(file = "plot4.png")
# Plot the chart.
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type = "l",ylab = "Global Active Power", xlab="")
plot(data$DateTime, data$Voltage, type = "l",ylab = "Voltage", xlab="datetime")

plot(data$DateTime, data$Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab="")
lines(data$DateTime,data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime,data$Sub_metering_3, type = "l", col = "blue")
legend("topright", # places a legend at the appropriate place 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       #lwd=c(2.5,2.5, 2.5),
       bty = "n",
       cex=1,
       col=c("black","red","blue")) # gives the legend lines the correct color and width

plot(data$DateTime, data$Global_reactive_power, type = "l",ylab = "Global_reactive_power", xlab="datetime")
# Save the file.
dev.off()