# CodeBook for Coursera Course Project Getting and Cleaning Data


# Libraries used:

* plyr

# Activities performed:

Read test, train, subject, activity and feature data
Of these features, we only want the mean and stdev ones, so grep for these in the second column of features dataset
Combine x data from test and train sets. Combining x test and train allows us 
to work with only this data to setup column names etc. (Using rbind)
Subset x data with required features only and set appropriate column names
Translate the activity ID in y set to the activity name and rename the column name to "activityName"
act dataset second column contains activity names
Combine to form the overall dataset, including subject data. 
Finally, create a tidy data set from above data which shows means of the variables for each activity and subject
Generate a text file to store tidydata


# Variables used:
test_y, test_x, test_sub: These hold the test subjects' data; 
train_y, train_x, train_sub: These are the training subjects' data

x data represents measurements for various params.
y data represents the various activity ids.
subject data represents the subjects who undertook the tests.

act: Activities dataset
feat: Features dataset

reqfeat: Subset of feat containing only required features of mean and stdev

x, y, sub: combined test and train datasets for x, y and subject data.

finaldata: dataset showing all columns of all observations for x, y and subjects.

tidydata: finaldata with means of all variables grouped by each activity and subject.


# Transforms:
reqfeat is obtained by grepping the feat dataset for only mean, stdev in column 2.

x y and sub are obtained by doing a rowbind on the test and train data for the respective datasets.

x is further subset to only hold the required features' data.

Convert the activity IDs in y to the corresponding activity names.

Setup correct column names for x and y datasets.

finaldata is obtained by column binding all three datasets of x y and sub

We clean up the column names in finaldata by applying gsub()

Finally we create the tidydata dataset by applying ddply on the finaldata dataset to obtain means of 
data grouped by activity and subject.

Write out the tidydata resultant into a txt file (which is uploaded as the required result)




