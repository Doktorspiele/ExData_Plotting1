#data import
init_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors = FALSE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
init_data$Date<-as.Date(init_data$Date,"%d/%m/%Y")
required_dates<-as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d")
febdata<-init_data[init_data$Date==required_dates[1] | init_data$Date==required_dates[2] ,]
###############

#plot generation
png(file="plot1.png")
hist(febdata$Global_active_power,col="red", main = "Global Active Power", xlab = 'Global Active Power (kilowatts)')
dev.off()