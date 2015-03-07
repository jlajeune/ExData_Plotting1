plot1 <- function(){

library(lubridate)
full_table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
full_table <- cbind(full_table, strptime((paste(dmy(full_table$Date), full_table$Time)),"%Y-%m-%d %H:%M:%S"))

#Update colnames
tab_names <- colnames(full_table)
tab_names[10] <- "datetime"
colnames(full_table) <- tab_names

#Get Subset of data
plot_data <- subset(full_table, datetime >= "2007-02-01" & datetime < "2007-02-03")

#Plot 1

png(filename = "plot1.png", height = 480, width = 480, units = "px")
hist(as.numeric(as.character(plot_data$Global_active_power)),main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()


}