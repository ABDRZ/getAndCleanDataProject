# script functions

Four functions are coded in the run_analysis script:
* load_xys(): loads and merges the training and test data 

* label_features(): reads and returns feature lables

* scol_features() : selects the columns that contain measurements on the mean or standard deviation

* tidy_xys(): reads and  agregates data by activity and by subject and computes the mean of recorded measurements

# load_xys(): merging the training and the test data.

to create one data set, one can proceed as following:

1-read x_train.txt and build a table (xtr) with as many columns as the number of rows in features.txt.

2-read y_train.txt and activity_labels.txt and extract in (ytr) all the labels that correspond to the codes that are in y_train.txt. 

3-read subject_train.txt into a one-column table (str)

4- xtr, ytr and str have all the same number of rows. We merge their columns in one table (xtr) that will have the same number of rows.

5- we repeat the process 1-4 with the test data to build a table (xts) that will have the same columns as the xtr table

6- we merge the rows of xtr and xts to obtain a table (xrs) that have the same columns as 
xtr and xts

7- finally we subset the xrs table to keep only the columns related to mean and standard deviation measurement + the activity label and the subject

#tidy_xys(): tidying data set with the average of each variable for each activity and each subject.

1- first we ensure that there are no dublicated columns (related to activity code and subject) in the xtr table

2- we agregate the table according to activity lables and subjects

3- we compute the mean of all remaining columns for each row.
