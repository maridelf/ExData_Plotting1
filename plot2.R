plot2 <- function(feb1_2 = data.frame(), readdata = TRUE) {

        library(dplyr)
        library(lubridate)
        
        source("getDataFeb1_2.R")
        
        if(readdata) {feb1_2 <- getDataFeb1_2()}
        with(feb1_2, plot(dt, Global_active_power,
                          main = "", 
                          type="l", 
                          xlab = "",
                          ylab = "Global Active Powers (kilowatts)")
        )
        ## by default png is 480x480 px
        dev.copy(png, file="plot2.png")
        dev.off()
}

