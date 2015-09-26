# Project for coursera course "Getting and Cleaning Data" by John Hopkins 

library(dplyr)

# Per assignment instructions code assumes that the Samsung data has been 
# downloaded and unzipped into a 'working directory'.
# Script assumes that unzipped directory structure is maintained. 
# Files are unzipped under 'UCI HAR Dataset' directory, so that is
# considered as base directory. Please use 'setwd()' command to set working
# directory as parent of 'UCI HAR Dataset' direcory.

basedir = "./UCI HAR Dataset"

run_analysis <- function() {
  
# contruct fully qualified files names by appending base directory
  activity_labels = paste0(basedir,"/activity_labels.txt")
  features = paste0(basedir,"/features.txt")

  X_test = paste0(basedir,"/test/X_test.txt")
  y_test = paste0(basedir,"/test/y_test.txt")
  subject_test = paste0(basedir,"/test/subject_test.txt")

  X_train = paste0(basedir,"/train/X_train.txt")
  y_train = paste0(basedir,"/train/y_train.txt")
  subject_train = paste0(basedir,"/train/subject_train.txt")

# ----------- prepare test data file -----------
# read the test data file(X_test), associated subject data file (subject_test)
# and associated training lable data file (y_test)
  xTest <- read.table(X_test)
  subjectTest <- read.table(subject_test)
  yTest <- read.table(y_test)

# add subject info and activity info as left most columns 
  xTest1 <- cbind(subjectTest, yTest, xTest)

# repeat above steps for training data files to prepare 'training' data set
  xTrain <- read.table(X_train)
  subjectTrain <- read.table(subject_train)
  yTrain <- read.table(y_train)

  xTrain1 <- cbind(subjectTrain, yTrain, xTrain)

# merge test and train data to create single set
  xAll <- rbind(xTest1, xTrain1)

# -------- make and clean column names from 'feature.txt' file ---------
# read features.txt to get the names to be assigned to columns
  f <- read.table(features)
# create data frame with lables for 2 columns(subject and activity) added to left
  nc <- data.frame(c(-1,0), c("subject", "activity"), stringsAsFactors = FALSE)
# assign same column names so that rows can be merged/bound
  names(nc) <- names(f) 
# add 'subject' and 'activity' lables for 2 left most columns 
  f1 <- rbind(nc,f)
# make valid names 
  n <- make.names(f1[,2])
# strip extra "..")
  n1 <- sub("\\.\\.","",n)
# assign column names
  names(xAll) <- n1

# create final data by selecting only "mean" and "standard deviation" columns
  xFinal <- xAll[,c(1,2,grep("*[Mm]ean*",n1),grep("*std*",n1))]

# read activity lables from 'activity_labels' file
  activityLable <- read.table(activity_labels,stringsAsFactors = FALSE)  
# replace activity column by descriptive activity names from labels read above
  xFinal <- mutate(xFinal, activity = activityLable[activity,2])

# create new data table grouped by subject and activity and average of each column
  xAvg <- xFinal %>% group_by(subject, activity) %>% summarize_each(c("mean"))

# Write the new data to a text file
  write.table(xAvg,"./AvgHumanActivityDataUsingSmartphone.txt", row.name=FALSE)
}  