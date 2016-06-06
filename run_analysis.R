library(dplyr)

## load Xtrain & Xtest datasets & combine into ‘dataset’
Xtrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")  ## loads df of 7352 x 561
Xtest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")   ## loads df of 2947 x 561
xdata <- rbind(Xtrain, Xtest)

## get variable names & load into ‘dataset’ column names (kept #’s due to duplicate names)
cnames <- read.csv("./data/UCI HAR Dataset/features.txt", header = FALSE, sep = ".")
colnames(xdata) <- cnames[,1]

## select only columns with mean() or std()
xdata <- xdata[ ,grep(("mean[()]|std[()]"),cnames[,1])]

## load activity (ytrain + ytest) dataset
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
colnames(subject) <- "subject"

dataset <- cbind(subject, activity, xdata)

## write dataset to file (or print)
##print(dataset)  
write.csv(dataset, "./data/dataset.csv")

## from dataset, create 2nd data set with average of each variable for each activity & subject 
avgdata <- dataset[ ,grep(("mean[()]"),colnames(dataset))]
write.csv(avgdata, "./data/avgdata.csv")
