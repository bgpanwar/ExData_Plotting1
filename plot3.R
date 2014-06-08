## Read household_power_consumption file and filter by Date.

rawfile <- file("household_power_consumption.txt", "r")
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(rawfile), value=TRUE), sep="\n", file="filtered.txt")
close(rawfile)

## Read the filtered file.
rawdata <- read.table  ("filtered.txt", sep=";", header=F, stringsAsFactors=F, skip=1)
headerdata <- read.table  ("filtered.txt", sep=".", stringsAsFactors=F, nrow=1)

##Create PNG files
png("plot3.png", width=480, height=480)

## The Date and time were separated, so they are combined together to use with the strptime function.  
myDateTime <- paste(rawdata$V1,rawdata$V2)

(x <- strptime(myDateTime, format="%d/%m/%Y %H:%M:%S"))
format(x, "%H:%M:%S")

## Plot 3 of Energy sub metering.
plot(x, rawdata$V7, type= "l", xlab= "", ylab = "Energy sub metering")
lines(x, rawdata$V8, type= "l", col= "red", xlab= "", ylab = "Energy sub metering")
lines(x, rawdata$V9, type= "l", col= "blue", xlab= "", ylab = "Energy sub metering")

##Y axis was annotated. Legend command was used to create border along the right hand corner

legend("topright", lty= 1 ,cex = 1, col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2" ,"Sub_metering_3"))

dev.off()