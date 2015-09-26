### Codebook a.k.a Data Dictionary for "AvgHumanActivityDataUsingSmartphone.txt"

This document provides description of fields in "AvgHumanActivityDataUsingSmartphone.txt" file. Data in this dataset has been derived from 
original work acknoweledged in 'License and Acknowledgement' section at the end for this file. 

The details of original data is available in:

1. smartlab_readme.txt
2. smartlab_features_info.txt
3. smartlab_features.txt

The description of how the data in  "AvgHumanActivityDataUsingSmartphone.txt" was derived is available in:
README.md. 

Each record contains average readings on 'mean' and 'std' (standard deviation) reading for each subject for each activity.

Field Name | Field Type | Description
subject | integer | Values 1 to 30. Identifies each volunteer for which the data was captured.
activity | character | Describes activities for which rest of the average reading are applicable.

Rest of the columns capture the average of 'mean' and 'std' readings from original dataset. The detailed description is available in the
'smartlab; files above - the column name are constructed to describe the data as below:

1. 't' indicates time domain signal. For 'Fast Fourier Transform' readings this value is 'f'
2. 'Body' indicates body signal. "greavity' indicates gravity signal.
3. 'Acc' indicates that this signal was captured by accelerometer. 'Gyro' indicates captured by gyroscope.
    'AccJerk'  and 'GyroJerk' indicate 'jerk' signals.
    'AccMag', 'GravityAccMag', 'AccJerkMag', 'GyroMag', 'GyroJerkMag' indicate magnitude.
4. 'mean' indicates that it's average of 'mean' columns of original data. 'std' indicates  average of standard deviation columns of original data.
5. 'X' indicates X axis signal. 'Y' indicates Y axis. 'Z' indicates Z axis.

tBodyAcc.mean.X
tBodyAcc.mean.Y
tBodyAcc.mean.Z

tGravityAcc.mean.X
tGravityAcc.mean.Y
	tGravityAcc.mean.Z
	tBodyAccJerk.mean.X
	tBodyAccJerk.mean.Y
	tBodyAccJerk.mean.Z
	tBodyGyro.mean.X
	tBodyGyro.mean.Y
	tBodyGyro.mean.Z
	tBodyGyroJerk.mean.X
	tBodyGyroJerk.mean.Y
	tBodyGyroJerk.mean.Z
	tBodyAccMag.mean
	tGravityAccMag.mean
	tBodyAccJerkMag.mean
	tBodyGyroMag.mean
	tBodyGyroJerkMag.mean
	fBodyAcc.mean.X
	fBodyAcc.mean.Y
	fBodyAcc.mean.Z
	fBodyAcc.meanFreq.X
	fBodyAcc.meanFreq.Y
	fBodyAcc.meanFreq.Z
	fBodyAccJerk.mean.X
	fBodyAccJerk.mean.Y
	fBodyAccJerk.mean.Z
	fBodyAccJerk.meanFreq.X
	fBodyAccJerk.meanFreq.Y
	fBodyAccJerk.meanFreq.Z
	fBodyGyro.mean.X
	fBodyGyro.mean.Y
	fBodyGyro.mean.Z
	fBodyGyro.meanFreq.X
	fBodyGyro.meanFreq.Y
	fBodyGyro.meanFreq.Z
	fBodyAccMag.mean
	fBodyAccMag.meanFreq
	fBodyBodyAccJerkMag.mean
	fBodyBodyAccJerkMag.meanFreq
	fBodyBodyGyroMag.mean
	fBodyBodyGyroMag.meanFreq
	fBodyBodyGyroJerkMag.mean
	fBodyBodyGyroJerkMag.meanFreq
	tBodyAcc.std.X
	tBodyAcc.std.Y
	tBodyAcc.std.Z
	tGravityAcc.std.X
	tGravityAcc.std.Y
	tGravityAcc.std.Z
	tBodyAccJerk.std.X
	tBodyAccJerk.std.Y
	tBodyAccJerk.std.Z
	tBodyGyro.std.X
	tBodyGyro.std.Y
	tBodyGyro.std.Z
	tBodyGyroJerk.std.X
	tBodyGyroJerk.std.Y
	tBodyGyroJerk.std.Z
	tBodyAccMag.std
	tGravityAccMag.std
	tBodyAccJerkMag.std
	tBodyGyroMag.std
	tBodyGyroJerkMag.std
	fBodyAcc.std.X
	fBodyAcc.std.Y
	fBodyAcc.std.Z
	fBodyAccJerk.std.X
	fBodyAccJerk.std.Y
	fBodyAccJerk.std.Z
	fBodyGyro.std.X
	fBodyGyro.std.Y
	fBodyGyro.std.Z
	fBodyAccMag.std
	fBodyBodyAccJerkMag.std
	fBodyBodyGyroMag.std
	fBodyBodyGyroJerkMag.std

Following capyures 'angle' between the vectors:
	angle.tBodyAccMean.gravity.
	angle.tBodyAccJerkMeangravityMean.
	angle.tBodyGyroMean.gravityMean.
	angle.tBodyGyroJerkMean.gravityMean.
	angle.X.gravityMean.
	angle.Y.gravityMean.
	angle.Z.gravityMean.

####License and Acknowledgement:
The use of the original dataset is licensed and acknowledged from original work as below:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.