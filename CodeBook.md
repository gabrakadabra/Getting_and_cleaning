# Codebook

## Introduction
This data is based on motion data
collected by the accelerometers and gyroscope 
from the Samsung Galaxy S smartphone.

The data consists of measurements on 30 subjects
divided into a test and a training set.

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The data was then processed using filtering and 
variables were calcualted from both the time and frequency domain.

## Original data
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For each record in the orignal dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The original features were

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

### Units

* Features are normalized and bounded within [-1,1].

* The acceleration signal from the smartphone accelerometer X,Y and Z axis in standard gravity units 'g' (features containing **Acc**).

* The body acceleration signal obtained by subtracting the gravity from the total acceleration
(features containing **BodyAcc**).

* The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second (features containing **Gyro**)


## Transformation of the original data

The tidy data consists of Mean values (mean() above) and standard deviations 
(std() above) for each measurement.
A value for each subject at a specific activity on a specific feature
was calculated by calculating the average of the means of the 
meanvalues and standard deviations.

The data was transformed into long format containing the
variables listed below.

##Variable explanation

**ID** (FACTOR) is an identifier of the subject

Ranges from 1 to 30.

**Set** (FACTOR) indicates if the observation is from the train or the test set

1. train
2. test

**Activity** (FACTOR) is the activity label describing the position of the subject when
measurement was taken.

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

**Feature** is the variable measured on each subject. 
It contains the following features

1. BodyAcc
2. BodyAccJerk
3. BodyAccJerkMag
4. BodyAccMag
5. BodyBodyAccJerkMag
6. BodyBodyGyroJerkMag
7. BodyBodyGyroMag
8. BodyGyro
9. BodyGyroJerk
10. BodyGyroJerkMag
11. BodyGyroMag
12. GravityAcc
13. GravityAccMag

**Coordinate** (FACTOR) is the coordinate position if avaliable

1. X
2. Y
3. Z

**value** (NUMERIC) is the numeric value of the obeservation

**Domain** (FACTOR) indicate the domain of the observation

1. time
2. frequency

##License

Use of the original dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
