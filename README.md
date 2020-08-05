# Getting and Cleaning Data Course Project

R Script `run_analysis.R` uses data from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) that was built from the recordings of 30 subjects performing activities while carrying a smartphone with inertial sensors.

   - `Code Book.md` provides an explanation of how data was transformed and all the variable names I used to store elements from the database.
   - `run_analysis.R`: 
        1. Merges the training and the test sets to create one data set.
        2. Extracts only the measurements on the mean and standard deviation for each measurement.
        3. Uses descriptive activity names to name the activities in the data set.
        4. Appropriately labels the data set with descriptive variable names.
        5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    - Finally `TidyData.txt` stores the final result expected for this project and handed by `run_analysis.R`. 
