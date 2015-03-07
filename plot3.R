plot3 <- function(){
  
  library(lubridate)
  full_table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  full_table <- cbind(full_table, strptime((paste(dmy(full_table$Date), full_table$Time)),"%Y-%m-%d %H:%M:%S"))
  
  #Update colnames
  tab_names <- colnames(full_table)
  tab_names[10] <- "datetime"
  colnames(full_table) <- tab_names
  
  #Get Subset of data
  plot_data <- subset(full_table, datetime >= "2007-02-01" & datetime < "2007-02-03")
  
  #Plot 3
  png(filename = "plot3.png", height = 480, width = 480, units = "px")
  
  plot(((plot_data$datetime)),as.numeric(as.character(plot_data$Sub_metering_1)), 
       type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
  
  lines(((plot_data$datetime)),as.numeric(as.character(plot_data$Sub_metering_2)), 
        col = "red")
  
  lines(((plot_data$datetime)),as.numeric(as.character(plot_data$Sub_metering_3)), 
        col = "blue")
  
  #Legend
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black", "red", "blue"), lty = c(1,1))
  
  dev.off()
}