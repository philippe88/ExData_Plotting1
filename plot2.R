src <- "household_power_consumption.txt"
all_data <- read.table(src, header=TRUE, sep=";", na.strings = "?",
                       colClasses = c("character", "character", rep("numeric",7))
)
sdata <- subset(all_data, Date %in% c("1/2/2007","2/2/2007"))
rm(all_data)
sdata$ts <- strptime(paste(sdata[,1], sdata[,2]), "%d/%m/%Y %H:%M:%S")

# plot2
png(file="plot2.png", width = 480, height = 480)
with(sdata, plot(ts, Global_active_power, type="l", 
                 ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
