setwd("C:/Base/Education/MOOC/Johns Hopkins - Data Science Specialization/Exploratory Data Analysis/ExData_Plotting1");

file <- "../data/household_power_consumption.txt";

df = read.table(file, 
                sep = ";",
                na.strings = "?",
                header = TRUE);

# Could add stringsAsFactors=FALSE to the settings above 
# so that it does not import data as factors, which are a pain
# but is not necessary as paste() returns as character

# Convert the date factors to dates and make it the index of df
comb <- paste(df$Date, df$Time)
dates <- strptime(comb, format="%d/%m/%Y %H:%M:%S")
#dates <- as.Date(dates, format="%d/%m/%Y %H:%M:%S")
rownames(df) <- dates

# Declare the start-to values
from  = "2007-02-01 00:00:00";
to    = "2007-02-02 23:59:00";
# Obtain the row values of the start-to values
fromInt <- which(rownames(df) == from)
toInt   <- which(rownames(df) == to)
# Subset the data with the start-to values and exclude the Date/Time columns
df <- df[fromInt:toInt,3:9]




#### PLOT 3

# Open PNG file
png(file = "plot3.png", width = 480, height = 480);

# Create the plot
dates <- strptime(rownames(df), format="%Y-%m-%d %H:%M:%S")
plot(x = dates, y = df$Sub_metering_1, type="l", ann=FALSE);
lines(x = dates, y = df$Sub_metering_2, type="l", col="red");
lines(x = dates, y = df$Sub_metering_3, type="l", col="blue");
title(ylab="Energy sub metering");
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"),
       lty = 1);
box();

# Close the file
dev.off();
