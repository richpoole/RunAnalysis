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

## Variables, Data & Transformations:

o Xtrain - training variable data set from "./data/UCI HAR Dataset/train/X_train.txt" (dim: 7,352 x 561)

o Xtest - test variable data set from "./data/UCI HAR Dataset/test/X_test.txt" (dim: 2,947 x 561)

o xdata - combined (training + test) variable data set.  (dim:  10,299 x 561)

o cnames - variable data set column names from "./data/UCI HAR Dataset/features.txt" (dim: 561 x 2).  Used to load column names into xdata

o ytrain - training activity variable data set from "./data/UCI HAR Dataset/train/y_train.txt" (dim: 7,352 x 1)

o ytest - test activity variable data set from "./data/UCI HAR Dataset/test/y_test.txt" (dim: 2,947 x 1)

o ydata - combined (training + test) activity variable data set.  (dim:  10,299 x 561)

o alabels - activity label strings data set from "./data/UCI HAR Dataset/activity_labels.txt" (dim: 6 x 2).  

o activity - vector contains 'ydata' (activity) mutated from numeric to corresponding activity label strings (length: 10,299)

o subtrain - training subject variable data set from "./data/UCI HAR Dataset/train/subject_train.txt" (dim: 7,352 x 1)

o subtest - test subject variable data set from "./data/UCI HAR Dataset/test/subject_test.txt" (dim: 2,947 x 1)

o subject - combined (training + test) subject variable data set.  (dim:  10,299 x 1)

o combined - combined (cbind) data set including subject, activity, and xdata data.frames & vectors.  (dim: 10,299 x 563)

o mean_std_cols - logical vector containing TRUE for columns to be retained in a reduced data set (TRUE for subject, activity, and variables containing mean() & std() variables).  (length: 563)

o dataset - data.frame containing a reduced version "combined" data.frame using 'mean_std_cols' logical vector

o melted - melted data.frame with 'subject' and 'activity' as id's. (dim: 679,734 x 4)

o tidy - independent tidy data set with the average of each variable for each activity and each subject.  (dim: 180 x 68)

Notes:
- The run_analysis.R program assumes that the data files from the link below have been unzipped and placed in the "./data" folder.  

## Input datasets:

- 'features.txt': List of all observation names, in the format "variable_number" followed by "variable description"  Note: some variables have redundant names (only the number will differentiate variables).  No duplication is in the Mean() & std() variables, so numbers have been removed for the final tidy datasets. File:

    1 tBodyAcc-mean()-X 2 tBodyAcc-mean()-Y  ~  561 angle(Z,gravityMean)

- 'activity_labels.txt': list of 6 activity labels strings that identify the 1:6 "activity" variables.  6 obs. of 2 variables (activity level labels). File: 

    1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING

- 'train/X_train.txt': Training set variables.  7,352 obs. of 561 variables  (observation data). 

             V1          V2         V3         V4         V5  ~          V561
    1 0.2885845 -0.02029417 -0.1329051 -0.9952786 -0.9831106      -0.05862692
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
    
## Additional information about the original dataset 

o original un-zipped data files from this link: 
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  should be placed in directory “./data” so that run_analysis.R can process the data.  
___________________________________________________________________________

o Acknowledgements - input data originally from:

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
