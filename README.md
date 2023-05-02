This repository contains the R script run_analysis.R which processes the raw data from the Human Activity Recognition Using Smartphones Dataset and produces a tidy dataset containing the mean and standard deviation of the measurements for each subject and each activity.

Running the script
To run the script, follow these steps:

Download the raw data from this link.
Unzip the file and place the resulting UCI HAR Dataset directory in the same directory as run_analysis.R.
Open R and set the working directory to the location of run_analysis.R.
Run the command source("run_analysis.R").
The script will read the raw data from the UCI HAR Dataset directory, process it as described in the following sections, and output the resulting tidy dataset to a file named tidy_data.txt in the same directory.

Script functionality
The script run_analysis.R performs the following steps:

Reads in the feature names and activity labels from the files features.txt and activity_labels.txt, respectively.
Reads in the measurement data from the files X_train.txt and X_test.txt, the activity labels from the files y_train.txt and y_test.txt, and the subject IDs from the files subject_train.txt and subject_test.txt.
Merges the training and test data into a single data frame.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set.
Appropriately labels the data set with descriptive variable names.
From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Writes the final tidy dataset to a file named tidy_data.txt.
Codebook
The variables in the resulting tidy dataset are described in CodeBook.md, which is also included in this repository. The variables include:

subject: The ID of the subject performing the activity.
activity: The name of the activity being performed.
mean_*: The mean of the measurement for each activity and each subject, where * is the original name of the measurement. For example, mean_tBodyAcc-mean()-X is the mean of the time domain signal of body acceleration in the X direction.
CodeBook.md
Data source
The dataset used in this analysis was obtained from the following source:

Human Activity Recognition Using Smartphones Dataset Version 1.0
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Variables
The tidy dataset produced by the run_analysis.R script contains the following variables:

subject: The ID of the subject performing the activity. Range: 1-30.
activity: The name of the activity being performed. Possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
mean_*: The mean of the measurement for each activity and each subject, where * is the original name of the measurement. For example, mean_tBodyAcc-mean()-X is the mean of the time domain signal of body acceleration in the X direction.
The mean_* variables are the mean of the following original measurements:

tBodyAcc-mean()-X
tBodyAcc-mean()-Y
