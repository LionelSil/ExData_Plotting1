hpc12[,3] <- as.numeric(hpc12[,3])

hpc12$dt <- paste(hpc12$Date, hpc12$Time, sep=" ")

hpc12$dt <- as.POSIXct(hpc12$dt,tz="UTC",format="%d/%m/%Y %H:%M:%S" )

plot(hpc12$dt, hpc12$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")

