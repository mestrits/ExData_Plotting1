setwd("~/documents/1_KM/1- EdX_Coursera_Udemy_Moocs/JHDS - Exploratory Data Analysis/Project#1/Project1_data")

#run dev.off() to make sure if there were prior par() settings, they are reset to defaults
dev.off()
#or alternatively can just specify the par() settings you would want
#par(mfrow= c(1,1))

#read in the data
hpc3 <- read.table("household_power_consumption.txt",header = TRUE, sep=";",  na.strings="?", stringsAsFactors=FALSE)

#subset the data for just the desired date range
hpc3sub <-subset(hpc3, Date %in% c("1/2/2007","2/2/2007"))

hpc3_datetime <- paste(hpc3sub$Date, hpc3sub$Time, sep=" ")

datetime <- strptime(hpc3_datetime, "%d/%m/%Y %H:%M:%S") 

# make sure to cast as numeric objects
GAPower <- as.numeric(hpc3sub$Global_active_power)
Sm1 <- as.numeric(hpc3sub$Sub_metering_1)
Sm2 <- as.numeric(hpc3sub$Sub_metering_2)
Sm3 <- as.numeric(hpc3sub$Sub_metering_3)


#specify the plot filename 
png("plot3.png", width=480, height=480)
plot(datetime, Sm1, type="l", ylab="Energy Sub_metering", xlab="")
lines(datetime, Sm2, type="l", col="red")
lines(datetime, Sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
dev.off()

## alternatively, to plot to the screen device

#hpc3sub$datetime <- as.POSIXct(datetime)
#with(hpc3sub, {
#  plot(Sm1~datetime, type="l",
#       ylab="Energy Sub_metering", xlab="")
#  lines(Sm2~datetime,col='Red')
#  lines(Sm3~datetime,col='Blue')
# })
#legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
#       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))







