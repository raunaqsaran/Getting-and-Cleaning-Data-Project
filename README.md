Getting-and-Cleaning-Data-Project
=================================

Repo containing project files for John Hopkins Course on Getting and Cleaning Data

###Objective:
The objective of this course and project was to work on raw data and prepare a neat concise file containing processed data based on certain requirements and rules.

###Requirements:
* "run_analysis.R" - script that works on the data to get the required output file (tidy_data.txt). This should be present in the working directory of your environment.
* CodeBook: Code book lists the variables used and tranformations employed on the original data
* UCI HAR dataset: This dataset should be present in a folder called "UCI HAR Dataset". This folder should be present in the working directory of your environment. The dataset can be dowmloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Detailed information about the dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###What the script does:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###How to run the script:
Run the script from the working directory by typing source("run_analysis.R") at the console


 
