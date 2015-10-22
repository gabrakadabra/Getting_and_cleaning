# Getting_and_cleaning
This is the repository for my course project
for the final exam of COURSERA course Getting and Cleaning Data.


## Analysis
The analysis was preformed using the `run_analysis.R` script.
The raw data is not uploaded to the GIT-repository.
To run the script you must first download the data if you have the permissions
from the course website at coursera.org.
When running the script the data is imported from the 
unzipped data-directory `./UCI HAR Dataset/` using the files

* /activity_labels.txt
* /features.txt
* /features.txt
* test/y_test.txt
* test/X_test.txt
* train/y_test.txt
* train/X_test.txt

The script works by preforming the following steps.

**Dataimport and merging**

Subject id:s are imported from `subject_train.txt` and `subject_test.txt`.
A variable indicating if the data was from the test or train set is added.
Activities are added from `y_train.txt` and `y_test.txt`.
Activity labels are joined to the data from `activity_labels.txt`.
The sensor data `X_test.txt`, `X_train.txt` is imported from the datafiles. All files are merged together.
Variable names are added to the data from `features.txt`.
Only variables with mean values and standard deviations is kept in the data.

**Creating a tidy dataset**

Mean values for each subject at a specific activity for a specific feature 
was calculated using the `summarise_each` function from the dplyr package.
The data was then converted into long format. 
From the feature name the domain, type, base feature and, if applicable,
the X,Y or Z coordinate was extracted. All these was stored in seperate variables.

**Saving the data**

The data is saved to the file `UCI_HAR_tidy.txt`.

## Codebook
A codebook for the data is avaliable in `CodeBook.md`.
The codebook explains which variables that are contained in the 
dataset stored in `UCI_HAR_tidy.txt`.
The codebook also explains the original variables to the
extent of the information given in the course data.

## Data
The data used in this project was collected from UCI.
Information can be accessed here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Licences for the data can be viewed in the code book.