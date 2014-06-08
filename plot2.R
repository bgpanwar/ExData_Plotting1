## Read household_power_consumption file and filter by Date.

rawfile <- file("household_power_consumption.txt", "r")
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(rawfile), value=TRUE), sep="\n", file="filtered.txt")
close(rawfile)

## Read the filtered file.
rawdata <- read.table  ("filtered.txt", sep=";", header=F, stringsAsFactors=F, skip=1)
headerdata <- read.table  ("filtered.txt", sep=".", stringsAsFactors=F, nrow=1)


##Create PNG files
png("plot2.png", width=480, height=480)


## The Date and time were separated, so they are combined together to use with the strptime function.
myDateTime <- paste(rawdata$V1,rawdata$V2)

(x <- strptime(myDateTime, format="%d/%m/%Y %H:%M:%S"))
format(x, "%H:%M:%S")

## Plot 2 of daytime of Global Active Power
plot(x, rawdata$V3, type= "l", xlab= "",ylab = "Global Active Power (kilowatts)" )

dev.off()