# Code Book

The raw data for the project is download from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Information about the experiment
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#  Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket 
of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have 
been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap 
(128 readings/window). The sensor acceleration signal, which has gravitational and body 
motion components, was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 
features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

# Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body 
acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#  Raw Data transformation

The raw data sets are processed with the script run_analysis.R script to create a tidy data set.

_Merge training and test sets_: Test and training data, subjects and activities are merged 
to obtain a single data set. 
Variables are labelled with the names assigned by original collectors.

_Extract mean and standard deviation variables_: Keep only the values of estimated mean and 
standard deviation .

_Get descriptive activity names_: Activity description is added to the data set.

_Get label variables appropriately_: Labels given from the original collectors were 
introduced in the data set for identification. 

_Create a tidy data set_:  It was created a final tidy data set where numeric variables are 
averaged for each activity and each subject.

#  Tidy data set

Variables:

Subject: an identifier of the subject who carried out the experiment range is from 1 to 30.

Activity: label of the activity implemented by the subject. WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Mean of all other variables: the average of each variable for each activity and each subject.

The measurements included in the Tidy data set are the mean and std of:

"tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
"tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
"tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
"tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
"tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
"tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
"tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
"tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
"tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
"tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
"tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
"tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
"tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
"tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
"tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
"tBodyAccMag-mean()"          "tBodyAccMag-std()"          
"tGravityAccMag-mean()"       "tGravityAccMag-std()"       
"tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
"tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
"tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
"fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
"fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
"fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
"fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
"fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
"fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
"fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
"fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
"fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
"fBodyAccMag-mean()"          "fBodyAccMag-std()"          
"fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
"fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
"fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 

To review more details about the measurements - features_info.txt 

The final data set is written to the file 'data_avg_by_subject.txt'.
