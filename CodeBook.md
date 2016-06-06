---
title: "CodeBook.md"
author: "Rich Poole"
date: "June 5, 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

The purpose of the run_analysis.R program is to prepare a tidy data that can be used for later analysis from the data mentioned below. The run_analysis.R program assumes that the data files from the link below have been unzipped and placed in the "./data" folder.  From there, the program will automatically read the pertinent datasets - e.g. 
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

and create a single compiled dataset "dataset" containing the subject, activity, and numerous variables consisting of mean() and std() data.  Additionally, the run_analysis.R will create a subset dataset "avgdata" which consisted of subject, activity, and numerous variable consisting of mean() elements. These tidy output datasets are written to the "./data" folder for use in additional analysis using the dataset.csv and avgdata.csv filenames.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
