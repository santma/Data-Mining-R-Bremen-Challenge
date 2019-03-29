library(tidyverse)
library(tidyr)
# Importing the main datasets
main_test = read.csv('challenge.csv')
main_train = read.csv('train.csv')

#only do this for file in main_train (02,03,04,05,06,07,08,09,11,12,13,16,17,18,19) *no 01, 10, 14, 15
csv <- list.files(path = "Test/Subject01/", pattern = ".csv", full.names = TRUE)

#Feature Extraction
subject_test <- data.frame()

for (i in csv) {
  dataset = read.csv(i)
  
  dataset = dataset[c(1,2,3,4,6,7,8,10,11,12,13,9,14,15,16,17,18,19,5)]
  
  colnames(dataset) <- c("EMG1","EMG2","EMG3","EMG4","ACCupperX","ACCupperY","ACCupperZ",
                         "ACClowerX","ACClowerY", "ACClowerZ"," GoniometerY","Goniometer",
                         "GyroupperX","GyroupperY", "GyroupperZ", "GyrolowerX", "GyrolowerY",
                         "GyrolowerZ","Airborne")
  
  first = round(nrow(dataset)/3)
  second = 2 * round(nrow(dataset)/3)
  
  dataset_1 = dataset[1:first,]
  dataset_2 = dataset[first:second,]
  dataset_3 = dataset[second:nrow(dataset),]
  
  sd_1.EMG1[i] = sd(dataset_1[,1])
  sd_1.EMG2[i] = sd(dataset_1[,2])
  sd_1.EMG3[i] = sd(dataset_1[,3])
  sd_1.EMG4[i] = sd(dataset_1[,4])
  sd_1.ACCupperX[i] = sd(dataset_1[,5])
  sd_1.ACCupperY[i] = sd(dataset_1[,6])
  sd_1.ACCupperZ[i] = sd(dataset_1[,7])
  sd_1.ACClowerX[i] = sd(dataset_1[,8])
  sd_1.ACClowerY[i] = sd(dataset_1[,9])
  sd_1.ACClowerZ[i] = sd(dataset_1[,10])
  sd_1.GoniometerY[i] = sd(dataset_1[,11])
  sd_1.Goniometer[i] = sd(dataset_1[,12])
  sd_1.GyroupperX[i] = sd(dataset_1[,13])
  sd_1.GyroupperY[i] = sd(dataset_1[,14])
  sd_1.GyroupperZ[i] = sd(dataset_1[,15])
  sd_1.GyrolowerX[i] = sd(dataset_1[,16])
  sd_1.GyrolowerY[i] = sd(dataset_1[,17])
  sd_1.GyrolowerZ[i] = sd(dataset_1[,18])
  sd_1.Airborne[i] = sd(dataset_1[,19])
  
  sd_2.EMG1[i] = sd(dataset_2[,1])
  sd_2.EMG2[i] = sd(dataset_2[,2])
  sd_2.EMG3[i] = sd(dataset_2[,3])
  sd_2.EMG4[i] = sd(dataset_2[,4])
  sd_2.ACCupperX[i] = sd(dataset_2[,5])
  sd_2.ACCupperY[i] = sd(dataset_2[,6])
  sd_2.ACCupperZ[i] = sd(dataset_2[,7])
  sd_2.ACClowerX[i] = sd(dataset_2[,8])
  sd_2.ACClowerY[i] = sd(dataset_2[,9])
  sd_2.ACClowerZ[i] = sd(dataset_2[,10])
  sd_2.GoniometerY[i] = sd(dataset_2[,11])
  sd_2.Goniometer[i] = sd(dataset_2[,12])
  sd_2.GyroupperX[i] = sd(dataset_2[,13])
  sd_2.GyroupperY[i] = sd(dataset_2[,14])
  sd_2.GyroupperZ[i] = sd(dataset_2[,15])
  sd_2.GyrolowerX[i] = sd(dataset_2[,16])
  sd_2.GyrolowerY[i] = sd(dataset_2[,17])
  sd_2.GyrolowerZ[i] = sd(dataset_2[,18])
  sd_2.Airborne[i] = sd(dataset_2[,19])
  
  sd_3.EMG1[i] = sd(dataset_3[,1])
  sd_3.EMG2[i] = sd(dataset_3[,2])
  sd_3.EMG3[i] = sd(dataset_3[,3])
  sd_3.EMG4[i] = sd(dataset_3[,4])
  sd_3.ACCupperX[i] = sd(dataset_3[,5])
  sd_3.ACCupperY[i] = sd(dataset_3[,6])
  sd_3.ACCupperZ[i] = sd(dataset_3[,7])
  sd_3.ACClowerX[i] = sd(dataset_3[,8])
  sd_3.ACClowerY[i] = sd(dataset_3[,9])
  sd_3.ACClowerZ[i] = sd(dataset_3[,10])
  sd_3.GoniometerY[i] = sd(dataset_3[,11])
  sd_3.Goniometer[i] = sd(dataset_3[,12])
  sd_3.GyroupperX[i] = sd(dataset_3[,13])
  sd_3.GyroupperY[i] = sd(dataset_3[,14])
  sd_3.GyroupperZ[i] = sd(dataset_3[,15])
  sd_3.GyrolowerX[i] = sd(dataset_3[,16])
  sd_3.GyrolowerY[i] = sd(dataset_3[,17])
  sd_3.GyrolowerZ[i] = sd(dataset_3[,18])
  sd_3.Airborne[i] = sd(dataset_3[,19])
  
}

subject_test <-  cbind(sd_1.EMG1, sd_2.EMG1, sd_3.EMG1,
                       sd_1.EMG2, sd_2.EMG2, sd_3.EMG2,
                       sd_1.EMG3, sd_2.EMG3, sd_3.EMG3,
                       sd_1.EMG4, sd_2.EMG4, sd_3.EMG4, 
                       sd_1.ACCupperX, sd_2.ACCupperX, sd_3.ACCupperX,
                       sd_1.ACCupperY, sd_2.ACCupperY, sd_3.ACCupperY,
                       sd_1.ACCupperZ, sd_2.ACCupperZ, sd_3.ACCupperZ,
                       sd_1.ACClowerX, sd_2.ACClowerX, sd_3.ACClowerX,
                       sd_1.GoniometerY, sd_2.GoniometerY, sd_3.GoniometerY,
                       sd_1.Goniometer, sd_2.Goniometer, sd_3.Goniometer,
                       sd_1.GyroupperX, sd_2.GyroupperX, sd_3.GyroupperX,
                       sd_1.GyroupperY, sd_2.GyroupperY, sd_3.GyroupperY,
                       sd_1.GyroupperZ, sd_2.GyroupperZ, sd_3.GyroupperZ,
                       sd_1.GyrolowerX, sd_2.GyrolowerX, sd_3.GyrolowerX,
                       sd_1.GyrolowerY, sd_2.GyrolowerY, sd_3.GyrolowerY, 
                       sd_1.GyrolowerZ, sd_2.GyrolowerZ, sd_3.GyrolowerZ,
                       sd_1.Airborne, sd_2.Airborne, sd_3.Airborne)


subject_test = subject_test[-1,]

# add Labels
Label_test = main_test$Label

test = cbind(main_test, subject_test)

write.csv(test, file = "sd_testing_data.csv")