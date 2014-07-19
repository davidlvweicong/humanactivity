Cleaning Data of Human Activity Recogonition Using Smartphones
==============================================================

## Data
The data is collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available [here][http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones].
The data for the project are from [here][https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

## Related Files
* features.txt
* features_info.txt
* activity_labels.txt
* train/X_train.txt
* train/y_train.txt
* train/subject_train.txt
* test/X_test.txt
* test/y_test.txt
* test/subject_test.txt
Read the file README.txt for more descriptions about each file.

## What the Script will do
Combine the data of "train" and "test" using the function rbind.
Extract measurements containing "-mean()" or "-std()" using the function grep.
Make the names of the variables to lower case and delete all the "-".
Split the data according to "activity" and "subject".
Calculate the average of each variable to get a tidy data set.

## Script
Just put the file "run_analysis.R" in the directory along with the original data and run it in R.
The variable "data" only contains the mean and standard deviation for each measurement, but it keeps every subject.
The variable "tidy" is the average of each variable in "data" for each activity and each subject.
The output file is "tidy.txt", which contains the variable "tidy", and can be read with function "read.table".
