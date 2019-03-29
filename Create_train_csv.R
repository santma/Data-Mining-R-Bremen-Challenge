# Data Preprocessing
library(tidyverse)
library(knitr)
library(tibble)
# Importing the dataset
main_train = read.csv('train.csv')
main_test = read.csv('challenge.csv')


#only do this for file in main_train (02,03,04,05,06,07,08,09,11,12,13,16,17,18,19) *no 01, 10, 14, 15
csv <- list.files(path = "Subjects/Subject19/", pattern = ".csv", full.names = TRUE)

#Feature Extraction
#subject_data <- data.frame()

for(i in csv) { 
  dataset <- read.csv(i)
  
  first = round(nrow(dataset)/4)
  second = 2 * round(nrow(dataset)/4)
  third = 3 * round(nrow(dataset)/4)
  
  dataset_1 = dataset[1:first,]
  dataset_2 = dataset[first:second,]
  dataset_3 = dataset[second:third,]
  dataset_4 = dataset[third:nrow(dataset),]
  
  for (v in dataset_1){
    mean_1[i] = mean(v)
    median_1[i] = median(v)
    sd_1[i] = sd(v)
    min_1[i] = min(v)
    max_1[i] = max(v)
  }
  for (v in dataset_2){
    mean_2[i] = mean(v)
    median_2[i] = median(v)
    sd_2[i] = sd(v)
    min_2[i] = min(v)
    max_2[i] = max(v)
  }
  for (v in dataset_3){
    mean_3[i] = mean(v)
    median_3[i] = median(v)
    sd_3[i] = sd(v)
    min_3[i] = min(v)
    max_3[i] = max(v)
  }
  for (v in dataset_1){
    mean_4[i] = mean(v)
    median_4[i] = median(v)
    sd_4[i] = sd(v)
    min_4[i] = min(v)
    max_4[i] = max(v)
  }
  
  subject_data <- cbind(mean_1, mean_2, mean_3, mean_4,
                        median_1, median_2, median_3, median_4,
                        sd_1, sd_2, sd_3, sd_4,
                        min_1, min_2, min_3, min_4,
                        max_1, max_2, max_3, max_4)
}


subject_data = subject_data[-1,]

#main_train = main_train[-1,]

# Creating Training Data
train_data = cbind(main_train, subject_data)
train_data = train_data[,-1]
train_data = train_data[,-1]

write.csv(train_data, file = "train_data.csv")


