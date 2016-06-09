library(dplyr)
library(reshape2)

## load Xtrain & Xtest datasets & combine into ‘dataset’
Xtrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")  ## loads df of 7352 x 561
Xtest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")   ## loads df of 2947 x 561
xdata <- rbind(Xtrain, Xtest)

## get variable names & load into ‘dataset’ column names (kept #’s due to duplicate names)
# cnames <- read.csv("./data/UCI HAR Dataset/features.txt", header = FALSE, sep = ".")
# colnames(xdata) <- cnames[,1]
cnames <- read.csv("./data/UCI HAR Dataset/features.txt", header = FALSE, sep = " ")
names(xdata) <- cnames[,2]

## load activity (ytrain + ytest) values
ytrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")    # loads df of 7352 x 1
ytest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")    # loads df of 2947 x 1
ydata <- rbind(ytrain, ytest)                      # 10,299 x 1 list of activities

## change activity from activity numbers (1:6) to activity strings & set column name
alabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
activity <- mutate(ydata,activity=alabels[ydata[,1],2])
activity <- activity[,2]

## load subject (subject_train + subject_test) dataset
subtrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")    # loads df of 7352 x 1
subtest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")    # loads df of 2947 x 1
subject <- rbind(subtrain, subtest)                      # 10,299 x 1 list of subjects
names(subject) <- "subject"

# create combined dataset
combined <- cbind(subject, activity, xdata)

######## select only columns with mean() or std()
######## xdata <- xdata[ ,grep(("mean\\(\\)|std\\(\\)"),cnames[,1])]

## only keep columns:  subject, activty & variables with mean() & std()
mean_std_cols <- grepl("mean\\(\\)", names(combined)) | grepl("std\\(\\)",names(combined))
mean_std_cols[1:2] <- TRUE       # include "subject" and "activity"
dataset <- combined[ , mean_std_cols]

## write dataset to file (or print)
write.table(dataset, "./data/dataset", row.names=FALSE)

## from dataset, create 2nd data set ("tidy") with mean of each variable for each activity & subject 
melted <- melt(dataset, id=c("subject","activity"))
tidy <- dcast(melted, subject+activity ~ variable, mean)
write.table(tidy, "./data/tidy", row.names=FALSE)
