src <- "household_power_consumption.txt"
all_data <- read.table(src, header=TRUE, sep=";", na.strings = "?",
                       colClasses = c("character", "character", rep("numeric",7))
)
sdata <- subset(all_data, Date %in% c("1/2/2007","2/2/2007"))
rm(all_data)
sdata$ts <- strptime(paste(sdata[,1], sdata[,2]), "%d/%m/%Y %H:%M:%S")

# plot3
png(file="plot3.png", width = 480, height = 480)

with(sdata, plot(ts, Sub_metering_1, type="l", col = "black",
                 ylab="Energy sub metering", xlab=""))
with(sdata, lines(ts, Sub_metering_2, type="l", col="red"))
with(sdata, lines(ts, Sub_metering_3, type="l", col="blue"))
legend("topright", col = c("black", "red", "blue"), lty = 1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
       )

dev.off()