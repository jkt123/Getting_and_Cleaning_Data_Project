rm(list = ls())
library(plyr)
library(reshape2)

## Step 1 -- read the data files
	data_dir <- "./UCI HAR Dataset/"
	# Read train data
	x_train <- read.table((paste(data_dir,"train/X_train.txt", sep = "")))
	y_train <- read.table((paste(data_dir,"train/y_train.txt", sep = "")))
	subject_train <- read.table((paste(data_dir,"train/subject_train.txt", sep = "")))
	# Read test data
	x_test <- read.table((paste(data_dir,"test/X_test.txt", sep = "")))
	y_test <- read.table((paste(data_dir,"test/y_test.txt", sep = "")))
	subject_test <- read.table((paste(data_dir,"test/subject_test.txt", sep = "")))
	# Read features 
	ftr <- read.table(paste(data_dir,"features.txt",sep = ""))
	# Read activities 
	act <- read.table(paste(data_dir,"activity_labels.txt",sep = ""))


## Step 2 process raw data x, y & subject for final data collectio

	x_data <- rbind(x_test,x_train)
	y_data <- rbind(y_test,y_train)
	subject_data <- rbind(subject_test, subject_train)


	## Name the x_data(data_frame's) varaiables from features provided
	names(x_data) <- ftr[,2]
	## Extract mean and std_dev related features's data
	mean_std_dev_x_data <- x_data[, (grep("-(mean|std)\\(\\)", ftr[,2]))]

	## Name y_data as "activity"
	names(y_data) <- "activity"
	## Replace y_data with actual activity name
	y_data[, 1] <- act[y_data[, 1], 2]

	## Name subject_data as "subjectID"
	names(subject_data) <- "subjectID"

	  ## House-keeping -- cleaning
	  rm(x_train,x_test,y_train,y_test,subject_test,subject_train)  

#Step 3 megre extracted data needed for going forward

	## Rename mean_std_dev_x_data -- actual data will be calculated in step 4
	names(mean_std_dev_x_data) <- as.vector(lapply(names(mean_std_dev_x_data), FUN = function(x) paste("Mean_", x, sep = "")))

	# bind all the data in single data frame
	bind_data <- cbind(subject_data, y_data, mean_std_dev_x_data)


## Step 4 create final data frame need to print out final txt file & print txt file

  ## Step 4.1
  ## Melt the dataset
  #print("Started melting data")
  Melt_bind_data <- melt(bind_data,id = c("subjectID", "activity"))
  #print("Metled data")
  
  ## Step 4.2
  ## Re-cast the data
  cast_data <- dcast(Melt_bind_data, subjectID + activity ~ variable, mean)



  write.table(cast_data, "tidy_data_set.txt", row.names = FALSE, quote = FALSE)
