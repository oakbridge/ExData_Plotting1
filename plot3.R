## Data loading
library(readr)
household_power_consumption <- 
  read_delim("household_power_consumption.txt", 
             ";", 
             escape_double = FALSE, 
             col_types = cols("Date" = col_date(format = "%d/%m/%Y"), 
                              "Time" = col_time(format = "%H:%M:%S")), 
             na = "?", 
             trim_ws = TRUE)

# Subsetting data
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
household <- subset(household_power_consumption, Date >= startDate & Date <= endDate)

# Plot
png("plot3.png", width = 480, height = 480)
x <- as.POSIXct(paste(household$Date, household$Time))
plot(x, household$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x, household$Sub_metering_2, col="red")
lines(x, household$Sub_metering_2, col="red")
lines(x, household$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"))
dev.off()