# Course_3_Project

Workflow Course Project Getting And Cleaning Data

The 'run_analysis.R' script does the following action sequence:

1. Downloading raw data.
2. Reading accompanied documents (e.g., ReadMe, activity and features dicts) to
      better understand the data.
3. Loading data sets, understanding and matching dimensions.
4. Merging and cleaning data sets.
      4.1. x_set <- x_train and x_test bind by row.
      4.2. Labeling columns in x_train & x_test with the features list.
      4.3. Removing measurements (columns) that are not the mean or the standard 
            deviation.
      4.4. y_set <- y_train and y_test bind by row
      4.5. Renaming the column in y_set as "Activity"
      4.6. Replacing numeric activity code in y_set with corresponding 
            label values in character.
      4.7. subject_set <- subject_train and subject_test bind by row
      4.8. Renaming the column in subject_Set as "SubjectID"
      4.9. merged_set <- subjects, y_set and x_set bind by column
5. Creating the second data set tidyData from merged_set by extracting the 
      average of each measurement per subject per activity.


The tidy data set is uploaded along with a code book.
