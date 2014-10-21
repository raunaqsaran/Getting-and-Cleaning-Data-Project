###Code Book

This file lists the files used in the project and the transformations performed on those files.

##Data Source: 
The data can be dowmloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Contents of the data set:
The data set contains multiple files. However, the key files used in this project were:

*'train/X_train.txt': Training set

*'train/y_train.txt': Activity labels for training set

*'test/X_test.txt': Test set

*'test/y_test.txt': Activity labels for test set

*'features_info.txt': Shows information about the variables used on the feature vector.

*'features.txt': List of all features (i.e the variables being tracked and measured)

*'activity_labels.txt': Specifies the activities performed by the subjects that gave rise to the data set contained in the X_train.txt and X_test.txt

*'train/subject_train.txt & test/subject_test.txt ': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

(Thus the collection of subject_train.txt, y_train.txt and X_train.txt specifies the subject, the activity the subject was performing and the results of the variables being measured. The same applies to test dataset files).

##Data collection exercise:
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##Naming of variables:
The features measured were renamed in the tidy_data.txt file to improve readability of the variable names. The naming convention used was CamelCase to enhance readability and to foster quick grasp of the variabls's purpose.


