## Getting_and_Cleaning_Data Assignment

Introduction

The purpose of this project is to demonstrate your ability to collect, work with, and 
clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

A tidy data called "data_avg_by_subject.txt" set is created by the R script 
called "run_analysis.R"

Description of "run_analysis.R"

The data necessary for the calculations is load and assign to variables in R, using
read.table. 

#1. Merges the training and the test sets to create one data set.

Before merges the data, the names of the columns are assign with the names for the test files 
and the training files, in order to make the files easier to understand. The file features
is used for getting the appropriate descriptive names. 

The Data Merges is archived in 3 steps:
1- Merge the X_test variable with the Subject Activity test in a variable called 
"matrix_test" using cbind
2- Merge the X_train variable with the Subject Activity train in a variable called 
"matrix_train" using cbind
3- Merge all the observations form the test and the train in a variable called matrix. 
using rbind

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

Only the columns that contains the mean(): Mean value and std(): Standar deviation value 
are extracted from the Data File. In this way, 66 variables are included. 

Other variables, like meanFreq() are not considered in the analysis because they are not 
directly what is asked in the question "only the measurements on the mean and standard 
deviation for each measurement"

The columns that were extracted are assigned to a new variable called matrix_extract, 
including the subjects and Activity corresponding columns. 

#3. Uses descriptive activity names to name the activities in the data set

The information that describe the activities was obtain fron the file 
"activity_labels.txt".

The numbers of the activities in the data set was changed to descriptive labels using %in%,
to identify each number of the activity in the data. 

#4. Appropriately labels the data set with descriptive names.

This task was done at the beginning in order to have better understanding of the data from 
the beginning. see #1

#5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject 

The average information required was obtain using group_by and ddply. The final tidy data 
set was saved in a variable called "finaldata".  And then passed to a txt file with 
write.table as required named "data_avg_by_subject.txt".
