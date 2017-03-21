Code Book for this project

The script run_analysis.R performs the 5 steps described in the course project's definition.

1. Download the dataset and unzip the file in the working directory
2. Read all necessary files like x, y subject for test & train, feature and activity files
3. Name the test and train files with the column names obtained from feature file
4. Column bind the values of x,y and subject of test and train files separately and merge it with each other to make a master dataset
5. Pattern match the column names, keeping only those columns which reflect a mean or standard deviation
6. Subset a tidy dataset that consists of the mean value of each variable for each subject and activity

The process and various variables used to produce desired results were listed below:
1. xtrain, ytrain, xtest, ytest, subjecttrain and subjecttest contain the data from the downloaded files
2. Likewise features and activitynames were also read from the corresponding files
3. Column names of the test and train data were updates from the names obtained from the featuers file
4. The element train and test were created by column binding the respective x, y and subject details
5. The element mergedata is created by row binding the train and test data.
6. Pattern matching was carried out to the column names of mergedata to extract the columns referring to mean/std as mentioned in the problem statement
7. The element mergedMeanSD is merged with activitynames df using activity num as the ID to map it up with the activity type variable.
8. Subset a tidy dataset meandata that consists of the mean value of each variable for each subject and activity

The meandata is written to avgtidy.text file for reference.