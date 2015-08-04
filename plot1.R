## Read household_power_consumption file
hpc <- read.csv("C:/Users/Lionel/Downloads/Coursera - Data Scientist/Exploratory Data Analysis/household_power_consumption.txt", sep=";", colClasses="character")

## select 2007-02-01 and 2007-02-02
hpc1 <- subset(hpc, Date == "1/2/2007")
hpc2 <- subset(hpc, Date == "2/2/2007")
hpc12 <- rbind(hpc1, hpc2)

hpc12[,3] <- as.numeric(hpc12[,3])

##To see list of colors: colors(distinct=FALSE)


png(filename="plot1.png", width=480, height=480)
hist(hpc12$Global_active_power, col = "tomato2" , main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()