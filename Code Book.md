# Code Book

Data used in this project was downloaded from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and stored in the working directory.
***
## Variables
- `features` is assigned from features.txt and column names **num** and **func** were added.
- `activity_labels` is assigned from *activity_labels.txt* and column names **id** and **activity** were added. 
- `subject_train` is assigned from *subject_train.txt* and column name **subjects** was added.
- `x_train` is assigned from *x_train.txt* and column names were added from features 2nd column **func**.
- `y_train` is assigned from *y_train.txt* and column name **id** was added.
- `subject_test` is assigned from *subject_test.txt* and column name **subjects** was added.
- `x_test` is assigned from *x_test.txt* and column names were added from features 2nd column **func**.
- `y_test` is assigned from *y_test.txt* and column name **id** was added.


## Data Merge
Data from training and test observations was merged into a single data set called `data`. First merging `x_train` and `x_test` into `x_data` using **rbind**, then doing the same with `y_train` and `y_test` into `y_data`. Subjects data was merged into `subjects_data` using **rbind** with `subject_train` and `subject_test`. Lastly `data` was assigned using **cbind** between the data merged previously. 

## Data Filtering
`data` is subset to `filtered` using **select** function, including *subjects* and *id* columns, and any other column which **contains** *"std"* or *"mean"*.

***

The script `run_analysis.R` applies Activity Names to the **id** column of `filtered` data table by subsetting `activity_labels` within its **activity** column and **matching()** the **id** with its corresponding label.

Column names of `filtered` are labeled correctly by editing text variables with **gsub()** and using regular expressions to identify abbreviations and subtituting them with descriptive names.

Finally an independent tidy data set `final` is created by **grouping** `filtered` data by *subjects and activity* and applying the mean to each column. `filtered` is then exported to `TidyData.txt`

***
