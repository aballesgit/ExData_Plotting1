# EXPLORATORY DATA ANALYSIS
# Peer-graded Assignment: Course Project 1
# By Andrea Ballestero on 5/25/2020

# PLOT 3

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
houseD$Sub_metering_1 <- as.numeric(houseD$Sub_metering_1)
houseD$Sub_metering_2 <- as.numeric(houseD$Sub_metering_2)
houseD$Sub_metering_3 <- as.numeric(houseD$Sub_metering_3)

# Save to png
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# Make plot
with(houseD, plot(Full_date, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(houseD, points(Full_date, Sub_metering_1, type = "l"))
with(houseD, points(Full_date, Sub_metering_2, col = "red", type = "l"))
with(houseD, points(Full_date, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close device
dev.off()
