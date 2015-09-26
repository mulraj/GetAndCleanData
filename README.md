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

#Note 1:
The code generates "wide" form of tidy data. One row per subject (30), per activity (6), thus total 180 rows.
One column for subject, activity and average of  'mean' and 'standard deviation'  columns from original
observations for  'subject'-'activity pair. (88 columns). Please note that subset was created by extracting all the 
columns which contained words "mean" or "std" (case insensitive) per 'features_info.txt' file. The generated
text file 'AvgHumanActivityDataUsingSmartphone.txt' can be read using:

<!-- -->
	df <- read.table("./AvgHumanActivityDataUsingSmartphone.txt". header=TRUE)

#Note 2:
The data in "inertial folder" has been ignored. This data doesn't have column names.  
Step#2 asks to get rid of all the variables that are not "mean" or "standard deviation" so this 
data will be not be extrcated. So why take trouble merging it?

#Note 3:
Per assignment instructions code assumes that the Samsung data has been 
downloaded and unzipped into a 'working directory'.
Script assumes that unzipped directory structure is maintained. 
Files are unzipped under 'UCI HAR Dataset' directory, so that is
considered as base directory. Please use 'setwd()' command to set working
directory as parent of 'UCI HAR Dataset' direcory.

## Code follows following logic to create required "tidy data set" from raw data

1. Define base directory and construct fully qualified file names

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

2. read the test data file(X_test), associated subject data file (subject_test)
and associated training lable data file (y_test)

<!-- -->
	xTest <- read.table(X_test)
	subjectTest <- read.table(subject_test)