#Read files in the 'train' subfolder
train_basic <- read.csv("UCI HAR Dataset/train/X_train.txt", header=F, sep="")
train_y <- read.csv("UCI HAR Dataset/train/y_train.txt", header=F)
train_subject <- read.csv("UCI HAR Dataset/train/subject_train.txt", header=F)

#Incorporate subject info (from subject_train.txt) and activity info (from y_train.txt) in the data file. The 2 fields are now the first 2 cols in the dataset
train_combined <- cbind(train_subject, train_y,train_basic)


#Read files in the 'test' subfolder
test_basic <- read.csv("UCI HAR Dataset/test/X_test.txt", header=F, sep="")
test_y <- read.csv("UCI HAR Dataset/test/y_test.txt", header=F)
test_subject <- read.csv("UCI HAR Dataset/test/subject_test.txt", header=F)

#Incorporate subject info (from subject_test.txt) and activity info (from y_test.txt) in the data file. The 2 fields are now the first 2 cols in the dataset
test_combined <- cbind(test_subject, test_y,test_basic)


#Read the Activity_Labels file
activity_labels = read.csv("UCI HAR Dataset/activity_labels.txt", header=F, sep="")

#Replacing Activity Numbers with descriptions about Activity by indexing from Activity_Labels
##This accomplishes objective 3 of the assignment
train_combined[,2] <- activity_labels[train_combined[,2], 2]
test_combined[,2] <- activity_labels[test_combined[,2], 2]

#Merging the train and test data sets. 
##This accomplishes objective 1 of the assignment
combined_data <- rbind(train_combined, test_combined)

#Read the features.txt file
features <- read.csv("UCI HAR Dataset/features.txt", header=F, sep="")

#This creates a logical vector highlighting only those rows from features.txt which contain the keywords 'mean' or 'std'.
required_cols_initial <- grepl("mean|std", features[,2])

#Applying this logical vector on features gives us the list of required cols having keywords 'mean' or 'std'
features_selected <- features[required_cols_initial,]

#Modifying the feature names (i.e the col names) to make them more understandable and readable
features_selected[,2] <- gsub("[()-]", "", features_selected[,2])
features_selected[,2] <- gsub("mean", "Mean", features_selected[,2])
features_selected[,2] <- gsub("std", "StdDev", features_selected[,2])
features_selected[,2] <- gsub("^(t)", "Time", features_selected[,2])
features_selected[,2] <- gsub("^(f)", "Freq", features_selected[,2])

#Preparing final logical vector to be applied to the combined data set to cull out the required cols
#The first 2 'TRUE' are for the Subject and Activity cols that were inserted before
required_cols_final <- c(TRUE, TRUE, required_cols_initial)

#This prepares the required dataset with the required cols
##This accomplishes objective 2 of the assignment
combined_data <- combined_data[,required_cols_final]


#Applying col names to the dataset
#This accomplishes objective 4 of the assignment
colnames(combined_data) <- c("Subject", "Activity", as.character(features_selected[,2]))



#Converting Subject and Activity cols to factors to be used for the aggregate function
combined_data$Subject <- as.factor(combined_data$Subject)
combined_data$Activity <- as.factor(combined_data$Activity)

#Preparing tidy data. Excluding Subject and Activity from aggregate calculations
tidy_data <- aggregate(combined_data[,names(combined_data) != c("Subject", "Activity")], by=list(Activity = combined_data$Activity, Subject=combined_data$Subject), mean)

#The prev function orders by Subject first and Activity second, but puts Subject in col no 2. The next statement puts Subject back to col 1.
tidy_data <- tidy_data[,c(2,1,3:ncol(tidy_data))]

  
#Writing tidy data to a file
## This accomplishes objective 5 of the assignment
write.table(tidy_data, file = "./tidy_data.txt", row.name=F)




