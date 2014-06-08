## Read household_power_consumption file and filter by Date.

rawfile <- file("household_power_consumption.txt", "r")
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(rawfile), value=TRUE), sep="\n", file="filtered.txt")
close(rawfile)

## Read the filtered file.
rawdata <- read.table  ("filtered.txt", sep=";", header=F, stringsAsFactors=F, skip=1)
headerdata <- read.table  ("filtered.txt", sep=".", stringsAsFactors=F, nrow=1)


##Create PNG file.
png("plot4.png", width=480, height=480)

## The Date and time were separated, so they are combined together to use with the strptime function.  
myDateTime <- paste(rawdata$V1,rawdata$V2 )

## Strptime was then applied to reformat the days and later plotted as Thurs, Friday and Saturday
## format function was used to defined the actual days of the week
(x <- strptime(myDateTime, format="%d/%m/%Y %H:%M:%S"))
format(x, "%H:%M:%S")

## Plot Multiple graphs two rows. mar command was used to define the margin of the plots. oma defined the outer margin area.

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0, 0, 2, 0))

## Plot 1 of daytime of Global Active Power
  plot(x, rawdata$V3,type= "l", xlab= "", ylab= "Global Active Power")         

## Plot 2 of daytime and Voltage 
  plot(x, rawdata$V5,type= "l", xlab = "daytime", ylab= "Voltage")

## Plot 3 of Energy sub metering
    
  plot(x, rawdata$V7, type= "l", xlab= "", ylab = "Energy sub metering")
  lines(x, rawdata$V8, type= "l", col= "red", xlab= "", ylab = "Energy sub metering")
  lines(x, rawdata$V9, type= "l", col= "blue", xlab= "", ylab = "Energy sub metering")

# For Plot3 Create a legend in the top-left corner that is slightly  
# smaller and has no border

  legend("topright", lty= 1 , col= c("black", "red", "blue"), bty="n", legend = c("Sub_metering_1", "Sub_metering_2" ,"Sub_metering_3"))

## Plot 4 of day time and Global reactive power

  plot(x, rawdata$V4, type= "l", xlab= "daytime", ylab = "Global_reactive_power")


dev.off()