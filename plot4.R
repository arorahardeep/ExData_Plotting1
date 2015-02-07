plot4 <- function() {
  x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c(Date="character",Time="character",rep("numeric",7)),na.strings="?")
  xd <- x[as.Date(x$Date,format="%d/%m/%Y") == as.Date("01-02-2007",format="%d-%m-%Y") | as.Date(x$Date,format="%d/%m/%Y") == as.Date("02-02-2007",format="%d-%m-%Y") ,]
  rm(x)
  xd$Date <- as.Date(xd$Date,format = "%d/%m/%Y")
  xd$Time <- as.POSIXct(paste(xd$Date,xd$Time))
  
  ## Opened a png Device directly to work around the Legends clipping issue
  png(file="plot4.png", height=480, width=480)
  par(mfrow=c(2,2))
  
  plot(xd$Global_active_power~xd$Time,type="l",ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(xd$Voltage~xd$Time,type="l",ylab="Voltage", xlab="datetime")
  
  
  plot(xd$Sub_metering_1~xd$Time,type="l",ylab="Energy sub metering", xlab="")
  points(xd$Sub_metering_2~xd$Time,type="l",col="red")
  points(xd$Sub_metering_3~xd$Time,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2,bty="n")
  
  plot(xd$Global_reactive_power~xd$Time,type="l",ylab="Global_reactive_power", xlab="datetime")
  
  #dev.copy(png,file="plot4.png", height=540, width=540)
  dev.off()
}