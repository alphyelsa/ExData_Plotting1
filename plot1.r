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
data$Date <- as.Date( as.character(data$Date), "%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )


png(filename="plot1.png", width=480, height=480, units="px")
with(data, hist(as.numeric(Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))
dev.off()