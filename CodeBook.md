# **Code Book**

## Coursera *Getting and Cleaning Data* Course Project

---

This code book describes how the *Human Activity Recognition Using Smartphones* dataset is transformed into a tidy data set for further analysis. 

The original dataset, along with a detailed description of the study design and included signal measurements, can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). An overview of the study design as well as instructions to transform the data into a tidy dataset are provided in the `README.md` file.

An overview of the tidy dataset structure is given in the [Tidy Dataset Structure](#dataStructure) section. Variables are listed and described in the [Variables](#variables) section, and the steps to transform the source data into the tidy dataset are listed in the [Transformations](#transformations) section.

### <a name="dataStructure"></a>**Tidy Dataset Structure**

---

The tidy dataset produced, `UCIHARdata_tidy.txt`, has the following format:

  * text file, space-separated values
  * header on first row of file, containing variable names
  * for each unique combination of subject and activity type, 79 mean signal measurements (averages and standard deviations of features from source data)

### <a name="variables"></a>**Variables**

---

#### **IDs**

  * `subjectID`
  
  Subject ID number (1-30).
  
  * `activityID`
  
  Type of activity performed by subject, which can take on the following values:
  
    1. WALKING: subject walks
    2. WALKING_UPSTAIRS: subject walks upstairs
    3. WALKING_DOWNSTAIRS: subject walks downstairs
    4. SITTING: subject sits
    5. STANDING: subject stands
    6. LAYING: subject lies down
    
#### **Averaged Signal Measurements**

Averaged accelerometer and gyroscope measurements are included in this dataset. The signals are triaxial, and the x-, y- and z-components for each feature are provided in the dataset. The accelerometric and gyroscopic data were measured in units of *g* (9.8 m/s<sup>2</sup>)  and rad/s, respectively. The dataset contains features in the time and frequency domains. 

Data in the time domain were collected for each subject/activity type combination at a constant rate of 50 Hz, then filtered using a median filter and 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Acceleration data were separated into body and gravity acceleration signals by using a low pass Butterworth filter with a corner frequency of 0.3 Hz. 

The body linear acceleration and angular velocity data were derived in time to obtain "jerk" signals in each component (x, y, z). By using the Euclidean norm, three-dimensional signal magnitudes were calculated.

Frequency domain features were calculated by applying a Fast Fourier Transform (FFT) to some signals in the time domain.

All features in the source data were normalized and bounded within [-1, 1].

Each feature vector is a row on the text file.

##### **Time Domain Averaged Signals**

  * Mean time-domain body acceleration (x-, y- and z-components):
  
    * `timeBodyAccelerometerMean()-X`
    * `timeBodyAccelerometerMean()-Y`
    * `timeBodyAccelerometerMean()-Z`
      
&NewLine;
    
  * Standard deviation of time-domain body acceleration signals (x-, y- and z-components):
  
    * `timeBodyAccelerometerSTD()-X`
    * `timeBodyAccelerometerSTD()-Y`
    * `timeBodyAccelerometerSTD()-Z`
 
&NewLine;     
    
  * Mean time-domain gravity acceleration (x-, y- and z-components):
  
    * `timeGravityAccelerometerMean()-X`
    * `timeGravityAccelerometerMean()-Y`
    * `timeGravityAccelerometerMean()-Z`
     
&NewLine;

  * Standard deviation of time-domain gravity acceleration signals (x-, y- and z-components):
  
    * `timeGravityAccelerometerSTD()-X`
    * `timeGravityAccelerometerSTD()-Y`
    * `timeGravityAccelerometerSTD()-Z`
     
&NewLine;

  * Mean time-domain body acceleration jerk (x-, y- and z-components):
  
    * `timeBodyAccelerometerJerkMean()-X`
    * `timeBodyAccelerometerJerkMean()-Y`
    * `timeBodyAccelerometerJerkMean()-Z`
      
&NewLine;

  * Standard deviation of time-domain body acceleration jerk (x-, y- and z-components):
  
    * `timeBodyAccelerometerJerkSTD()-X`
    * `timeBodyAccelerometerJerkSTD()-Y`
    * `timeBodyAccelerometerJerkSTD()-Z`
     
&NewLine;

  * Mean time-domain body angular velocity (x-, y- and z-components):
  
    * `timeBodyGyroscopeMean()-X`
    * `timeBodyGyroscopeMean()-Y`
    * `timeBodyGyroscopeMean()-Z`
    
&NewLine;

  * Standard deviation of time-domain body angular velocity (x-, y- and z-components):
  
    * `timeBodyGyroscopeSTD()-X`
    * `timeBodyGyroscopeSTD()-Y`
    * `timeBodyGyroscopeSTD()-Z`
      
&NewLine;

  * Mean time-domain body angular velocity jerk (x-, y- and z-components):
  
    * `timeBodyGyroscopeJerkMean()-X`
    * `timeBodyGyroscopeJerkMean()-Y`
    * `timeBodyGyroscopeJerkMean()-Z`
      
&NewLine;

  * Standard deviation of time-domain body angular velocity jerk (x-, y and z-components):
  
    * `timeBodyGyroscopeJerkSTD()-X`
    * `timeBodyGyroscopeJerkSTD()-Y`
    * `timeBodyGyroscopeJerkSTD()-Z`
     
&NewLine;

  * Mean time-domain body acceleration magnitude:
  
    * `timeBodyAccelerometerMagnitudeMean()`
      
&NewLine;

  * Standard deviation of time-domain body acceleration magnitude:
  
    * `timeBodyAccelerometerMagnitudeSTD()`
      
&NewLine;

  * Mean time-domain gravity acceleration magnitude:
  
    * `timeGravityAccelerometerMagnitudeMean()`
      
&NewLine;

  * Standard deviation of time-domain gravity acceleration magnitude:
  
    * `timeGravityAccelerometerMagnitudeSTD()`
      
&NewLine;

  * Mean time-domain body acceleration jerk magnitude:
  
    * `timeBodyAccelerometerJerkMagnitudeMean()`
      
&NewLine;

  * Standard deviation of time-domain body acceleration jerk magnitude:
  
    * `timeBodyAccelerometerJerkMagnitudeSTD()`
     
&NewLine;

  * Mean time-domain body angular velocity magnitude:
  
    * `timeBodyGyroscopeMagnitudeMean()`
      
&NewLine;

  * Standard deviation of time-domain body angular velocity magnitude:
  
    * `timeBodyGyroscopeMagnitudeSTD()`
      
&NewLine;

  * Mean time-domain body angular velocity jerk magnitude:
  
    * `timeBodyGyroscopeJerkMagnitudeMean()`
      
&NewLine;

  * Standard deviation of time-domain body angular velocity jerk magnitude:
  
    * `timeBodyGyroscopeJerkMagnitudeSTD()`

&NewLine;

##### **Frequency Domain Averaged Signals**

  * Mean frequency-domain body acceleration (x-, y- and z-components):
  
    * `frequencyBodyAccelerometerMean()-X`
    * `frequencyBodyAccelerometerMean()-Y`
    * `frequencyBodyAccelerometerMean()-Z`
      
&NewLine;

  * Standard deviation of frequency-domain body acceleration (x-, y- and z-components):
  
    * `frequencyBodyAccelerometerSTD()-X`
    * `frequencyBodyAccelerometerSTD()-Y`
    * `frequencyBodyAccelerometerSTD()-Z`
      
&NewLine;

  * Weighted average of frequency components of frequency-domain body acceleration (x-, y- and z-components):
  
    * `frequencyBodyAccelerometerMeanFreq()-X`
    * `frequencyBodyAccelerometerMeanFreq()-Y`
    * `frequencyBodyAccelerometerMeanFreq()-Z`
      
&NewLine;

  * Mean frequency-domain body acceleration jerk (x-, y- and z-components):
  
    * `frequencyBodyAccelerometerJerkMean()-X`
    * `frequencyBodyAccelerometerJerkMean()-Y`
    * `frequencyBodyAccelerometerJerkMean()-Z`
      
&NewLine;

  * Standard deviation of frequency-domain body acceleration jerk (x-, y- and z-components):
  
    * `frequencyBodyAccelerometerJerkSTD()-X`
    * `frequencyBodyAccelerometerJerkSTD()-Y`
    * `frequencyBodyAccelerometerJerkSTD()-Z`
      
&NewLine;

  * Weighted average of frequency components of frequency-domain body acceleration jerk (x-, y- and z-components):
  
    * `frequencyBodyAccelerometerJerkMeanFreq()-X`
    * `frequencyBodyAccelerometerJerkMeanFreq()-Y`
    * `frequencyBodyAccelerometerJerkMeanFreq()-Z`
      
&NewLine;

  * Mean frequency-domain body angular velocity (x-, y- and z-components):
  
    * `frequencyBodyGyroscopeMean()-X`
    * `frequencyBodyGyroscopeMean()-Y`
    * `frequencyBodyGyroscopeMean()-Z`
    
&NewLine;

  * Standard deviation of frequency-domain body angular velocity (x-, y- and z-components):
  
    * `frequencyBodyGyroscopeSTD()-X`
    * `frequencyBodyGyroscopeSTD()-Y`
    * `frequencyBodyGyroscopeSTD()-Z`
    
&NewLine;

  * Weighted average of frequency components of frequency-domain body angular velocity (x-, y- and z-components):
  
    * `frequencyBodyGyroscopeMeanFreq()-X`
    * `frequencyBodyGyroscopeMeanFreq()-Y`
    * `frequencyBodyGyroscopeMeanFreq()-Z`
    
&NewLine;

  * Mean frequency-domain body acceleration magnitude:
  
    * `frequencyBodyAccelerometerMagnitudeMean()`
    
&NewLine;

  * Standard deviation of frequency-domain body acceleration magnitude:
  
    * `frequencyBodyAccelerometerMagnitudeSTD()`
    
&NewLine;

  * Weighted average of frequency components of frequency-domain body acceleration magnitude:
  
    * `frequencyBodyAccelerometerMagnitudeMeanFreq()`
    
&NewLine;

  * Mean frequency-domain body acceleration jerk magnitude:
  
    * `frequencyBodyAccelerometerJerkMagnitudeMean()`
    
&NewLine;

  * Standard deviation of frequency-domain body acceleration jerk magnitude:
  
    * `frequencyBodyAccelerometerJerkMagnitudeSTD()`
    
&NewLine;

  * Weighted average of frequency components of frequency-domain body acceleration jerk magnitude:
  
    * `frequencyBodyAccelerometerJerkMagnitudeMeanFreq()` 
    
&NewLine;

  * Mean frequency-domain body angular velocity magnitude:
  
    * `frequencyBodyGyroscopeMagnitudeMean()`
    
&NewLine;

  * Standard deviation of frequency-domain body angular velocity magnitude:
  
    * `frequencyBodyGyroscopeMagnitudeSTD()`
    
&NewLine;

  * Weighted average of frequency components of frequency-domain body angular velocity magnitude:
  
    * `frequencyBodyGyroscopeMagnitudeMeanFreq()`
    
&NewLine;

  * Mean frequency-domain body angular velocity jerk magnitude:
  
    * `frequencyBodyGyroscopeJerkMagnitudeMean()`
    
&NewLine;

  * Standard deviation of frequency-domain body angular velocity jerk magnitude:
  
    * `frequencyBodyGyroscopeJerkMagnitudeSTD()`
    
&NewLine;

  * Weighted average of frequency components of frequency-domain body angular velocity jerk magnitude:
  
    * `frequencyBodyGyroscopeJerkMagnitudeMeanFreq()`
    

### <a name="transformations"></a>**Transformations**

---

All following steps were implemented in the script `run_analysis.R`.

Before applying transformations, the source data were downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>, extracted and read into R as data tables.

  1. The training and test sets were merged to create one dataset. Two columns were added to the feature value data: `subjectID` and `activityID`.
  2. The measurements of the mean and standard deviation for each signal measurement were extracted.
  3. Activity ID numbers were replaced with descriptive activity names in the dataset.
  4. The variable names were relabeled to improve clarity as follows:
    * A typo in some variable names was corrected: `BodyBody` became `Body`.
    * `-mean` became `Mean` and `-std` became `STD`.
    * The `t` and `f` at the beginning of variable names in the source data, which indicated frequency and time domain, respectively, were expanded to `time` and `frequency`.
    * `Acc` was expanded to `Accelerometer`, `Gyro` was expanded to `Gyroscope`, and `Mag` was expanded to `Magnitude`.
  5. From the data in transformation 4, an independent, tidy dataset was created that contained the average of each variable grouped by each unique subject/activity combination.
  
The dataset from transformation 5 was then saved as output file `UCIHARdata_tidy.txt`.
