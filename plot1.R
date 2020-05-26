# EXPLORATORY DATA ANALYSIS
# Peer-graded Assignment: Course Project 1
# By Andrea Ballestero on 5/25/2020

# PLOT 1

# Load data

houseData <- read.csv("~/R/Coursera/ExData_Plotting1/household_power_consumption.txt", sep=";")
head(houseData)
dim(houseData)

library(lubridate)
houseData$Date <- dmy(houseData$Date)
houseData$Time <- hms(houseData$Time)

# Subset to data from "2007-02-01" to "2007-02-02"
houseD <- subset(houseData, houseData$Date >= "2007-02-01" & houseData$Date <= "2007-02-02")

# Set data as numeric
houseD$Global_active_power <- as.numeric(houseD$Global_active_power)
summary(houseD$Global_active_power)

# Save to png
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Make histogram
hist(houseD$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# Close device
dev.off()
