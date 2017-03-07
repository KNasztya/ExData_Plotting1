getwd()
setwd("C:/Users/komorn/Documents/R course/04_Exploratory data/Week_1")

install.packages("sqldf")
library(sqldf)

#Download
filepath <- "./exdata_data_household_power_consumption/household_power_consumption.txt"

data<- read.csv.sql(filepath, sql = "select * from file where Date in ('1/2/2007','2/2/2007')"
                    , header = TRUE, sep = ";")

data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

#Plot2
png(file = "plot2.png")
plot(data$DateTime, data$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
