#############################################################################
## Author:  Pascal Favre
## Date :   09.08.2014
## Goal :   Performs an anlysis on a given dataset 
#############################################################################

#setwd("~/GitHub/Coursera---Getting-and-cleaning-data/Peer_Assessment")
#setwd("C:/Users/fap/Google Drive/Coursera/JohnsHopkins/3 - Getting and Cleaning Data/Peer_Assessment")

install.packages("reshape")
install.packages("plyr")
library(reshape)
library(plyr)


#########################################################
## 1: MERGING THE TRAINING AND THE TEST SETS TO CREATE
##    ONE DATA SET
#########################################################

#Read the different datasets
myFeatures <- read.table("data/features.txt")

#Training datasets
myTrainingX = read.table("data/train/X_train.txt")
myTrainingY = read.table("data/train/y_train.txt")
mySubjectTrain = read.table("data/train/subject_train.txt")

#Set headers for training datasets
colnames(myTrainingX) = myFeatures$V2
myTrainingY <- rename(myTrainingY, c(V1="activity"))

#Test datasets
myTestX = read.table("data/test/X_test.txt")
myTestY = read.table("data/test/y_test.txt")
mySubjectTest = read.table("data/test/subject_test.txt")

#Set headers for test datasets
colnames(myTestX) = myFeatures$V2
myTestY <- rename(myTestY, c(V1="activity"))

#Add activity labels to dataset
myLabels <-levels(read.table("data/activity_labels.txt")$V2)

#change subject variable name
mySubjectTrain <- rename(mySubjectTrain, c(V1="subjectid"))
mySubjectTest <- rename(mySubjectTest, c(V1="subjectid"))

#Merge the different datasets in order to get only one
myDataSet = rbind(cbind(myTrainingX, mySubjectTrain, myTrainingY), cbind(myTestX, mySubjectTest, myTestY))


#########################################################
## 2: EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND
##    STANDARD DEVIATION FOR EACH MEASUREMENT
#########################################################

#Create pattern for all the wanted values and keep only those columns
myPattern = "mean|std|subjectid|activity"
tidyData = myDataSet[,grep(myPattern , names(myDataSet), value=TRUE)]


#########################################################
## 3: USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE
##    ACTIVITIES IN THE DATA SET
#########################################################

#Read the activity labels file
myActivities <- read.table('data/activity_labels.txt', col.names=c("id", "activity_label"))
myActivities[, 2] <- tolower(gsub("_", " ", myActivities[, 2]))

#Add activity name to tidyData
tidyData$activity_label = factor(tidyData$activity, levels=myActivities$id, labels=myActivities$activity_label)


#########################################################
## 4: APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE
##    VARIABLE NAMES
#########################################################

#Replace special characters with a point
cleanNames = gsub("\\(|\\)|-|,", ".", names(tidyData))
names(tidyData) <- cleanNames


#########################################################
## 5: CREATES A SECOND, INDEPENDENT TIDY DATA SET WITH
##    THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY
##    AND EACH SUBJECT.
#########################################################
#Re-order the data set
tidySummarized = ddply(tidyData, .(subjectid, activity_label), numcolwise(mean))
tidySummarized <- tidySummarized[ , !(names(tidySummarized) %in% c('activity'))]

#Write the result into a csv file
write.csv(tidySummarized, file="tidydata.csv")
