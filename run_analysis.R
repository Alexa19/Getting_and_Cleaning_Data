# Library actualization
library(plyr)
library(dplyr)

# Read the files and get data

# Geting Features Labels
features <- read.table("./UCI HAR Dataset/features.txt")

# Geting test data
y_test  <- read.table("./UCI HAR Dataset/test/y_test.txt")
x_test  <- read.table("./UCI HAR Dataset/test/x_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Geting training data
y_train  <- read.table("./UCI HAR Dataset/train/y_train.txt")
x_train  <- read.table("./UCI HAR Dataset/train/x_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#1. Merges the training and the test sets to create one data set.

# Improve the names of the columns before combining  <- Appropriately labels the data set with descriptive names

#Change the names of test
names(subject_test) <- "Subject"
names(y_test) <- "Activity"
names(x_test) <- features$V2

#Change the names of train
names(subject_train) <- "Subject"
names(y_train) <- "Activity"
names(x_train) <- features$V2


# Combine X_test with a Subject Activity test
matrix_test <- cbind(x_test,subject_test,y_test)

# Combine X_test with a Subject Activity train  
matrix_train <- cbind(x_train,subject_train,y_train)

# Combine train data with test data
matrix <- rbind(matrix_test,matrix_train)


#2. Extracts only the measurements on the mean and standard deviation for each measurement.

a5 <- grep("\\bmean\\b|\\bstd\\b", names(matrix) , value=TRUE)
matrix_extract <- cbind(matrix[562],matrix[563],matrix[a5])

#3. Uses descriptive activity names to name the activities in the data set

matrix_extract$Activity[matrix_extract$Activity %in% "1"] <- "WALKING"
matrix_extract$Activity[matrix_extract$Activity %in% "2"] <- "WALKING_UPSTAIRS"
matrix_extract$Activity[matrix_extract$Activity %in% "3"] <- "WALKING_DOWNSTAIRS"
matrix_extract$Activity[matrix_extract$Activity %in% "4"] <- "SITTING"
matrix_extract$Activity[matrix_extract$Activity %in% "5"] <- "STANDING"
matrix_extract$Activity[matrix_extract$Activity %in% "6"] <- "LAYING"

#4. Appropriately labels the data set with descriptive names.

# Done in step #1

#5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject 

ActivSubj <- group_by(matrix_extract, Subject , Activity) 
finaldata<-ddply(ActivSubj, c("Subject","Activity"), numcolwise(mean))

write.table(finaldata, file = "data_avg_by_subject.txt", row.name=FALSE)
