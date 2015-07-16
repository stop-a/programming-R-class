pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the csv files
  
    # Operate on the files...
    fl <- list.files(directory,pattern=".csv",full.names=TRUE)
    pollutant_data<-read.csv(fl[id])
    #pollutant_data$sulfate
    pollutant_data[pollutant]
    
    ## 'pollutant' is a character vector of length 1 indicaitng
    ## the name of the polluntant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
  
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    poll_mean<-mean(pollutant_data[pollutant],na.rm=TRUE)
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    #poll_mean
}