To match the activities ('test' column), please refer to activity_labels.txt
For more info about each variable, please refer to features_info.txt and features.txt

The file averageDataSet.csv contains a subset of variables regarding the mean and standard deviation for the accelerometer and gyroscope signal measurements.
For this reason, I'm not considering the weighted average of the frequency components (meanFreq).

The 'test' variable represents the type of experiment, in a human readable format.
The 'subject' variable represents the individual doing the experiment.
Both the train and test data were considered to obtain the average of each variable in activities.test
The average of each variable has been calculated grouping by activity and subject.