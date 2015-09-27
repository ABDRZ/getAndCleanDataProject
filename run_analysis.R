##Merges the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation 
##for each measurement.
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names. 
##From the data set in step 4, creates a second, independent tidy data set
##with the average of each variable for each activity and each subject.


# function to read and  agregate data by activity and by subject and compute the mean of recorded measurements
tidy_xys <- function(){
  
  xrs<- load_xys()
  x_mean <-aggregate(subset(xrs, select = -c(87,88)), by = list(xrs$num_sub,xrs$label_activ), mean)
  write.table(x_mean,file="x_mean.txt", row.names = FALSE)
  
  library(dplyr)
  tbl_df(x_mean)
  
}

# function to load and merge training and test data
load_xys <- function(){
  print("reading x_train.txt")
  xtr <- read.table("./UCI HAR Dataset/train/x_train.txt", col.names=label_features(), header = FALSE,nrows=10000)
  
  print("reading y_train.txt & activity_labels.txt")
  act <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names =c("num_activ","label_activ"), header = FALSE)
  ytr <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="num_activ", header = FALSE,nrows=10000)
  ytr <- act[ytr$num_activ,]
 
  print("reading subject_train.txt")
  str <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="num_sub", header = FALSE,nrows=10000)
  
  xtr <- cbind(xtr,ytr,str)
  
  print("reading x_test.txt")
  xts <- read.table("./UCI HAR Dataset/test/x_test.txt", col.names=label_features(), header = FALSE,nrows=10000)
  print("reading y_test.txt & activity_labels.txt")
 
  yts <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="num_activ", header = FALSE,nrows=10000)
  yts <- act[yts$num_activ,]
  print("reading subject_test.txt")
  sts <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="num_sub", header = FALSE,nrows=10000)
  
  xts <- cbind(xts,yts,sts)
  
  print("merging x_train.txt & x_test.txt")
  
  xrs <- rbind(xtr,xts)
  
  rm(xtr,xts,ytr,yts,str,sts)
  
  print("selecting mean and std variables")
  
  r<-subset(xrs, select = c(scol_features(),563,564))
  library(dplyr)
  tbl_df(r)
}

# function to identify the columns wich contain only the measurements on the mean and standard deviation
scol_features <- function(){
  ftr <- read.table("./UCI HAR Dataset/features.txt",col.names =c("num_ftr","label_ftr"), header = FALSE)
  ftr$label_ftr
  m<-grep("mean", ftr$label_ftr)
  M<-grep("Mean", ftr$label_ftr)
  s<-grep("std", ftr$label_ftr)
  cl<-c(m,M,s)
  scl<-sort(cl)
  ftr[scl,1]
}

# function to obtain feature lables
label_features <- function(){
  ftr <- read.table("./UCI HAR Dataset/features.txt",col.names =c("num_ftr","label_ftr"), header = FALSE)
  ftr$label_ftr
}
