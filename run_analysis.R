## Read data

library(dplyr)

foldername <- "UCI HAR Dataset"

#Features & Activity Labels
features <- read.table(paste0(foldername,"/features.txt"),col.names = c("num","func"))
activity_labels <- read.table(paste0(foldername,"/activity_labels.txt"),col.names = c("id","activity"))

#Train Data
subject_train <- read.table(paste0(foldername,"/train/subject_train.txt"),col.names = "subjects")
x_train <- read.table(paste0(foldername,"/train/X_train.txt"),col.names = features$func)
y_train <- read.table(paste0(foldername,"/train/y_train.txt"),col.names = "id") #Labels

#Test Data
subject_test <- read.table(paste0(foldername,"/test/subject_test.txt"),col.names = "subjects")
x_test <- read.table(paste0(foldername,"/test/X_test.txt"),col.names = features$func)
y_test <- read.table(paste0(foldername,"/test/y_test.txt"),col.names = "id") #Labels


#1. Merging the Data
x_data <- rbind(x_train,x_test) 
y_data <- rbind(y_train,y_test)
subjects_data <- rbind(subject_train,subject_test)

data <- cbind(subjects_data,x_data,y_data)

#2. Filter measurements on the mean and std

filtered <- select(data,subjects,id,contains("std"),contains("mean"))

#3. Activity names applied to filtered data

filtered$id <- activity_labels$activity[match(filtered$id,activity_labels$id)]

#4. Labels w descriptive variable names

names(filtered) <- gsub("id","Activity",names(filtered)) 
names(filtered) <- gsub("^t","Time",names(filtered))
names(filtered) <- gsub("Acc","Accelerometer",names(filtered))
names(filtered) <- gsub("BodyBody","Body",names(filtered))
names(filtered) <- gsub("tBody","TimeBody",names(filtered))
names(filtered) <- gsub("^f","Frequency",names(filtered))
names(filtered) <- gsub("Mag","Magnitude",names(filtered))

#5. Tidy Data w the average of each variable / activity / subject

final <- filtered %>% group_by(subjects,Activity) %>%
summarise_all(list(mean=mean))
write.table(final,"TidyData.txt",row.names = FALSE)
