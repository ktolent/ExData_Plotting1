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
subsetdata$DateTime <- strptime(subsetdata$DateTime, format = "%d/%m/%Y %H:%M:%S")

#Construct plot4
png(filename="plot4.png", width=480, height=480, units = "px") #launch png file
par(mfrow=c(2,2))
with(subsetdata, plot(DateTime, Global_active_power, type="l", 
                      ylab="Global Active Power", xlab=""))
with(subsetdata, plot(DateTime, as.numeric(Voltage), type="l",
                      ylab="Voltage", xlab="datetime"))
with(subsetdata, plot(DateTime, as.numeric(Sub_metering_1), type="l",
                      ylab="Energy sub metering", xlab=""))
with(subsetdata, lines(DateTime, as.numeric(Sub_metering_2), col="red"))
with(subsetdata, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1 , bty="n", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(subsetdata, plot(DateTime, as.numeric(Global_reactive_power), type="l",
                      ylab="Global_reactive_power", xlab="datetime"))
dev.off() #close graphic device