
# Load packages -----------------------------------------------------------
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyr))

## Dataimport and merging

# Read activity names
flabs <- read.table('./UCI HAR Dataset/activity_labels.txt', sep = ' ') %>% 
      rename(Y = V1, Activity = V2)
# Read feature names
feats <- read.table('./UCI HAR Dataset/features.txt', sep = ' ')

# Read subject ID:s
test.id <- read.table('./UCI HAR Dataset/test/subject_test.txt', sep = ' ') %>% mutate(Set = 'test')
train.id <- read.table('./UCI HAR Dataset/train/subject_train.txt', sep = ' ') %>% mutate(Set = 'train')
data.id <- bind_rows(test.id, train.id)

# Read activities
test.y <- read.table('./UCI HAR Dataset/test/y_test.txt', sep = ' ', header = F)
train.y <- read.table('./UCI HAR Dataset/train/y_train.txt', sep = ' ', header = F)
data.y <- bind_rows(test.y, train.y)

# Read data
test.x <- read.table('./UCI HAR Dataset/test/X_test.txt')
train.x <- read.table('./UCI HAR Dataset/train/X_train.txt')
# Merge test and train data
data.x <- bind_rows(test.x, train.x)

# Get the feature names on the data
names(data.x) <- feats$V2
# extract only means and std. Omit meanFreq()
data.x <- data.x[,grepl('mean\\(|std\\(', names(data.x))]

# Combine into one dataframe
data <- data.frame(ID = data.id$V1, Set = data.id$Set, Y = data.y$V1)
# Add activitylabels and data
data <- data %>% inner_join(flabs, by = 'Y') %>% bind_cols(data.x) %>% select(-Y) %>% 
      arrange(ID)


# Create a tidy dataset ---------------------------------------------------

# Aggregate data, take mean of all features. That is mean of all means and std-values
data.agg <- data %>% group_by(ID, Set, Activity) %>% summarise_each(funs(mean))

# Make everything into long format
data.m <- data.agg %>% gather(variable, value, -ID, -Activity,-Set)
# Split variable into parts
data.m <- data.m %>% separate(variable, c('Feature','Type','Coordinate'), sep = '-', remove = T)

#add time/freq column
data.m$Domain <- ifelse(grepl('^t',data.m$Feature), 'time', 'frequency')

# Remove some unnessisary characters from Feature and Type
data.m$Type <- gsub('\\(|\\)','', data.m$Type)
data.m$Feature <- gsub('^t','', data.m$Feature)
data.m$Feature <- gsub('^f','', data.m$Feature)

# Arrange rows by ID and Activity
data.m %>% arrange(ID, Activity, Feature)

# Save data ---------------------------------------------------------------
# Saving the tidy data
write.table(data.m, 'UCI_HAR_tidy.txt', sep = '\t', row.names=FALSE)