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

#Format variables
subsetdata$DateTime <- strptime(subsetdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)

#Construct plot2
png(filename = "plot2.png", width = 480, height = 480, units="px") #launch png file
with(subsetdata, plot(DateTime, Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)"))
dev.off() #close graphic device