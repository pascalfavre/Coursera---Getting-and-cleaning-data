#Getting and cleaning data - Peer assesment
This is how run_analysis.R works:

1. Install and load all needed libraries
2. Read all the files and use the correct headers
3. Clean all the data by keeping only columns with mean, std, subjectid, and activity
4. Read the activity label file and put the text to lower with a replacement of _ by a space
5. Create a factor of the activity labels in order to put it in the complete dataset
6. Clean all the data headers by replacing special characters with a .
7. Re-order the dataset by moving the subjectid and the activity label at the begining
8. Remove the last column (activity value)
9. Write the result into a new csv file