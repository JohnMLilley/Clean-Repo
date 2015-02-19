Coursera Getting and cleaning data

This file describes the components that go to make up the submission for the course project:

1) A tidy data set as described below, 
2) A link to a Github repository with your script for performing the analysis. 
3) A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4) This README.md in the repo with the scripts. This repo explains how all of the scripts work and how they are connected.   


The tidy dataset is called 'final_data.txt'
You can read the final_data.txt file from the 'UCI HAR Dataset' folder using a text editor like Textpad 
or read it back into R using read.table() and the look at it using View().


The Script for the Program Assignment is called run_analysis.R
 This script needs to be run from the 'UCI HAR Dataset' folder.
 Set your working directory to the 'UCI HAR Dataset' folder.
 The UCI HAR folder will have been created when the source .zip file was unzipped
 The .zip file:  
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The script performs the following:
 1) Merges the training and the test sets to create one data set.
 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
 3) Uses descriptive activity names to name the activities in the data set
 4) Appropriately labels the data set with descriptive variable names. 
 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The codebook list all the columns in the tidy dataset. All the value columns are means of the original data for the Subject and Activity 
on each row.

