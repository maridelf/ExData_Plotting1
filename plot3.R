plot3 <- function(feb1_2 = data.frame(), readdata = TRUE) {
        
        library(dplyr)
        library(lubridate)

        source("getDataFeb1_2.R")
        
        if(readdata) {feb1_2 <- getDataFeb1_2()}

        with(feb1_2, plot(dt, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering"))
        with(feb1_2, points(dt, Sub_metering_2, col="red", type = "l"))
        with(feb1_2, points(dt, Sub_metering_3, col="blue", type = "l"))
        legend("topright", lty=1, 
               col = c("black","red", "blue"), 
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
               xjust = 1)
        
        ## by default png is 480x480 px
        dev.copy(png, file="plot3.png")
        dev.off()
}

