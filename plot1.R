## Read household_power_consumption file and filter by Date.

rawfile <- file("household_power_consumption.txt", "r")
cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(rawfile), value=TRUE), sep="\n", file="filtered.txt")
close(rawfile)

## Read the filtered file.
rawdata <- read.table  ("filtered.txt", sep=";", header=F, stringsAsFactors=F, skip=1)
headerdata <- read.table  ("filtered.txt", sep=".", stringsAsFactors=F, nrow=1)


##Create PNG file.
## plot 1 was created with defined color.
png("plot1.png", width=480, height=480)

hist(rawdata$V3, col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
dev.off()