plot4 <- function() {
        
        library(dplyr)
        library(lubridate)

        source("getDataFeb1_2.R")
        source("plot2.R")
        source("plot3.R")
        
        
        feb1_2 <- getDataFeb1_2()
        par(mfcol = c(2,2), mar=c(4,4,2,1))
        
        plot2(feb1_2, readdata=FALSE)
        
        plot3(feb1_2, readdata=FALSE)
        
        with(feb1_2, plot(dt, Voltage, type = "l", xlab="datetime"))
        
        with(feb1_2, plot(dt, Global_reactive_power, type = "l", xlab="datetime"))


        ## by default png is 480x480 px
        dev.copy(png, file="plot4.png")
        dev.off()
}

