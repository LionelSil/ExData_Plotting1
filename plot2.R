## Read household_power_consumption file
hpc <- read.csv("C:/Users/Lionel/Downloads/Coursera - Data Scientist/Exploratory Data Analysis/household_power_consumption.txt", sep=";", colClasses="character")

## select 2007-02-01 and 2007-02-02
hpc1 <- subset(hpc, Date == "1/2/2007")
hpc2 <- subset(hpc, Date == "2/2/2007")
hpc12 <- rbind(hpc1, hpc2)
hpc12[,3] <- as.numeric(hpc12[,3])

## Create a new variable as concatenation of Date and Time and convert to POSIXct type

hpc12$dt <- paste(hpc12$Date, hpc12$Time, sep=" ")

hpc12$dt <- as.POSIXct(hpc12$dt,tz="UTC",format="%d/%m/%Y %H:%M:%S" )

## Plot as a png file
png(filename="plot2.png", width=480, height=480)
plot(hpc12$dt, hpc12$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

