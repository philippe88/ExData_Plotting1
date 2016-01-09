src <- "household_power_consumption.txt"
all_data <- read.table(src, header=TRUE, sep=";", na.strings = "?",
                     colClasses = c("character", "character", rep("numeric",7))
                     )
sdata <- subset(all_data, Date %in% c("1/2/2007","2/2/2007"))
rm(all_data)
sdata$ts <- strptime(paste(sdata[,1], sdata[,2]), "%d/%m/%Y %H:%M:%S")

# plot1
png(file="plot1.png", width = 480, height = 480)
hist(sdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()
