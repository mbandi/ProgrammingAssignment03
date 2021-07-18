runAnalysis <- function() {
  loadPackages()
  
  dataRootDirectory <<- "./UCI HAR Dataset/"
  
  fullData <- getFullDataTable("train/X_train.txt", "test/X_test.txt", getColumnNames())
  filteredData <- getMeanAndStdColumns(fullData)
  
  testLabel <- getFullTestLabel("train/y_train.txt", "test/y_test.txt", getTestNames())
  
  subject <- getFullSubject("train/subject_train.txt", "test/subject_test.txt")
  
  tidyData <- cbind(filteredData, testLabel)
  tidyData <- cbind(tidyData, subject)
  colnames(tidyData) <- append(colnames(filteredData), c("test", "subject"))
  
  averageDataSet <- tidyData %>% group_by(test, subject) %>% summarize_all(mean)
  
  write.csv(averageDataSet, "averageDataSet.csv", row.names = FALSE)
}



loadPackages <- function() {
  library(data.table)
  library(dplyr)
  library(readr)
}


#Return the column names from features.txt file
getColumnNames <- function() {
  columnNames <- read_table(paste(dataRootDirectory, "features.txt", sep = ""), col_names = FALSE)[[1]]
  tstrsplit(columnNames, " ")[[2]]
}



#Returns the test names from activity_labels.txt file
getTestNames <- function() {
  read_table(paste(dataRootDirectory, "activity_labels.txt", sep = ""), col_names = FALSE)[[2]]
}



#Returns a table containing the train and test data set
getFullDataTable <- function(trainPath, testPath, columnNames) {
  trainData <- getTable("train/X_train.txt", columnNames)
  testData <- getTable("test/X_test.txt", columnNames)
  rbind(trainData, testData)
}



#Returns a table with readable names
getTable <- function(dataPath, columnNames) {
  dataFile <- paste(dataRootDirectory, dataPath, sep = "")
  table <- read_table(file = dataFile, col_names = FALSE)
  setNames(table, columnNames)
}



#Returns a table with only the mean and standard deviation columns
getMeanAndStdColumns <- function(table) {
  table %>% select(contains("mean()") | contains("std()"))
}



#Returns a table containing the train and test test labels
getFullTestLabel <- function (trainPath, testPath, testNames) {
  trainLabel <- getTestLabel(trainPath, testNames)
  testLabel <- getTestLabel(testPath, testNames)
  rbind(trainLabel, testLabel)
}



#Returns a table with the readable factorized test type values
getTestLabel <- function (filePath, testNames) {
  file <- paste(dataRootDirectory, filePath, sep = "")
  table <- read_table(file = file, col_names = FALSE, col_types = c('f'))
  levels(table$X1)[1] <- testNames[1]
  levels(table$X1)[2] <- testNames[2]
  levels(table$X1)[3] <- testNames[3]
  levels(table$X1)[4] <- testNames[4]
  levels(table$X1)[5] <- testNames[5]
  levels(table$X1)[6] <- testNames[6]
  table
}



#Returns a table containing the train and test test subjects
getFullSubject <- function (trainPath, testPath) {
  trainSubject <- getSubject(trainPath)
  testSubject <- getSubject(testPath)
  rbind(trainSubject, testSubject)
}



#Returns a table with the subjects
getSubject <- function (filePath) {
  file <- paste(dataRootDirectory, filePath, sep = "")
  read_table(file = file, col_names = FALSE)
}


