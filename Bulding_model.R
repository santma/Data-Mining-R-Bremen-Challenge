test_dataset = read.csv("test_data.csv")
train_dataset = read.csv("training_data.csv")

# cleaning
train_dataset = train_dataset[,-1]


# Splitting the training_set into the Training set and Validation set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(train_dataset, SplitRatio = 0.8)
training_set = subset(train_dataset, split == TRUE)
validation_set = subset(train_dataset, split == FALSE)


# Fitting K-NN to the Training set and Predicting the Test set results
library(class)
y_pred = knn(train = training_set[, -1],
             test = validation_set[, -1],
             cl = training_set[, 1],
             k = 6,
             prob = TRUE)

# Evaluating Preformance # 66% with KNN
y_act = as.factor(validation_set[, 1])
response = (y_act == y_pred)
summary(response)

#Fitting 
