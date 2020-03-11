########################################################################
# FILENAME: run_analysis.R
# AUTHOR: Anne Strader
# LAST REVISED: 11. March 2020
#
# OBJECTIVE: 
# This script creates a tidy data set from Samsung Galaxy S smartphone accelerometer data. The raw data are obtained from the "UCI Human Activity Recognition Using Smartphones" dataset. The data are tidied according to the steps outlined in the Coursera "Getting and Cleaning Data" course project (steps 1-5 in the script).
#
# TIDIED DATASET OUTPUT: UCI_HAR_tidy_data.txt
#
#########################################################################

#########################################################################
# load necessary R packages
#########################################################################

library("reshape2")

#########################################################################
# Download and extract source data.
#########################################################################

# define URL where source data are stored
sourceURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# define source data zip file name
sourceDataZipFile <- "UCI HAR DATASET.zip"

# check if dataset has already been downloaded in working directory, and download dataset if not
if (!file.exists(sourceDataZipFile)) {
  download.file(sourceURL, sourceDataZipFile)
}

# define source data directory name
sourceDataPath <- "UCI HAR DATASET"  

# if not already done, unzip source dataset to new data directory
if (!file.exists(sourceDataPath)) {
  unzip(sourceDataZipFile)
}

#########################################################################
# Read in necessary source data.
#########################################################################

# read in activity labels
activityLabels <- read.table(paste0(sourceDataPath, "/activity_labels.txt"))

# assign column names to activity labels table
colnames(activityLabels) <- c("activityID", "activityType")

# read in features
features <- read.table(paste0(sourceDataPath, "/features.txt"), as.is = TRUE)

# read in training data:
# subjects
trainSubjects <- read.table(paste0(sourceDataPath, "/train/subject_train.txt"))
# activities
trainActivities <- read.table(paste0(sourceDataPath, "/train/y_train.txt"))
# feature values
trainValues <- read.table(paste0(sourceDataPath, "/train/X_train.txt"))

# read in test data:
# subjects
testSubjects <- read.table(paste0(sourceDataPath, "/test/subject_test.txt"))
# activities
testActivities <- read.table(paste0(sourceDataPath, "/test/y_test.txt"))
# feature values
testValues <- read.table(paste0(sourceDataPath, "/test/X_test.txt"))

#########################################################################
# STEP 1: Merge the training and test sets to create one data set.
#########################################################################

# combine subject ID, activity ID and feature values:
# training data
trainData <- cbind(trainSubjects, trainActivities, trainValues)
# test data
testData <- cbind(testSubjects, testActivities, testValues)

# concatenate training and test data
UCIHARdata <- rbind(trainData, testData)

# assign column names to complete dataset
colnames(UCIHARdata) <- c("subjectID", "activityID", features[, 2])

# remove tables which will no longer be used in this script
rm(trainSubjects, trainActivities, trainValues, testSubjects,
   testActivities, testValues)

#########################################################################
# STEP 2: Extract only the measurements on the mean and standard 
#         deviation for each measurement.
#########################################################################

# identify columns to extract (column names)
retainedColumns <- grepl("subjectID|activityID|.*mean.*|.*std.*",
                         colnames(UCIHARdata))

# redefine data set as only containing necessary columns
UCIHARdata <- UCIHARdata[, retainedColumns]

#########################################################################
# STEP 3: Use descriptive activity names to name the activities 
#         in the data set.
#########################################################################

# convert activity IDs to factor levels and add labels
UCIHARdata$activityID <- factor(UCIHARdata$activityID, 
                                levels = activityLabels[, 1], 
                                labels = activityLabels[, 2])

#########################################################################
# STEP 4: Appropriately label the data set with descriptive variable
#         names.
#########################################################################

# define column names in dataset
UCIHARdataColNames <- colnames(UCIHARdata)

# fix recurring typo in some feature labels
UCIHARdataColNames <- gsub("BodyBody", "Body", UCIHARdataColNames)

# format mean and standard deviation labels in feature names
UCIHARdataColNames <- gsub("-mean", "Mean", UCIHARdataColNames)  # mean
UCIHARdataColNames <- gsub("-std", "STD", UCIHARdataColNames)  # standard deviation

# distinguish time and frequency domains more clearly
UCIHARdataColNames <- gsub("^f", "frequency", UCIHARdataColNames)  # frequency domain
UCIHARdataColNames <- gsub("^t", "time", UCIHARdataColNames)  # time domain

# expand some abbreviations in feature labels for clarity
UCIHARdataColNames <- gsub("Acc", "Accelerometer", UCIHARdataColNames)  # accelerometer data
UCIHARdataColNames <- gsub("Gyro", "Gyroscope", UCIHARdataColNames)  # gyroscope data
UCIHARdataColNames <- gsub("Mag", "Magnitude", UCIHARdataColNames)  # magnitude

# assign revised feature labels as data table column names
colnames(UCIHARdata) <- UCIHARdataColNames

#########################################################################
# STEP 5: From the data set in step 4, create a second, independent
#         tidy data set with the average of each variable for each 
#         activity and each subject.
#########################################################################

# convert subject IDs to factors
UCIHARdata$subjectID <- as.factor(UCIHARdata$subjectID)

# melt data table, using subject ID and activity ID as identifiers
UCIHARdataMelt <- melt(UCIHARdata, id = c("subjectID", "activityID"))

# calculate the mean of each subject ID/activity ID combination, store in data table
UCIHARdataMean <- dcast(UCIHARdataMelt, subjectID + activityID ~ variable, mean) 

#########################################################################
# Write output file.
#########################################################################

write.table(UCIHARdataMean, "UCIHARdata_tidy.txt", row.names = FALSE, 
            quote = FALSE)







