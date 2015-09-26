## Introduction

This is an assignment project for coursera course "Getting and Cleaning Data" by John Hopkins.

The purpose of this project is to demonstrate student's ability to collect, work with, and clean a 
data set. The goal is to prepare tidy data that can be used for later analysis. 

## Obtaining the RAW data

One of the most exciting areas in all of data science right now is wearable computing - see for example this article:
http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/. 

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Student should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#####Note 1:
The data in "inertial folder" has been ignored. This data doesn't have column names.  
Step#2 asks to get rid of all the variables that are not "mean" or "standard deviation" so this 
data will be not be extrcated. So why take trouble merging it?

#####Note 2:
Per assignment instructions code assumes that the Samsung data has been 
downloaded and unzipped into a 'working directory'.
Script assumes that unzipped directory structure is maintained. 
Files are unzipped under 'UCI HAR Dataset' directory, so that is
considered as base directory. Please use 'setwd()' command to set working
directory as parent of 'UCI HAR Dataset' direcory.

## Code follows following logic to create required "tidy data set" from raw data

Define base directory and construct fully qualified file names

<!-- -->
	basedir = "./UCI HAR Dataset"
 	
	activity_labels = paste0(basedir,"/activity_labels.txt")
	features = paste0(basedir,"/features.txt")

	X_test = paste0(basedir,"/test/X_test.txt")
	 y_test = paste0(basedir,"/test/y_test.txt")
	subject_test = paste0(basedir,"/test/subject_test.txt")

	X_train = paste0(basedir,"/train/X_train.txt")
	y_train = paste0(basedir,"/train/y_train.txt")
	subject_train = paste0(basedir,"/train/subject_train.txt")

Read the test data file(X_test), associated subject data file (subject_test)
and associated training lable data file (y_test)

<!-- -->
	xTest <- read.table(X_test)
	subjectTest <- read.table(subject_test)
	yTest <- read.table(y_test)

Add subject info and activity info as left most columns. Thus, consolidated
'training' data is now ready.

<!-- -->
	xTest1 <- cbind(subjectTest, yTest, xTest)

Repeat above steps for training data files to prepare consolidated 'training' data.

<!-- -->
	 xTrain <- read.table(X_train)
	 subjectTrain <- read.table(subject_train)
	 yTrain <- read.table(y_train)

	xTrain1 <- cbind(subjectTrain, yTrain, xTrain)

Merge test and train data to create single data set

<!-- -->
	xAll <- rbind(xTest1, xTrain1)

Make and clean column names from 'feature.txt' file:

<!-- -->
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
	# assign column names to the consolidated data
	   names(xAll) <- n1

Create final data by selecting only "mean" and "standard deviation" columns

<!-- -->
	xFinal <- xAll[,c(1,2,grep("*[Mm]ean*",n1),grep("*std*",n1))]

Read activity lables from 'activity_labels' file and use the lables to replace
activity code with activity description

<!-- -->
	   activityLable <- read.table(activity_labels,stringsAsFactors = FALSE)  
	# replace activity column by descriptive activity names from labels read above
	   xFinal <- mutate(xFinal, activity = activityLable[activity,2])

Create new data table grouped by subject and activity and average of each column

<!-- -->
	xAvg <- xFinal %>% group_by(subject, activity) %>% summarize_each(c("mean"))

	# Write the new data to a text file
	   write.table(xAvg,"./AvgHumanActivityDataUsingSmartphone.txt", row.name=FALSE)

#####Note 3:
The code generates "wide" form of tidy data. One row per subject (30), per activity (6), thus total 180 rows.
One column for subject, activity and average of  'mean' and 'standard deviation'  columns from original
observations for  'subject'-'activity pair. (88 columns). Please note that subset was created by extracting all the 
columns which contained words "mean" or "std" (case insensitive) per 'features_info.txt' file. The generated
text file 'AvgHumanActivityDataUsingSmartphone.txt' can be read using:

<!-- -->
	df <- read.table("./AvgHumanActivityDataUsingSmartphone.txt". header=TRUE)

