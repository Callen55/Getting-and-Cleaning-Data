# Getting-and-Cleaning-Data
Coursera Data Science Course 3 project

Project parameters:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
Review criterialess 
  The submitted data set is tidy.
  The Github repo contains the required scripts.
  GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries   calculated, along with units, and any other relevant information.
  The README that explains the analysis files is clear and understandable.
  The work submitted for this project is the work of the student who submitted it.
  Getting and Cleaning Data Course Projectless 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The link to the data used in this project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data is from experiments carried out using a cellular device's accelerometer and gyroscope attached to volunteer's waist. 

Using the run_analysis.R script we merged the test and the training datasets and extracted the values for the mean and the standard deviation for all three of the axial measurments, and added the activity lables for more readablity.
Additionally we created another dataset (named: Second_set.txt)  that aggrigated the mean of the prior means and standard deviations by the test subject and the activity type. 

Codebook was generated using the 'memisc' package
