# Getting and Cleaning data Course Project

library(plyr)

#setwd...

# Read test, train, subject, activity and feature data

test_y <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
test_x <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
test_sub <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

train_y <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
train_x <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
train_sub <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

act <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
feat <- read.table(".\\UCI HAR Dataset\\features.txt")

# Of these features, we only want the mean and stdev ones
reqfeat <- grep("mean()|std()", feat[, 2])

# Combine x data from test and train sets. Combining x test and train allows us to work 
# with only this data to setup column names etc.

x <- rbind(test_x, train_x)

# Combine y data from test and train data. 

y <- rbind(test_y, train_y)

# Subset x data with required features only

x <- x[, reqfeat]

# Set correct col names for x data: col names are second col of features dataset, 
# subsetting only those we are using

colnames(x) <- feat[reqfeat,2]

# Translate the activity ID in y set to the activity name and rename the column name to "activityName"
# act dataset second column contains activity names

y[, 1] <- act[y[, 1], 2]

colnames(y) <- "activityName"

# Combine to form the overall dataset, including subject data. Clean up column names

sub <- rbind(test_sub, train_sub)

colnames(sub) <- "subjectID"

finaldata <- cbind(sub,x,y)

colnames(finaldata) <- gsub("\\()","",colnames(finaldata))
colnames(finaldata) <- gsub("\\-","",colnames(finaldata))

# Finally, create a tidy data set from above data which shows means 
# of the variables for each activity and subject

tidydata <- ddply(finaldata, .(activityName, subjectID), numcolwise(mean))

# Generate a text file to store tidydata

write.table(tidydata, "tidydata.txt",row.name = FALSE)










