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


#### PLOT 4
# Open PNG file
png(file = "plot4.png");

# Create the plot
par(mfrow = c(2,2));
with(df, {
    
    ## 1
    # Create the plot
    plot(df$Global_active_power, type="l", axes=FALSE, ann=FALSE);
    axis(1, at=c(1,1450,2900),lab=c("Thu","Fri","Sat"));
    axis(2, las=1, at=2*0:3);
    title(ylab="Global Active Power (kilowatts)");
    box();
    
    ## 2
    # Create the plot
    plot(df$Voltage, type="l", axes=FALSE, ann=FALSE);
    axis(1, at=c(1,1450,2900),lab=c("Thu","Fri","Sat"));
    axis(2, las=1, at=c(234,238,242,246));
    title(ylab="Voltage", xlab="datetime");
    box();
    
    ## 3
    # Create the plot
    plot(df$Sub_metering_1, type="l", axes=FALSE, ann=FALSE);
    lines(df$Sub_metering_2, type="l", col="red");
    lines(df$Sub_metering_3, type="l", col="blue");
    axis(1, at=c(1,1450,2900),lab=c("Thu","Fri","Sat"));
    axis(2, las=1, at=10*0:3);
    title(ylab="Energy sub metering");
    legend("topright", 
           c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           col=c("black","red","blue"),
           lty = 1,
           bty="n");
    box();
    
    ## 4
    # Create the plot
    plot(df$Global_reactive_power, type="l", axes=FALSE, ann=FALSE);
    axis(1, at=c(1,1450,2900),lab=c("Thu","Fri","Sat"));
    axis(2, las=1, at=c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5));
    title(ylab="Global_reactive_power", xlab="datetime");
    box();
    
})


# Close the file
dev.off();