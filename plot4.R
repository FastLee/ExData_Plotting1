hpc<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# Reading the file's content
hpc2<-hpc[hpc$Date=='1/2/2007' | hpc$Date=='2/2/2007',]
# Subsetting the file to get the two relevant days
hpc2$timestamp<-strptime(paste(hpc2$Date,hpc2$Time,sep=" "),format="%d/%m/%Y %H:%M:%S", tz="PST8PDT")
# Creating a timestamp from the date and time columns. We set the timezone to PST, but it is meaningless for the charting.
png(filename="plots/plot4.png",width=480,height=480)
# Creating the PNG with the size requested in the requirements
par(mfrow=c(2,2))
# creating a 2X2 charting area
plot(x=hpc2$timestamp,y=hpc2$Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatts)")
# Charting Global Active Power by datetime of the reading
plot(x=hpc2$timestamp,y=hpc2$Voltage,type="l",xlab="",ylab="Voltage")
# Carting Voltage by timestamp.
plot(x=hpc2$timestamp,y=hpc2$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
# Generating the chart with metering 1 line
lines(x=hpc2$timestamp,y=hpc2$Sub_metering_2,col="red")
# Adding a red line for the metering 2 reading
lines(x=hpc2$timestamp,y=hpc2$Sub_metering_3,col="blue")
# Adding a blue line for the metering 3 reading
legend("topright",legend=paste("Sub_Metering_",1:3,sep=""),col=c("black","red","blue"),lty=1,lwd=3)
# Adding 3 legends for the 3 submetering types.
plot(x=hpc2$timestamp,y=hpc2$Global_reactive_power,type="l",xlab="",ylab="Global Reactive Power")
# Charting Global Reactive Power by Timestamp
dev.off()
