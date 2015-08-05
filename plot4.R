## 2 by 2 graphs from household_power_consumption file

hpc <- read.csv("C:/Users/Lionel/Downloads/Coursera - Data Scientist/Exploratory Data Analysis/household_power_consumption.txt", sep=";", colClasses="character")

## select 2007-02-01 and 2007-02-02
hpc1 <- subset(hpc, Date == "1/2/2007")
hpc2 <- subset(hpc, Date == "2/2/2007")
hpc12 <- rbind(hpc1, hpc2)


hpc12[,3] <- as.numeric(hpc12[,3])
hpc12[,4] <- as.numeric(hpc12[,4])
hpc12[,5] <- as.numeric(hpc12[,5])
hpc12[,7] <- as.numeric(hpc12[,7])
hpc12[,8] <- as.numeric(hpc12[,8])
hpc12[,9] <- as.numeric(hpc12[,9])

## Create a new variable as concatenation of Date and Time and convert to POSIXct type
hpc12$dt <- paste(hpc12$Date, hpc12$Time, sep=" ")
hpc12$dt <- as.POSIXct(hpc12$dt,tz="UTC",format="%d/%m/%Y %H:%M:%S" )

## Plot as a png file
png(filename="plot4.png", width=480, height=480)

## Set up to put 2 by 2 plots on page
par(mfrow=c(2,2))

##plot 1
plot(hpc12$dt, hpc12$Global_active_power,type="l", ylab="Global Active Power", xlab="")

##plot 2
plot(hpc12$dt, hpc12$Voltage,type="l", ylab="Voltage", xlab="datetime")

## plot 3
## Set up axes and labels without actually plotting
plot(hpc12$dt, hpc12[ ,7],type="n", ylab="Energy sub metering", xlab="")
## Plot each variable as a line graph
lines(hpc12$dt, hpc12[ ,7],type="l", col="black")
lines(hpc12$dt, hpc12[ ,8],type="l", col="red")
lines(hpc12$dt, hpc12[ ,9],type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=c(1,1,1), col=c("black", "red", "blue"))

##plot4
plot(hpc12$dt, hpc12$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime")


dev.off()
