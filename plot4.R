
# set working directory to the folder containing project data 
setwd("~/documents/1_KM/1- EdX_Coursera_Udemy_Moocs/JHDS - Exploratory Data Analysis/Project#1/Project1_data")

#run dev.off() to make sure if there were prior par() settings, they are reset to defaults
dev.off()

#read in the data
hpc4 <- read.table("household_power_consumption.txt",header = TRUE, sep=";",  na.strings="?", stringsAsFactors=FALSE)
hpc4sub <-subset(hpc4, Date %in% c("1/2/2007","2/2/2007"))
hpc4sub$Date <- as.Date(hpc4sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc4sub$Date), hpc4sub$Time)
hpc4sub$datetime <- as.POSIXct(datetime)

#set parameters of the plot area
#  - mfrow gives the layout of the plots
#  - mar() sets the plot area margins  c(bottom, left, top, right)
#  - oma() sets the outer margins for lines of text
par(mfrow=c(2,2), mar=c(4,4,3,1), oma=c(0,0,2,0))

with(hpc4sub, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power", xlab="", cex=0.5)
  plot(Voltage~datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1.5, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6)
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global_reactive_power",xlab="")
})

## Save to a file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
