plot2 <- function() {
  x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c(Date="character",Time="character",rep("numeric",7)),na.strings="?")
  xd <- x[as.Date(x$Date,format="%d/%m/%Y") == as.Date("01-02-2007",format="%d-%m-%Y") | as.Date(x$Date,format="%d/%m/%Y") == as.Date("02-02-2007",format="%d-%m-%Y") ,]
  rm(x)
  xd$Date <- as.Date(xd$Date,format = "%d/%m/%Y")
  xd$Time <- as.POSIXct(paste(xd$Date,xd$Time))
  plot(xd$Global_active_power~xd$Time,type="l",ylab="Global Active Power (kilowatts)", xlab="")
  dev.copy(png,file="plot2.png", height=480, width=480)
  dev.off()
}