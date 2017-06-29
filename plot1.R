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
png("plot1.png", width = 480, height = 480)
hist(household$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)")
dev.off()
