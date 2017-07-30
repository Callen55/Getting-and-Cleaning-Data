## Getting and Cleaning Data Week 4 Peer Graded Assignment.
##
##  Work done by Chris Allen
##-----------------------------------------------------------------
## Script requirements:
##    1. Downloads the required data.
##    2. Merges the training and the test sets to create one data set.
##    3. Extracts only the measurements on the mean and standard deviation for each measurement.
##    4. Uses descriptive activity names to name the activities in the data set
##    5. Appropriately labels the data set with descriptive variable names.
##    6. From the data set in step 4, creates a second, independent tidy data set with the average 
##       of each variable for each activity and each subject.
##
## Get the required dataset:
library(dplyr)

      if(!file.exists("./data")){dir.create("./data")}
            fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
            download.file(fileUrl,destfile="./data/Dataset.zip")

      ## The file comes in a zipped format, so we want to unzip it to access the data

      unzip(zipfile="./data/Dataset.zip",exdir="./data")

## Read tables and relavent data into R
      ##
      ## Training data:
      x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
      y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
      subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
      ##
      ##Test data:
      x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
      y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
      subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
      ##
      ##Features list:
      features <- read.table('./data/UCI HAR Dataset/features.txt')
      ##
      ##Activity Labes
      activityLabels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

##Assigning column names:
      colnames(x_train) <- features[,2] 
      colnames(y_train) <-"activityId"
      colnames(subject_train) <- "subjectId"
      
      colnames(x_test) <- features[,2] 
      colnames(y_test) <- "activityId"
      colnames(subject_test) <- "subjectId"
      
      colnames(activityLabels) <- c('activityId','activityType')

##Merge the data into one set:
      mrg_train <- cbind(y_train, subject_train, x_train)
      mrg_test <- cbind(y_test, subject_test, x_test)
      mrg_set <- rbind(mrg_train, mrg_test)
      
##Select the data we need:
      mean_std_set<-mrg_set[,1:8]

##That mostly completes our first dataset

##Now we create a second dataset with the average of each variable for each activity and each subject.
      Second_set<-aggregate(. ~subjectId + activityId, mean_std_set, mean)
      
##Add activity lables to both datasets:
      mean_std_set<-merge(mean_std_set, activityLabels,
                          by='activityId')      
      Second_set<-merge(Second_set,activityLabels,
                      by='activityId')

##Then write it as a .txt file
      write.table(Second_set, "Second_set.txt", row.name=FALSE)