Getting & Cleaning Data Final Project Codebook
==============================================

This Codebook refers to the following file: final-project_tidy-data.txt

The file was created using the datasets defined below. 

An R script was developed to ingest the training data sets, clean up the variable names by removing punctuation and making all the letters lower case, and extract the mean and standard deviation variables.

The R script includes comments that explain each step in the ingestion and transformation process.


DATASETS
--------

Training Data: 7,352 observations in each TXT file
- X_train.txt: Training set with 561 variables 
- Y_train.txt': Activity Labels (defined below) with 1 variable  
- subject_train.txt: 30 subjects in the study, each assigned a number from 1 to 30; 1 variable in the dataset

Test Data: 2,947 observations in each TXT file
- X_test.txt: Training set with 561 variables
- Y_test.txt': Activity Labels (defined below) with 1 variable  
- subject_test.txt: 30 subjects in the study, each assigned a number from 1 to 30; 1 variable in the dataset

features.txt: Lists the names of each variable used in the "X" txt files

activity_labels.txt: Lists the values of Activities, i.e 1 = WALKING, etc 

For more information about the datasets please download the following zip file:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

In the zip file there are two files that explain the datasets and define each variable:
- codebook.txt
- features_info.txt