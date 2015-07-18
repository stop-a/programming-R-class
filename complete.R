complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  # Initialize data.frame
  pollutant_data<-data.frame("Date"=character(),
                             "sulfate"=numeric(),
                             "nitrate"=numeric(),
                             "ID"=integer(),
                             stringsAsFactors=FALSE)
  
  # Operate on the files...
  fl <- list.files(directory,pattern=".csv",full.names=TRUE)
  for (k in id) {
    pollutant_data<-rbind(pollutant_data,read.csv(fl[k]))  
  }
  
  sanitized<-subset(pollutant_data,sulfate != "NA")
  sanitized<-subset(sanitized, nitrate != "NA")
  
  response<-data.frame("id"=integer(),"nobs"=integer(),stringsAsFactors=FALSE)
  
  for (l in id) {
    obs<-subset(sanitized,ID==l)
    response<-rbind(response,data.frame(id=l,nobs=length(obs[[4]])))
  }
  
  response
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}
