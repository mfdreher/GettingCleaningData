Getting & Cleaning Data Final Project
=====================================
June 2015


Data Set
--------
Human Activity Recognition Using Smartphones Dataset
Created by Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)

The complete dataset can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

In the zip file there is a README file and Codebook which provided detailed information on the collection and labeling of the datasets. A very brief overview is as follows:
Training data: 3 data sets with observations (X Train, with 561 variables), Activities the subjects were performing (Y Train), and the subjects (Subject Train). Each data set had 7,352 records
Test data: identical to Training data except that it contained 2,947 records

run_analysis.r Script
---------------------

An R script was developed to ingest the training data sets, clean up the variable names, extract the mean and standard deviation variables, and summarize those variables by 2 different factors (activity and subject).

The R script includes comments that explain each step in the process.

The final product is a file called final-project_tidy-data.txt. The file has 88 variables and 180 records

