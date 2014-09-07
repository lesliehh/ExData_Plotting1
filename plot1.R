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
to    = "2007-02-01 23:59:00";
# Obtain the row values of the start-to values
fromInt <- which(rownames(df) == from)
toInt   <- which(rownames(df) == to)
# Subset the data with the start-to values and exclude the Date/Time columns
df <- df[fromInt:toInt,3:9]




#### PLOT 1

# Open PNG file
png(file = "plot1.png", width = 480, height = 480);

# Create the plot
hist(df$Global_active_power, freq = 200, col = "red", ann=FALSE);
title(main = "Global Active Power", 
      ylab="Frequency",
      xlab="Global Active Power (kilowatts)");

# Close the file
dev.off();




