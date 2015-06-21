#Merge X, Y, and subject training documents together
library(dplyr)

#Read in the Training Data
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
strain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#Assign a column name to the Y and Subject Training data sets
colnames(ytrain) <- c("activity")
colnames(strain) <- c("subject")

#Add column names from the "features" text file to the X Training Data set
#Clean up column names by making them all lowercase and removing punctuation
cols <- read.table("./UCI HAR Dataset/features.txt")
colsf <- cols$V2
colsf <- tolower(colsf)
colsf <- gsub("[[:punct:]]","",colsf)
colnames(xtrain) <- colsf


#Combine all three training data sets into one data frame in a two step process
m1train<- data.frame(ytrain,strain)
m2train <- data.frame(m1train, xtrain)


#Read in the Test Data
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
stest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Assign a column name to the Y and Subject Test data sets
colnames(ytest) <- c("activity")
colnames(stest) <- c("subject")

#Add column names from the "features" text file to the X Test data set
colnames(xtest) <- colsf


#Combine all three test data sets into one data frame in a two step process
m1test<- data.frame(ytest,stest)
m2test <- data.frame(m1test, xtest)

#Combine all Training and Test data sets into one data frame
combinedata <- rbind(m2train, m2test)

#Find all variable names with "mean" and "std" in them.
g1 <- grep("mean", names(combinedata), ignore.case = TRUE)
g2 <- grep("std", names(combinedata), ignore.case = TRUE)

#Create a vector with the column numbers of all the "mean" and "std" variabes 
#as well as activity and subject
gplus <- c(1:2, g1, g2)

#Subset the combined data set  by the activity, subject, mean and std variables
finaldata <- data.frame(combinedata[ ,gplus]) 

#Convert the activity's into factors and then convert the numeric values 
#into descriptive values
finaldata$activity <- factor(finaldata$activity)
levels(finaldata$activity) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
                                "SITTING", "STANDING", "LAYING")


#Use dplyr to Group by Activity and Subject, and summarize each variable in the data 
#by its mean
y <- finaldata %>%
        group_by(activity, subject) %>%
        summarise_each(funs(mean))

#Write the summarized table into a TXT file with the specifications provided by 
#the project instructions
write.table(y, "final-project_tidy-data.txt", row.name=FALSE)


