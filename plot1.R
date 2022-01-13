#Exploratory Data Analysis Project 1

#install R packages needed
install.packages("dplyr")
library(dplyr)

#Get data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "C:/Users/Admin/Documents/R Projects/ExData_Plotting1/file.zip")
unzfile <- unzip("C:/Users/Admin/Documents/R Projects/ExData_Plotting1/file.zip")
source_file <- "./household_power_consumption.txt"

#Read data
data <- read.table(source_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset data
subsetdata <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

#Construct plot1
png(filename ="plot1.png", width = 480, height = 480, units="px") #launch png file
hist(as.numeric(subsetdata$Global_active_power), col="red", main="Global Active Power", 
     xlab ="Global Active Power (kilowatts)", ylab="Frequency")
dev.off() #close graphic device