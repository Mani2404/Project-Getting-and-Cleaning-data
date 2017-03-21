run_analysis <-  function(){
  
  #Link to download the zipped data
  dwldZip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  #download the file and save it in the workspace
  download.file(dwldZip,"dataRepo.zip", method = "curl")
  
  #Unzip the file
  if (!file.exists("UCI HAR Dataset")) { 
    unzip("dataRepo.zip") 
  }
  
  # Read train tables
  xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
  ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
  subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  # Read test tables
  xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
  ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
  subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  # Read feature tables
  features <- read.table('./UCI HAR Dataset/features.txt')
  
  # Read activity labels
  activitynames = read.table('./UCI HAR Dataset/activity_labels.txt')
  
  #Set column names for train and test
  colnames(xtrain) <- features[,2]
  colnames(xtest) <- features[,2]
  colnames(subjecttest) <- "subjectnum"
  colnames(ytrain) <- "activitynum"
  colnames(ytest) <- "activitynum"
  colnames(subjecttrain) <- "subjectnum"
  colnames(activitynames) <- c("activitynum","activitytype")
  
  #Merge the dataset into a single data frame
  train <- cbind(ytrain, subjecttrain,xtrain)
  test <- cbind(ytest, subjecttest,xtest)
  mergedata <-rbind(train, test)
  
  #Filter out mean and std columsn
  columnnames <- colnames(mergedata)
  subsetMeanSD <- (grepl("activitynum" , columnnames) | grepl("subjectnum" , columnnames) | grepl("mean.." , columnnames) | grepl("std.." , columnnames))
  mergedMeanSD <- mergedata[,subsetMeanSD==TRUE]
 
  #Merge the data with the activity type
  mapactivitynames <- merge(mergedMeanSD, activitynames, by = "activitynum", all.x = TRUE)
  
  #Subset tidy data
  meandata <- ddply(mapactivitynames, .(subjectnum, activitynum), numcolwise(mean))
  
  #write the subset tidy data to avg tidy file
  write.table(meandata,"./Project-Getting-and-Cleaning-data/avgtidy.txt", row.names = FALSE)
}