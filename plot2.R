#data import
init_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors = FALSE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
init_data$Date<-as.Date(init_data$Date,"%d/%m/%Y")
required_dates<-as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d")
febdata<-init_data[init_data$Date==required_dates[1] | init_data$Date==required_dates[2] ,]
###############

#generation of time base, this generates weekday names in Polish
#I can change it using Sys.setlocale("LC_TIME", "English") but I dont want to mess with YOUR system
timebase<-strptime(paste(febdata$Date,febdata$Time),format = "%Y-%m-%d %H:%M:%S")

#plot generation
png(file="plot2.png")
plot(timebase,febdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()