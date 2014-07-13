setwd("C:/Base/Education/MOOC/Johns Hopkins - Data Science Specialization/Exploratory Data Analysis/ExData_Plotting1");

file <- "../data/household_power_consumption.txt";

start = "2006-12-16 17:24:00";
from  = "2007-02-01 00:00:00";
to    = "2007-02-01 23:59:00";

colNames = c("Date", "Time", 
             "Global_active_power", 
             "Global_reactive_power", 
             "Voltage",
             "Global_intensity", 
             "Sub_metering_1", 
             "Sub_metering_2", 
             "Sub_metering_3");

daysDiff = as.numeric(difftime(from, start));
minutesInADay = 24 * 60;
maxRead = 2 * minutesInADay;
numSkip = daysDiff * minutesInADay;

df = read.table(file, 
                sep = ";",
                col.names = colNames,
                na.strings = "?", 
                nrows = maxRead, 
                skip = numSkip);


#### PLOT 1
# Open PNG file
png(file = "plot1.png");

# Create the plot
hist(df$Global_active_power, 
     freq = 200, 
     col = "red", 
     ann=FALSE);

title(main = "Global Active Power", 
      ylab="Frequency",
      xlab="Global Active Power (kilowatts)");

# Close the file
dev.off();




