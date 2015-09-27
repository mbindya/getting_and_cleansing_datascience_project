# Getting and Cleaning Data Project


## Source Data
* Source data for this project is at: [Getting and Cleaning Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## List of files
* Activity_Labels.txt , Features.txt, Training Data: x_train.txt, y_train.txt, subject_train.txt, Test Data: x_test.txt, y_test.txt, subject_test.txt

## List of variables used in the program
* features - To load the data from features.txt
* featuresreq - To get(grep) only mean and Standard Deviation from features 
* activities - To load the data from activity_labels.txt	
* x_train - To load the x_train.txt but only mean and Standard deviation data alone
* subject_train - To load the subject_train
* y_train - To load the y_train.txt
* train - To Combine the xTrain, SubjectTrain and yTrain
* x_test - To load the x_test.txt but only mean and Standard deviation data alone
* subject_test - To load the subject_test
* y_test - To load the y_test.txt
* test - To Combine the xTest, SubjectTest and yTest
* bind_data - The combined train and test data
* colNames - Used to rename the colName to rename it in readable format
* mean_data - The final formated data which is combined using the subject and activity 