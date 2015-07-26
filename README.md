# Getting_and_Cleaning_Data_Project

This is the course project for the Getting and Cleaning Data Coursera course. 

Pre-requisite for running the script

1. Download the dataset if it does not already exist in the working directory, where run_analysis.R will reside
2. Inside working directory, Unzipped data should reside in a directory called "UCI HAR Dataset"
3. Inside "UCI HAR Dataset" it should include following
The dataset includes the following files:
 'features.txt': List of all features.

 'activity_labels.txt': Links the class labels with their activity name.
 
 'train/x_train.txt': Training set.
 
 'train/y_train.txt': Training labels.
 
 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
 
 'test/y_test.txt': Test set.
 
 'test/y_test.txt': Test labels.
 
 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Brief description about script 

### Step 1 -- read the data files

### Step 2 process raw data x, y & subject and merge them with rbind function
#### Appropiratly name the merged data frames
#### Extract mean and std_dev related features's data
	
### Step 3 create final data frame need to print out final txt file & print txt file
#### Step 3.1
#### Melt the dataset
#### Step 3.2
#### Re-cast the data
#### Step 3.3
#### Print table


Script generates tidy_data_set.txt as final output
