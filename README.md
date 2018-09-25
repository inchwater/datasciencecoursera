Title: Human Activity Recognition Using Smartphones Dataset Script Description

Summary: This document is intended to decribe the various activities that are performed
	 as a part of the run_anaysis.R script


Description:
1. The script starts by reading the test and training data sets in the "test" and "train"
   data frames respectively (these data sets do not include the subject identifiers and the
   activity labels corresponding to them). 

2. The script then performs a row bind operation to append the (2) data sets into one
   called "tt". This is the first step in the exercise.

3. The next action taken by the script involves extracting the mean for all the 
   observations. This information is stored in the "mean_tt" vector.This is one part of 
   the second step in the exercise.

4. Next the script calculates the standard deviation for each observation across all the
   variables. This is stored in the "sd_tt" vector. This is the second part of the 
   second step.

5. The script now loads the "features.txt" file that contains the description for all the
   variables.

6. These labels from the "features.txt" file are now used as column names for the "tt"
   data frame using the mutate verb from the dplyr package. This is the fourth step in
   the exercise.

7. The script uses the recode function to use descriptive labels for the activities. This is
   the third step in the exercise.

8. Finally the script appends (2) additional columns to the "tt" data frame - one represents
   the activity labels (which now contain a descriptive name) and the other represents the
   subject identifiers.

9. The script then groups all the observations in the "tt" data set based on the subject ID
   and the activity label. (Note: the "features.txt" file read earlier had to be cleaned for
   the group_by function to work - it gives out a "columns must have unique names" error
   otherwise, even though column names are unique!)

10. The script then finally calculates the average for all variables for each subject and
    each activity. This is represented by the "tt_summary" data frame. This is the fifth
    and final step in the exercise.

