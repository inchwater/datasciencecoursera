##Read the training data set
setwd("C:/Users/Siddharth/Documents/Careers/Siddharth/DataScienceSpecialization/Getting and Cleaning Data/Course Project/UCI HAR Dataset/train")
train <- read.table("X_train.txt")

##Read the test data set
setwd("C:/Users/Siddharth/Documents/Careers/Siddharth/DataScienceSpecialization/Getting and Cleaning Data/Course Project/UCI HAR Dataset/test")
test <- read.table("X_test.txt")

## Load the "dplyr" package
library(dplyr)

## Merge the test and training data sets into a single data set
tt <- rbind(test,train)

##Calculate the mean for each observation across all variables
mean_tt <- colMeans(tt)

##Load the "matrixStats" package and calculate the standard deviation for each observation across all variables
library(matrixStats)
sd_tt <- colSds(as.matrix(tt))

##Set working directory accodingly and read the features text file
setwd("C:/Users/Siddharth/Documents/Careers/Siddharth/DataScienceSpecialization/Getting and Cleaning Data/Course Project/UCI HAR Dataset")
features <- read.table("features.txt")

##Convert all rows that came in as factors to character type
features_char <- mutate_all(features, as.character)

##Rename columns names for the combined data set
for (i in 1:ncol(tt)){
        colnames(tt)[i] <- features_char[i,2]
}

##Read the subject IDs for the training data set
setwd("C:/Users/Siddharth/Documents/Careers/Siddharth/DataScienceSpecialization/Getting and Cleaning Data/Course Project/UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt")

##Read the activity IDs for the training data set
actid_train <- read.table("y_train.txt")


##Read the subject IDs for the test data set
setwd("C:/Users/Siddharth/Documents/Careers/Siddharth/DataScienceSpecialization/Getting and Cleaning Data/Course Project/UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt")

##Read the activity IDs for the test data set
actid_test <- read.table("y_test.txt")

##Create a new character vector that uses activity labels for all the activity IDs in the test data
actid_test_label <-  recode(actid_test$V1, '1' = "Walking", '2' = "Walking Upstairs", '3' = "Walking Downstairs", '4' = "Sitting", '5' = "Standing", '6' = "Laying")

##Create a new character vector that uses activity labels for all the activity IDs in the train data
actid_train_label <-  recode(actid_train$V1, '1' = "Walking", '2' = "Walking Upstairs", '3' = "Walking Downstairs", '4' = "Sitting", '5' = "Standing", '6' = "Laying")

##Combine the test and train labels into one data set
actid_label <- c(actid_test_label, actid_train_label)

## Combine the subject IDs for test and train into a single data set
subject <- rbind(subject_test, subject_train)

## Add the subject ID and activity labels data set to the data set developed in step 4, i.e. the combined test and train data set with appropriate variables
tt$subject_id <- subject$V1
tt$activity <- actid_label

##Group the final combined data set based on the subject ID and the activity label
tt_grouped <- group_by(tt, subject_id, activity)

##Compute the average of each variable for each activity and each subject
tt_summary <- summarize_all(tt_grouped, funs(mean))

## Note: The data in the features.txt file for the variables that contain "bandsEnergy" had to be edited for the group_by and summarize functions to work. 


