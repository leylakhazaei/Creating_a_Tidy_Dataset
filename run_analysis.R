# Load required packages
library(dplyr)

# Set the working directory and download the dataset
setwd("/Users/leyla/Home/R/Creating_a_Tidy_Dataset/Creating_a_Tidy_Dataset")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "dataset.zip", method = "curl")
unzip("dataset.zip")

# Read in the relevant files
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Merge the training and test datasets
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
colnames(X) <- features[, 2]

# Extract only the columns related to mean and standard deviation measurements
X <- select(X, contains("mean()"), contains("std()"))

# Add descriptive activity names to the dataset
y[, 1] <- activity_labels[y[, 1], 2]

# Label the columns of the dataset with descriptive variable names
names(subject) <- "subject"
names(y) <- "activity"
tidy_data <- cbind(subject, y, X)
names(tidy_data)[4:ncol(tidy_data)] <- paste("mean_", names(tidy_data)[4:ncol(tidy_data)], sep = "")
tidy_data <- group_by(tidy_data, subject, activity) %>% summarize_all(mean)

# Write the final tidy dataset to a text file

write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)
