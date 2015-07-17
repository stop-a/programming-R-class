corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  pollutant_data<-data.frame("Date"=character(),
                             "sulfate"=numeric(),
                             "nitrate"=numeric(),
                             "ID"=integer(),
                             stringsAsFactors=FALSE)
  
  # Operate on the files...
  fl <- list.files(directory,pattern=".csv",full.names=TRUE)
  for (k in 1:332) {
    pollutant_data<-rbind(pollutant_data,read.csv(fl[k]))  
  }
  
  sanitized<-subset(pollutant_data,sulfate != "NA", nitrate != "NA")
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  cor(sanitized$sulfate[1:threshold],sanitized$nitrate[1:threshold])
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
}