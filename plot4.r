# Set the working directory
setwd("D:\\DataScience\\CourseEra\\04.ExploratoryDataAnalysis\\41Project")

# Download the zip file and extract to folder
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("exdata_data_household_power_consumption.zip")){
  download.file(url,"exdata_data_household_power_consumption.zip", mode = "wb")
}
unzip("exdata_data_household_power_consumption.zip", files = NULL, exdir=".")

# Read the data from training set
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header = TRUE, sep= ";")
data$datetime<-paste(data$Date, data$Time)
data$Date <- as.Date( as.character(data$Date), "%d/%m/%Y")
data$datetime<-strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
data4 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

png(filename="plot4.png", width=480, height=480, units="px")
par(mfcol=c(2,2))

#1
plot(data4$datetime, as.numeric(as.character(data4$Global_active_power)),type='l',ylab="Global Active Power (Kilowatts)", xlab="")

#2
with(data4, plot(datetime, as.numeric(as.character(Sub_metering_1)), type="l", col="black", ylab="Energy sub metering", xlab=""))
with(data4, lines(datetime, as.numeric(as.character(Sub_metering_2)), col="red"))
with(data4, lines(datetime, as.numeric(as.character(Sub_metering_3)), col="blue"))
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"))

#3
plot(data4$datetime, as.numeric(as.character(data4$Voltage)),type='l', ylab="Voltage", xlab="datetime")

#4
plot(data4$datetime, as.numeric(as.character(data4$Global_reactive_power)),type='l', ylab="Global_reactive_power", xlab="datetime")

dev.off()