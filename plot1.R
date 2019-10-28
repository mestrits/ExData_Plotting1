setwd("~/documents/1_KM/1- EdX_Coursera_Udemy_Moocs/JHDS - Exploratory Data Analysis/Project#1/Project1_data")

#run dev.off() to make sure if there were prior par() settings, they are reset to defaults
dev.off()
#or alternatively can just specify the par() settings you would want
#par(mfrow= c(1,1))

#read in the data
hpc1 <- read.table("household_power_consumption.txt",header = TRUE, sep=";",  na.strings="?", stringsAsFactors=FALSE)

#subset the data for just the desired date range
hpc1sub <-subset(hpc1, Date %in% c("1/2/2007","2/2/2007"))

#specify the plot filename 
png("plot1.png", width=480, height=480)

#copy the plot to a file in my working directory
hist(hpc1sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#need to turn off the plotting device for it to work properly
dev.off()



