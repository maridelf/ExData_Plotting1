getDataFeb1_2 <- function() {
        ## create the data directory if not exists
        if(!file.exists("./data")) {dir.create("./data")}
        
        
        URL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        ## download file if not exists
        filedownl = "./data/datos.zip"
        
        ## downlFunc download the files from the URL
        if(!file.exists(filedownl)) { download.file(URL, destfile = filedownl, method = "auto") }
        
        ## filelist is (1,3) dimension, filelist[1,1] contains the file name
        filelist<-unzip(filedownl, list=TRUE) 
        ## unzip the file into the folder data if not exists
        fileextract <- paste0("./data/",filelist[1,1])
        if(!file.exists(fileextract)) { unzip(filedownl, exdir = "./data/.")}
        
        feb1_2 <- data.frame()
        ## open the conection
        con <- file(fileextract, "r")
        
        ## get a few row to obtain class and names
        initial <- read.table(con, nrows = 10, sep = ";", header = TRUE)
        nomb <- names(initial)
        class <- sapply(initial, class)
        rm(initial)
        ind = 0
        ## repeat read.table by 10000 rows and subseting data
        repeat {
                ## read 10000 rows
                x <- read.table(con, nrows = 10000, sep = ";", comment.char = "", 
                                stringsAsFactors = FALSE, na.strings = "?", 
                                header = FALSE, colClasses = class, col.names = nomb)
                ## if there are rows
                if (dim(x)[1]>0){ 
                        ## add column with date-time
                        x<- mutate(x, 
                                   dt = ymd_hms(format(strptime(paste(x$Date, x$Time),
                                                                "%d/%m/%Y %H:%M:%S"),
                                                       "%Y/%m/%d %H:%M:%S"))
                        )
                        ## subset 01/02/2007 and 02/02/2007
                        feb1_2 <- rbind(feb1_2, 
                                        subset(x, 
                                               (as.Date(dt) ==as.Date("2007-02-01") 
                                                | as.Date(dt) == as.Date("2007-02-02")
                                                
                                               )
                                        )
                        )
                }
                else {## end of file
                        ## if there are not rows exit repeat
                        break
                }
        }
        close(con)
        feb1_2
        
}
