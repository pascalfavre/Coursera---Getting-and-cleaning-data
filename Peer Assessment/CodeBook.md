#Peer Assessment - CodeBook

##Data Source
The dataset used for this Peer assessment is the one given by the instructors at the following address: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

It is derived from the "Human Activity Recognition Using Smartphones Data Set" provided by the Machine Learning Repository of the UCI.

For more informations about this dataset, refer to the readme in the data folder.

##Tidy dataset
The tidy dataset was created following the instructor's instructions.

From the base dataset, we only selected the mean and standard deviation variables.

In addition, you'll find a ``` subject_id ``` and an ```activity_label``` variable describing each line.

For each row, the means and stadard deviation for the following information:

* tBodyAcc
* tBodyAccJerk
* tGravityAcc
* tGravityAccJerk
* tBodyGyro
* tBodyGyroJerk
* tBodyAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc
* fBodyAccJerk
* fBodyGyro
* fBodyAccMag
* fBodyBodyAccJerkMag
* fBodyBodyGyroMag
* fBodyBodyGyroJerkMag

For each of those patterns, the values for the x, y and z axis exist.