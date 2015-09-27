# getAndCleanDataProject
project from coursera getting and cleaning data course

## Introduction

This assignment project uses data from

<a https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

It is about creating one R script called run_analysis.R that does the following: 
1-Merges the training and the test sets to create one data set.
2-Extracts only the measurements on the mean and standard deviation for each measurement. 
3-Uses descriptive activity names to name the activities in the data set
4-Appropriately labels the data set with descriptive variable names. 
5-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## merging the training and the test data.

to create one data set, one can proceed as following:

1-read x_train.txt and build a table (xtr) with as many columns as the number of rows in features.txt.

2-read y_train.txt and activity_labels.txt and extract in (ytr) all the labels that correspond to the codes that are in y_train.txt. 

3-read subject_train.txt into a one-column table (str)

4- xtr, ytr and str have all the same number of rows. We merge their columns in one table (xtr) that will have the same number of rows.

5- we repeat the process 1-4 with the test data to build a table (xts) that will have the same columns as the xtr table

6- we merge the rows of xtr and xts to obtain a table (xrs) that have the same columns as 
xtr and xts

7- finally we subset the xrs table to keep only the columns related to mean and standard deviation measurement + the activity lable and the subject

##tidying data set with the average of each variable for each activity and each subject.
1- first we ensure that there are no dublicated columns in the xtr table
2- we agregate the table according to activity lables and subjects
3- we compute the mean of all remaining columns for each row.

## inertial data
since the columns set in inertial data is different than the columns set in x_train.txt, x_test.txt, one can process this set of data separtely using the same steps as described before. 