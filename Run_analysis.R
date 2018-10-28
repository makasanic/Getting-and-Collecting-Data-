# This is Run_analysis.R files
if(!file.exists("./data")){dir.create("./data")}
fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./data/Dataset.zip")
# define the path where the new new folder hs been unziped
pathdata <- file.path("./data","UCI HAR Dataset")
# Create a file which has the 28 file names
files <-list.files(pathdata,recursive = TRUE)
#Show the files
files
dataActivityTest <- read.table(file.path(pathdata),"test",header = FALSE
download.file(fileUrl,destfile = "./data/Dataset.zip")
 # Read the Activity files                               
dataActivityTest <- read.table(file.path(pathdata,"test", "Y_test.txt"),header = FALSE)
dataActivityTrain <- read.table(file.path(pathdata,"train","Y_train.txt"),header = FALSE)
 # Read  the Subject files                              
dataSubjectTrain <- read.table(file.path(pathdata,"train","subject_train.txt"),header = FALSE)                               
dataSubjectTest <- read.table(file.path(pathdata,"test","subject_test.txt"),header = FALSE)
 # Read Features files                              
dataFeaturesTest <- read.table(file.path(pathdata,"test","X_test.txt"),header = FALSE)
dataFeaturesTrain <- read.table(file.path(pathdata,"train","X_tain.txt"),header = FALSE)
dataFeaturesTrain <- read.table(file.path(pathdata,"train","X_train.txt"),header = FALSE)
# Look at the properties of the variables above                               
str(dataActivityTest)
str(dataActivityTrain)
str(subjectTrain)
str(dataSubjectTrain)
str(dataFeaturesTest)
dataSubject <- rbind(dataSubjectTrain,dataSubjectTest)
dataActivity <- rbind(dataActivityTrain,dataActivityTest)
dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)
names(dataSubject) < c("subject")
names(dataSubject) <- c("subject")
names(dataActivity) <- c("activity")
dataFeaturesNames <- read.table(file.path(pathdata,"features.txt"),head = FALSE)
names(dataFeatures) <- dataFeaturesNames$V2
datacombine <- cbind(dataSubject,dataActivity)
Data <- cbind(dataFeatures,datacombine)
subdataFeaturesNames <- dataFeatures
 # Subset Name of Feature  by measurements on the mean and standard deviation                              
suddataFeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)",dataFeaturesNames$V2)]
Data <- subset(Data,select = selectedNames)
Data <- subset(Data,select=selectedNames)
Data <- subset(Data,select=selectNames)
selectedNames <- C(as.character(subdataFeaturesNames),"subject","activity")
selectedNames <- c(as.character(subdataFeaturesNames),"subject","activity")
Data <-subset(Data,select = selectedNames)
Data <- subset(Data,select=selectedNames)
str(Data)
 # Read descriptive activity names from "activity_ labes .txt"                              
activityLabels <- read.table(file.path(pathdata,"activity_labels.txt"),header = FALSE)
head(Data$activity,30)
names(Data) <- gsub("^t","time",names(Data))
names(Data) <- gsub("^f","frequency", names(Data))
names(Data) <- gsub("Acc","Accelerometer",names(Data))
names(Data) <- gsub("Gyro","Gyroscope",names(Data))
names(Data) <-gsub("Mag","Magnitude",names(Data))
names(Data) <-gsub("BodyBody","Body",names(Data))
# check                               
names(Data)
library(plyr);
Data2
Data2 <- aggregate(. ~subject + activity, Data,mean)
Data2 <- Data2[order(Data2$subject,Data2$activity),]
# The last step is to write the output to a text file                               
write.table(Data2, file = "tidydata.txt",row.name =FALSE)
