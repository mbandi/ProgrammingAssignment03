# ProgrammingAssignment03

## Coursera
## Getting and Cleaning Data Course Project

Matías Ezequiel Bandi

## Packages:
dplyr_1.0.7

data.table_1.14.0

readr_1.4.0


## Usage:
0.- Verify the packages dependencies.

1.- Unzip the data file in the working directory.

2.- The script assumes the root data directory in the working directory is "UCI HAR Dataset", if it's not, you may need to set it manually in the script, line 4, 'dataRootDirectory'

3.- Source the script and excecute runAnalysis()


## About the scripts:
loadPackages tries to load the required packages.

getColumnNames recovers the names for the variables from features.txt

getTestNames recovers the values for the test variable (WALKING, WALKING_UPSTAIRS, etc) from activity_labels.txt

getFullDataTable encapsulates the merging of the training and test data from the 'X' files.

getTable builds a table from a 'X' file and sets the variable names.

getMeanAndStdColumns creates a subset with the mean and standard deviation variables for each measure.

getFullTestLabel encapsulates the merging of the training and test data from the 'y' files.

getTestLabel builds a table from a 'y' file and sets the human readable values.

getFullSubject encapsulates the merging of the training and test data from the 'subject' files.

getSubject builds a table from a 'subject' file.
