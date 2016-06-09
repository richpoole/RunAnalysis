---
title: "CodeBook.md"
author: "Rich Poole"
date: "June 8, 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## run_analyis.R CodeBook

## Description of Study:  

The data is from the "Human Activity Recognition Using Smartphones Dataset" version 1.0.  This dataset was published by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, & Luca Oneto at the Smartlab (Non Linear Complex Systems Laboratory) - www.smartlab.ws.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## run_analysis.R script:

The purpose of the run_analysis.R script is to prepare a tidy data that can be used for later analysis from the data mentioned below. The run_analysis.R program assumes that the data files from the link below have been unzipped and placed in the "./data" folder.  From there, the program will automatically read the pertinent datasets:

- 'features.txt': List of all observation names, in the format "variable_number" followed by "variable description"  Note: some variables have redundant names (only the number will differentiate variables).  No duplication is in the Mean() & std() variables, so numbers have been removed for the final tidy datasets. File:
    1 tBodyAcc-mean()-X
    2 tBodyAcc-mean()-Y
    ~
    561 angle(Z,gravityMean)
- 'activity_labels.txt': list of 6 activity labels strings that identify the 1:6 "activity" variables.  6 obs. of 2 variables (activity level labels). File: 
    1 WALKING
    2 WALKING_UPSTAIRS
    3 WALKING_DOWNSTAIRS
    4 SITTING
    5 STANDING
    6 LAYING
- 'train/X_train.txt': Training set variables.  7,352 obs. of 561 variables  (observation data).  File:
             V1          V2         V3         V4         V5  ~          V561
    1 0.2885845 -0.02029417 -0.1329051 -0.9952786 -0.9831106      -0.05862692
    2 0.2784188 -0.01641057 -0.1235202 -0.9982453 -0.9753002      -0.05431672
    3 0.2796531 -0.01946716 -0.1134617 -0.9953796 -0.9671870      -0.04911782
    ~                                                         ~
    561 0.2776613 -0.01727106 -0.1072207 -0.991653 -0.9802903     -0.1746585
- 'train/y_train.txt': Training subjects.  7,352 obs. of 1 variable (subject id).  File:
      V1
    1  5
    2  5
    3  5
    ~
    7352  2
- 'test/X_test.txt': Test set variables.  2,947 obs. of 561 variables  (observation data). File:
    similar to X_train
- 'test/y_test.txt': Test subjects.   2,947 obs. of 1 variable (subject id). File:
    similar to y_train
    
The goal of run_analysis.R script is:
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set "dataset" with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set "tidy" with the average of each variable for each activity and each subject.

run_analysis.R combines all of the data into a single dataset "combined" (10,299 obs. of 563 variables) and then creates a smaller dataset "dataset" (10,299 obs. of 68 variables) containing the subject, activity, and only the variables consisting of mean() and std() data [10,299 obs. of 68 variables].  

run_analysis.R lastly creates an independent "tidy" dataset (6 obs. of 68 variables) with the average of each variable for each activity and each subject

These tidy output datasets are written to the "./data" folder for use in additional analysis using the dataset and avgdata TextEdit filenames.

## Additional information about the original dataset 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

