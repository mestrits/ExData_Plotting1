setwd("~/documents/1_KM/1- EdX_Coursera_Udemy_Moocs/JHDS - Exploratory Data Analysis/Project#1/Project1_data")

#run dev.off() to make sure if there were prior par() settings, they are reset to defaults
dev.off()
#or alternatively can just specify the par() settings you would want
#par(mfrow= c(1,1))

#read in the data
hpc2 <- read.table("household_power_consumption.txt",header = TRUE, sep=";",  na.strings="?", stringsAsFactors=FALSE)

#subset the data for just the desired date range
hpc2sub <-subset(hpc2, Date %in% c("1/2/2007","2/2/2007"))

#set date data format
hpc2sub$Date <- as.Date(hpc2sub$Date, format="%d/%m/%Y")
#add the time format to the date
hpc2_datetime <- paste(as.Date(hpc2sub$Date), hpc2sub$Time)
#add a column to the table with the new datetime
hpc2sub$datetime <- as.POSIXct(hpc2_datetime)

with(hpc2sub, {plot(Global_active_power~datetime, type="l",
                    ylab="Global Active Power (kilowatts)", xlab="")})

#copy the plot to a file in my working directory
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()



