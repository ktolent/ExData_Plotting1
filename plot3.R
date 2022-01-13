#Exploratory Data Analysis Project 1

#install R packages needed
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)

#Get data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "C:/Users/Admin/Documents/R Projects/ExData_Plotting1/file.zip")
unzfile <- unzip("C:/Users/Admin/Documents/R Projects/ExData_Plotting1/file.zip")
source_file <- "./household_power_consumption.txt"

#Read data
data <- read.table(source_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset data
subsetdata <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

#Add DateTime variable
subsetdata <- mutate(subsetdata, DateTime = paste(Date, Time, sep=" "))

#Construct plot3
png(filename="plot3.png", width=480, height=480, units="px") #launch png file
with(subsetdata, plot(DateTime, as.numeric(Sub_metering_1), type="l",
     xlab="", ylab="Energy sub metering"))
with(subsetdata, lines(DateTime, as.numeric(Sub_metering_2), col="red"))
with(subsetdata, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1 , col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() #close graphic device

