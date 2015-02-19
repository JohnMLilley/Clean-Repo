# Coursera Getting and cleaning data
# Script for the Program Assignment

# This script needs to be run from the 'UCI HAR Dataset' folder.
# Set your working directory to the 'UCI HAR Dataset' folder.
# The UCI HAR folder will have been created when the source .zip file was unzipped
# The .zip file:  
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Import the six main source data files into R
# The data in these files is separated by spaces. Using sep = "" handles this.

X_train <- read.table("train/X_train.txt" ,sep = "")

y_train <- read.table("train/y_train.txt" ,sep = "")

X_test <- read.table("test/X_test.txt" ,sep = "")

y_test <- read.table("test/y_test.txt" ,sep = "")

subject_test <- read.table("test/subject_test.txt" ,sep = "")

subject_train <- read.table("train/subject_train.txt" ,sep = "")

# Combine the training data files as sets of columns 
train_bind <- cbind(X_train,subject_train,y_train)

# Combine the test data files as sets of columns
test_bind <- cbind(X_test,subject_test,y_test)

# Combine the training and test data rows as sets of rows
total_data <- rbind(train_bind,test_bind)

# Load in the column titles
features <- read.table("features.txt")

# Convert column titles from Factors to characters
features2 <- as.character(features[,2])

# Add two more column titles for Subject and Activity
features2[562] <- "subject"
features2[563] <- "activity"

# Clean up the column names to fit the R standard
# Convert column names to lower case
features2 <- tolower(features2)
# Remove all the punctuation characters
features2 <- gsub("[[:punct:]]","",features2)

# Set the column names on the main data set
colnames(total_data) <- features2

# Take a subset of just the mean, std, subject and activity columns
mean_std_data <- total_data[,grepl('std',names(total_data)) | grepl('mean',names(total_data)) | grepl('subject',names(total_data)) | grepl('activity',names(total_data))] 

# Install the dplyr package so we can use the mutate() function 
install.packages("dplyr")
library(dplyr)

# Convert activity column into factors
mean_std_data <- mutate(mean_std_data,activity = factor(activity))

                      
# Change activity column values to be the desciptive activity names
levels(mean_std_data$activity) <- c("Walking","walking upstairs","walking downstairs","sitting","standing","lying")

# Aggregate the data by subject and activity, and recalculate all (see the '.' which indicates this) columns as means
final_data <- aggregate(. ~ subject + activity, data=mean_std_data, FUN=mean)

# Write out data to text file
write.table(final_data,file="final_data.txt",row.names=FALSE)

# You can read the final_data.txt file from the 'UCI HAR Dataset' folder using a text editor like Textpad 
# or read it back into R using read.table() and the look at it using View().


