#
# Plot4 R Code
#

#Read Project Data

filename <- "household_power_consumption.txt"
pdata <- read.csv(filename, header = TRUE, sep = ";", na.strings = "?",
                  colClasses = c("character", "character", "numeric","numeric", "numeric",
                                 "numeric","numeric","numeric","numeric"))


# Filter Project Data and Remove this Large Dataframe from the Processing Environment

fdata <- subset(pdata, (pdata$Date =="1/2/2007" | pdata$Date =="2/2/2007") & complete.cases(pdata))
rm(pdata)

# Change Project Data - Convert Date and Time
cdtdata <- paste(fdata$Date, fdata$Time)
cday <-strptime(cdtdata, "%d/%m/%Y %H:%M:%S")

groups <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colors <- c("black", "Red", "blue")
# Plot Project's 4 graphs and save them on the same Graphics Device not the Screen
png(filename="Plot4.png", width=480, height=480, units="px", bg="white", res=NA)
par(mfcol= c(2,2), mar = c(4,4,2,1))

with(fdata, plot(cday, Global_active_power,                         #Plot Line Graph 1
                 type = "l",
                 xlab = " ",
                 ylab = "Global Active Power(kilowatts)"))    
plot(cday, fdata$Sub_metering_1,                                    #Plot Line Graph 2
     type = "n",                        
     xlab = "",
     ylab = "Energy sub metering")

     lines(cday, fdata$Sub_metering_1, col = "black", type = "l")
     lines(cday, fdata$Sub_metering_2, col = "Red",type = "l")
     lines(cday, fdata$Sub_metering_3, col = "blue", type = "l")
     legend("topright", legend = groups, bty = "n", lty = 1, col = colors)

with(fdata, plot(cday, Voltage,                                      #Plot Line Graph 3
                 type = "l",
                 xlab = " datetime")) 
lines(cday, fdata$Voltage,
                  type = "l")

with(fdata, plot(cday, Global_reactive_power,                        #Plot Line Graph 4
                 type = "l",  
                 xlab = " datetime"))
            lines(cday, fdata$Global_reactive_power)

# close the Graphics Device
dev.off()


