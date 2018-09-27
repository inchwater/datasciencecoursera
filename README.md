Title: Human Activity Recognition Using Smartphones Dataset Script Description

Summary: This document is intended to decribe the various activities that are performed
	 as a part of the run_anaysis.R script


Description:
1. The script starts by reading the test and training data sets in the "test" and "train"
   data frames respectively (these data sets do not include the subject identifiers and the
   activity labels corresponding to them). 

2. The script then performs a row bind operation to append the (2) data sets into one
   called "tt". This is the first step in the exercise.

3. The script now loads the "features.txt" file that contains the description for all the
   variables.

4. These labels from the "features.txt" file are now used as column names for the "tt"
   data frame using the mutate verb from the dplyr package. This is the fourth step in
   the exercise.

5. The script uses the recode function to use descriptive labels for the activities. This is
   the third step in the exercise.

6. Once the labels have been correctly applied to the "tt" dataa frame, only the columns
   containing the mean and standard deviations of the variables are extracted and stored
   in a data frame called "tt_mod".

6. The script then appends (2) additional columns to the "tt_mod" data frame - one represents
   the activity labels (which now contain a descriptive name) and the other represents the
   subject identifiers.

7. The script then groups all the observations in the "tt_mod" data set based on the subject ID
   and the activity label. 

8. The script then finally calculates the average for all variables for each subject and
    each activity. This is represented by the "tt_summary" data frame. This is the fifth
    and final step in the exercise.

