hpc<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# Reading the file's content
hpc2<-hpc[hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007',]
# Subsetting the file to get the two relevant days
hpc2$Date<-as.Date(hpc2$Date,'%d/%m/%Y')
# Converting the date to a date format
png(filename="plots/plot1.png",width=480,height=480)
# Creating the PNG with the size requested in the requirements
hist(hpc2$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power (Kilowatts)")
# Generating the histogram
dev.off()
# Closing the output device.

