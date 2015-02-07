plot3 <- function() {
  x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c(Date="character",Time="character",rep("numeric",7)),na.strings="?")
  xd <- x[as.Date(x$Date,format="%d/%m/%Y") == as.Date("01-02-2007",format="%d-%m-%Y") | as.Date(x$Date,format="%d/%m/%Y") == as.Date("02-02-2007",format="%d-%m-%Y") ,]
  rm(x)
  xd$Date <- as.Date(xd$Date,format = "%d/%m/%Y")
  xd$Time <- as.POSIXct(paste(xd$Date,xd$Time))
  
  ## Opened a png Device directly to work around the Legends clipping issue  
  png(file="plot3.png", height=480, width=480)
  
  plot(xd$Sub_metering_1~xd$Time,type="l",ylab="Energy sub metering", xlab="")
  lines(xd$Sub_metering_2~xd$Time,type="l",col="red")
  lines(xd$Sub_metering_3~xd$Time,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2,cex=0.8)
  #dev.copy(png,file="plot3.png", height=480, width=480)
  dev.off()
}