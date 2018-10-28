# This is Run_analysis.R files
if(!file.exists("./data")){dir.create("./data")}
fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./data/Dataset.zip")
pathdata <- file.path("./data","UCI HAR Dataset")
files <-list.files(pathdata,recursive = TRUE)
files
dataActivityTest <- read.table(file.path(pathdata),"test",header = FALSE
download.file(fileUrl,destfile = "./data/Dataset.zip")
dataActivityTest <- read.table(file.path(pathdata,"test", "Y_test.txt"),header = FALSE)
dataActivityTrain <- read.table(file.path(pathdata,"train","Y_train.txt"),header = FALSE)
dataSubjectTrain <- read.table(file.path(pathdata,"train","subject_train.txt"),header = FALSE)
dataSubjectTest <- read.table(file.path(pathdata,"test","subject_test.txt"),header = FALSE)
dataFeaturesTest <- read.table(file.path(pathdata,"test","X_test.txt"),header = FALSE)
dataFeaturesTrain <- read.table(file.path(pathdata,"train","X_tain.txt"),header = FALSE)
dataFeaturesTrain <- read.table(file.path(pathdata,"train","X_train.txt"),header = FALSE)
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
suddataFeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)",dataFeaturesNames$V2)]
Data <- subset(Data,select = selectedNames)
Data <- subset(Data,select=selectedNames)
Data <- subset(Data,select=selectNames)
selectedNames <- C(as.character(subdataFeaturesNames),"subject","activity")
selectedNames <- c(as.character(subdataFeaturesNames),"subject","activity")
Data <-subset(Data,select = selectedNames)
Data <- subset(Data,select=selectedNames)
str(Data)
activityLabels <- read.table(file.path(pathdata,"activity_labels.txt"),header = FALSE)
head(Data$activity,30)
names(Data) <- gsub("^t","time",names(Data))
names(Data) <- gsub("^f","frequency", names(Data))
names(Data) <- gsub("Acc","Accelerometer",names(Data))
names(Data) <- gsub("Gyro","Gyroscope",names(Data))
names(Data) <-gsub("Mag","Magnitude",names(Data))
names(Data) <-gsub("BodyBody","Body",names(Data))
names(Data)
library(plyr);
Data2
Data2 <- aggregate(. ~subject + activity, Data,mean)
Data2 <- Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name =FALSE)
