plot4 <- function(){
  
  library(lubridate)
  full_table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  full_table <- cbind(full_table, strptime((paste(dmy(full_table$Date), full_table$Time)),"%Y-%m-%d %H:%M:%S"))
  
  #Update colnames
  tab_names <- colnames(full_table)
  tab_names[10] <- "datetime"
  colnames(full_table) <- tab_names
  
  #Get Subset of data
  plot_data <- subset(full_table, datetime >= "2007-02-01" & datetime < "2007-02-03")
  
  #Plot 4
  
  png(filename = "plot4.png", height = 480, width = 480, units = "px")
  
  par(mfrow=c(2,2))
  
  plot(((plot_data$datetime)),as.numeric(as.character(plot_data$Global_active_power)), 
       type = "l", xlab = "", ylab = "Global Active Power")
  
  plot(((plot_data$datetime)),as.numeric(as.character(plot_data$Voltage)), 
       type = "l", xlab = "datetime", ylab = "Voltage")
  
  plot(((plot_data$datetime)),as.numeric(as.character(plot_data$Sub_metering_1)), 
       type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
  
  lines(((plot_data$datetime)),as.numeric(as.character(plot_data$Sub_metering_2)), 
        xlab = "", ylab = "Global Active Power (kilowatts)", col = "red")
  
  lines(((plot_data$datetime)),as.numeric(as.character(plot_data$Sub_metering_3)), 
        xlab = "", ylab = "Global Active Power (kilowatts)", col = "blue")
  
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black", "red", "blue"), lty = c(1,1), bty = "n")
  
  plot(((plot_data$datetime)),as.numeric(as.character(plot_data$Global_reactive_power)), 
       type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  par(mfrow=c(1,1))
  
  dev.off()
}