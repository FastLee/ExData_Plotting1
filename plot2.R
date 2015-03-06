hpc<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# Reading the file's content
hpc2<-hpc[hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007',]
# Subsetting the file to get the two relevant days
hpc2$timestamp<-strptime(paste(hpc2$Date,hpc2$Time,sep=" "),format="%d/%m/%Y %H:%M:%S", tz="PST8PDT")
# Creating a timestamp from the date and time columns. We set the timezone to PST, but it is meaningless for the charting.
png(filename="plots/plot2.png",width=480,height=480)
# Creating the PNG with the size requested in the requirements
plot(x=hpc2$timestamp,y=hpc2$Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatts)")
# Charting Global Active Power by datetime of the reading
dev.off()
# Closing the output device.