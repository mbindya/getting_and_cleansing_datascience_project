setwd("C:\\Bindya\\DataScience\\Week3")

## Download and unzip the d


 if (!file.exists("getdata-projectfiles-UCI HAR Dataset3.zip")){
       fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ";
         download.file(fileURL, "getdata-projectfiles-UCI HAR Dataset3.zip", mode='wb', cacheOK=FALSE);
    }

if (file.exists("getdata-projectfiles-UCI HAR Dataset3.zip")) { 
    unzip("getdata-projectfiles-UCI HAR Dataset3.zip") ;
}


features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
featuresreq <- grep(".*mean.*|.*std.*", features[,2])
featuresreq.names <- features[featuresreq, 2]
## Uses descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[,2] <- as.character(activities[,2])



## Read the Test File
    x_test <- read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE)[featuresreq]
     y_test <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)
     subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)
     
     # combine test information
     test <- cbind(subject_test, y_test, x_test)
     
## Read the Test File
     x_train <- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE)[featuresreq]
     y_train <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)
     subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)
     
     # combine train information
     train <- cbind(subject_train, y_train, x_train)
     
     # merge train and test data
     bind_data <- rbind(train, test)
     
     
     colnames(bind_data) <- c("subject","activity", featuresreq.names )
     colNames <- colnames(bind_data)
     for (i in 1:length(colNames))
     {
         colNames[i] <- gsub("\\()", "", colNames[i])
         colNames[i] <- gsub("-std", "StandardDeviation", colNames[i])
         colNames[i] <- gsub("-mean", "Mean", colNames[i])
     }
     
     colnames(bind_data) <- colNames
     
     
     ##creates a second, independent tidy data set with the average of each variable for each activity and each subject.
     bind_data$activity <- factor(bind_data$activity, levels= activities[,1] , labels = activities[,2])
     bind_data$subject <- as.factor(bind_data$subject)
     
     library(reshape2)
     melted_Data <- melt(bind_data, id = c("subject", "activity"))
     mean_data <- dcast(melted_Data, subject + activity ~ variable, mean)
     write.table(mean_data, "tidy_data.txt", row.name=FALSE, quote=FALSE)