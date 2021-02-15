## This R script is created for the Getting and Cleaning Data course project.
## The script below will read and merge the data sets on Human Activity 
## Recognition into one data set, and prepare it to be used for later analysis.


## Load downloaded data sets
activities <- read.csv("activity_labels.txt", sep = "", header = F)
features <- read.csv("features.txt", sep = "", header = F)
x_train <- read.csv("x_train.txt", sep = "", header = F)
x_test <- read.csv("x_test.txt", sep = "", header = F)
y_train <- read.csv("y_train.txt", sep = "", header = F)
y_test <- read.csv("y_test.txt", sep = "", header = F)
subject_train <- read.csv("subject_train.txt", sep = "", header = F)
subject_test <- read.csv("subject_test.txt", sep = "", header = F)


## Merge x_set 
x_set <- rbind(x_train, x_test)
## Label x_set columns with features
colnames(x_set) <- features
## Select only the columns with mean and standard deviation measurements
x_set %>% select(contains("mean"), contains("std"))


## Merge y_set
y_set <- rbind(y_train, y_test)
## Rename activity column name
colnames(y_set) <- "Activity"
## Replace numeric values with activity label values
y_set <- within(y_set {
      y_set[y_set == 1] <- "walking"
      y_set[y_set == 2] <- "walking_upstairs"
      y_set[y_set == 3] <- "walking_downstairs"
      y_set[y_set == 4] <- "sitting"
      y_set[y_set == 5] <- "standing"
      y_set[y_set == 6] <- "laying"
})


## Merge subject_set
subject_set <- rbind(subject_train, subject_test)
## Rename subject column name
colnames(subject_set) <- "SubjectID"


## Merge all data sets together
merged_set <- cbind(subject_set, y_set, x_set)


## Correct variable labels to be more descriptive
correctLabels <- function(labels) {
      labels <- gsub(x = labels, pattern = "_+", replacement = "_")
      labels <- gsub(x = labels, pattern = "_$", replacement = "")
      labels <- gsub(x = labels, pattern = "^t", replacement = "Time")
      labels <- gsub(x = labels, pattern = "^f", replacement = "Frequency")
      labels <- gsub(x = labels, pattern = "Mag", replacement = "Magnitude")
      labels <- gsub(x = labels, pattern = "BodyBody", replacement = "Body")
      labels <- gsub(x = labels, pattern = "X$", replacement = "X-axis")
      labels <- gsub(x = labels, pattern = "Y$", replacement = "Y-axis")
      labels <- gsub(x = labels, pattern = "Z$", replacement = "Z-axis")
}


## Create separate tidy data set using the mean per subject per activity.
tidyData <- df_merged %>% group_by(SubjectID, Activity) %>% summarise_each(mean)