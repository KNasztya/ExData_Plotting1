getwd()
setwd("C:/Users/komorn/Documents/R course/04_Exploratory data/Week_1")

install.packages("sqldf")
library(sqldf)

#Download
filepath <- "./exdata_data_household_power_consumption/household_power_consumption.txt"

data<- read.csv.sql(filepath, sql = "select * from file where Date in ('1/2/2007','2/2/2007')"
                    , header = TRUE, sep = ";")

#Plot1
png(file = "plot1.png")
hist(data$Global_active_power, col="Red", main = paste("Global Active Power"),xlab = "Global Active Power (kilowatts)")
dev.off()