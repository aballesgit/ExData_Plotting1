# EXPLORATORY DATA ANALYSIS
# Peer-graded Assignment: Course Project 1
# By Andrea Ballestero on 5/25/2020

# PLOT 2

# Load data

houseData <- read.csv("~/R/Coursera/ExData_Plotting1/household_power_consumption.txt", sep=";")
head(houseData)
dim(houseData)

# Add variable designating complete date and give it "date and time" format

library(dplyr)
library(lubridate)

houseData$Date <- dmy(houseData$Date)
houseData <- mutate(houseData, F_date = paste(houseData$Date, houseData$Time))
houseData <- mutate(houseData, Full_date = ymd_hms(houseData$F_date))

# Subset to data from "2007-02-01" to "2007-02-02"
houseD <- subset(houseData, houseData$Date >= "2007-02-01" & houseData$Date <= "2007-02-02")

# Set data as numeric
houseD$Global_active_power <- as.numeric(houseD$Global_active_power)
summary(houseD$Global_active_power)

# Save to png
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Make plot
plot(houseD$Full_date, houseD$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# Close device
dev.off()
