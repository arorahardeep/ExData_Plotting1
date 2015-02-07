plot1 <- function() {
x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c(Date="character",Time="character",rep("numeric",7)),na.strings="?")
xd <- x[as.Date(x$Date,format="%d/%m/%Y") == as.Date("01-02-2007",format="%d-%m-%Y") | as.Date(x$Date,format="%d/%m/%Y") == as.Date("02-02-2007",format="%d-%m-%Y") ,]
rm(x)
hist(xd$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png", height=480, width=480)
dev.off()
}