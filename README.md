# Assignment: Getting-and-Cleaning-data
Course 3 - Getting and Cleaning data - Peer Assignment

This is the peer graded assignment for the Getting and Cleaning Data course in coursera. 

The script run_analysis.R performs the following activities:

1. Download the dataset and unzip the file in the working directory
2. Read all necessary files like x, y subject for test & train, feature and activity files
3. Name the test and train files with the column names obtained from feature file
4. Column bind the values of x,y and subject of test and train files separately and merge it with each other to make a master dataset
5. Pattern match the column names, keeping only those columns which reflect a mean or standard deviation
6. Subset a tidy dataset that consists of the mean value of each variable for each subject and activity

As requested, the end result is saved in the file avgtidy.txt.