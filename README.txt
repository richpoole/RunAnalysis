
README for ‘run_analysis.R’:

===================================================================================

The goal of run_analysis.R script is:
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set "dataset" with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set "tidy" with the average of each variable for each activity and each subject.

run_analysis.R combines all of the data into a single dataset "combined" (10,299 obs. of 563 variables) and then creates a smaller dataset "dataset" (10,299 obs. of 68 variables) containing the subject, activity, and only the variables consisting of mean() and std() data [10,299 obs. of 68 variables].  

run_analysis.R lastly creates an independent "tidy" dataset (180 obs. of 68 variables) with the average of each variable for each activity and each subject
_____________________________________

The “run_analysis.R” script performs the following steps:

1. Appropriate libraries are activated, namely, ‘dplyr’ and ‘reshape2’.

2. The training and test observation data sets of variable data (7,352 obs. and 2,947 obs., respectively of 561 variables) are read into “Xtrain” and “Xtest” data.frames and combined into a single data.frame “xdata” (10,299 obs. of 561 variables). 

3. Observation variable names are read from “features.txt” and loaded into “cnames” data.frame and then loaded into “xdata" column names, providing a variable data set with values and variable names.  

N.B.:  Note that there are redundant variable names (i.e. same name used for 3 variables - e.g. 461, 475, and 489 all have the same text names).  In this script, those variables are removed, so removing the variable number is not a problem.  If those variable names are to be utilized in a future version of run_analysis, it may make sense to leave the numbers in the variable names so that the variables are uniquely identifiable.

4. Activity level data sets “y_train.txt” and “y_test.txt” are read into “ytrain" and “ytest” data.frames respectively, and then combined into “ydata" data.frame. 

5. Activity level data in “ydata" is replaced with a string value describing the activity level (obtained from the activity label data set “activity_labels.txt” loaded into “alabels” data.frame.  “alabels” is used to ‘mutate’ the ydata data.frame from numeric values to string descriptors which is loaded into the “activity” data.frame, which is subsequently reduced to a vector by removing the 1st column.

6. The training and test ‘subject’ data sets containing subject identification data (7,352 obs. and 2,947 obs. of 1 variable) are read into “subtrain” and “subtest” data.frames and combined into a single data.frame “subject” (10,299 obs. of 1 variable). The string “subject” is loaded as the column name for “subject” data.frame.

7. The “subject”, “activity” and “xdata" observation data is combined into the “combined” data.frame representing a complete data set.

8. The logical vector “mean_std_cols” is created indicating which columns to retain, ,namely, the ‘subject’, ‘activity’, and observation variables with containing mean() & std() values.  That logical vector is used to create the “dataset” data.frame from “xdata" that is the complete data set requested in Step 4.

9. “dataset” is written to “./data/dataset” to save for later processing.

10. The “dataset data.frame is used to create a second, independent tidy data set with the average of each variable for each activity and each subject.  The “dataset” data.frame is melt-ed into the “melted” data.frame using ‘subject’ and ‘activity’ as id’s.  That is then dcast-ed into the “tidy” data.frame contained the summarized data set, which is written to “./data/dataset/tidy”. 
_____________________________________

o run_analysis.R script utilizes data from the below mentioned “Human Activity Recognition Using Smartphones Dataset” (described below).  This script was developed for the Johns Hopkins University class “Getting and Cleaning Data” offered on Coursera.org.  

o CodeBook.md describes the variables, the data, and any transformations of work.

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
