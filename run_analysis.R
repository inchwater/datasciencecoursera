##Read the training data set
setwd("Set to the appropriate working directory")
train <- read.table("X_train.txt")

##Read the test data set
setwd("Set to the appropriate working directory")
test <- read.table("X_test.txt")

## Load the "dplyr" package
library(dplyr)

## Merge the test and training data sets into a single data set
tt <- rbind(test,train)

##Set working directory accodingly and read the features text file
setwd("Set to the appropriate working directory")
features <- read.table("features.txt")

##Convert all rows that came in as factors to character type
features_char <- mutate_all(features, as.character)

##Rename columns names for the combined data set
for (i in 1:ncol(tt)){
        colnames(tt)[i] <- features_char[i,2]
}

##Extract only the variables that contain the standard deviations of the measurements
tt_mod_1 <- tt[,grepl("std", colnames(tt))]

##Extract only the variables that contain the mean of the measurements
tt_mod_2 <- tt[,grepl("mean", colnames(tt))]

## Bind the two data frames to get a single one that only contains the mean and standard deviations
tt_mod <- cbind(tt_mod_1, tt_mod_2)

##Read the subject IDs for the training data set
setwd("Set to the appropriate working directory")
subject_train <- read.table("subject_train.txt")

##Read the activity IDs for the training data set
actid_train <- read.table("y_train.txt")

##Read the subject IDs for the test data set
setwd("Set to the appropriate working directory")
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
tt_mod$subject_id <- subject$V1
tt_mod$activity <- actid_label

##Group the final combined data set based on the subject ID and the activity label
tt_grouped <- group_by(tt_mod, subject_id, activity)

##Compute the average of each variable for each activity and each subject
tt_summary <- summarize_all(tt_grouped, funs(mean))

 


