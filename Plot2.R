#
# Plot2 R Code
#

#Read Project Data



filename <- "household_power_consumption.txt"
pdata <- read.csv(filename, header = TRUE, sep = ";", na.strings = "?",
                  colClasses = c("character", "character", "numeric","numeric", "numeric",
                                 "numeric","numeric","numeric","numeric"))


# Filter Project Data and Remove this Large Dataframe from the Processing Environment

fdata <- subset(pdata, (pdata$Date =="1/2/2007" | pdata$Date =="2/2/2007") & complete.cases(pdata))
rm(pdata)

# Change Project Data -  Convert Date and Time
cdtdata <- paste(fdata$Date, fdata$Time)
cday <-strptime(cdtdata, "%d/%m/%Y %H:%M:%S")

# Plot Project Data and save it to a Graphics Device not the Screen
png(filename="Plot2.png", width=480, height=480, units="px", bg="white", res=NA)

with(fdata, plot(cday, Global_active_power,
     type = "l",
     xlab = " ",
     ylab = "Global Active Power(kilowatts)"))     

# close the Graphics Device
dev.off()


