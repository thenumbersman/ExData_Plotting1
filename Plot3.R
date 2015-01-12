#
# Plot3 R Code
#

#Read Project Data



filename <- "household_power_consumption.txt"
pdata <- read.csv(filename, header = TRUE, sep = ";", na.strings = "?",
                  colClasses = c("character", "character", "numeric","numeric", "numeric",
                                 "numeric","numeric","numeric","numeric"))


# Filter Project Data and Remove this Large Dataframe from the Processing Environment

fdata <- subset(pdata, (pdata$Date =="1/2/2007" | pdata$Date =="2/2/2007") & complete.cases(pdata))
#rm(pdata)

# Change Project Data - Convert Date and Time
cdtdata <- paste(fdata$Date, fdata$Time)
cday <-strptime(cdtdata, "%d/%m/%Y %H:%M:%S")

groups <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colors <- c("black", "Red", "blue")

# Plot Project Data and save it to a Graphics Device, not the Screen
png(filename="Plot3.png", width=480, height=480, units="px", bg="white", res=NA)

plot(cday, fdata$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")
lines(cday, fdata$Sub_metering_1, col = "black", type = "l")
lines(cday, fdata$Sub_metering_2, col = "Red",type = "l")
lines(cday, fdata$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = groups, bty = "1", lty = 1, col = colors)

# close the Graphics Device
dev.off()


