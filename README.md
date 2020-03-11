# **Coursera *Getting and Cleaning Data* Course Project**

---

## **Repository Files**

---

  * `run_analysis.R`: script to transform source data into tidy dataset. See [How to Create Tidy Dataset](#runInstructions) for instructions on running the script and creating the dataset.
  * `CodeBook.md`: the code book, which describes each variable in the tidy dataset, the data format/units, and lists the steps implemented in `run_analysis.R` to transform the data.
  * `README.md`: provides a brief description of the study design as well as instructions for running the script `run_analysis.R` to generate the tidy dataset.
  * `UCIHARdata_tidy.txt`: tidy dataset (output file).
  
## **Study Design**

---

The source dataset used was the [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) dataset. The original signal measurements were collected as follows (quoted directly from the website):

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## <a name="runInstructions"></a>**How to Create Tidy Dataset**

---

The tidy dataset is created by running the script `run_analysis.R`, which executes the following steps:

  * The source data are downloaded (if not already in the directory).
  * The source data are extracted and read as data tables.
  * The training and test sets are merged to create one dataset.
  * The means and standard deviations of each signal measurement are extracted.
  * Activity ID numbers are replaced with descriptive activity names.
  * The variable names in the dataset are relabeled for improved clarity.
  * A second, independent tidy dataset is created with the average of each variable for each unique subject/activity type combination.
  * The dataset in the previous step is written to the `UCIHARdata_tidy.txt` file.
  
For more details on the data transformations, see the codebook `CodeBook.md` and the comments in the script `run_analysis.R`.

## **Dataset Creation Tech Specs**

---

  * OS: Windows 8.1 64-bit version
  * R version: 3.6.1
  * necessary R packages:
    * reshape2 (version 1.4.3)
