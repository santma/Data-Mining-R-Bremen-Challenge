# importing the dataset 
dataset = read.csv('training_data.csv')
dataset = dataset[-1]
dataset = dataset[-(2:5)]
dataset = dataset[1:9]

# Creating Labels for Label Column
dataset$Label = factor(dataset$Label, 
                       levels = c('curve-left-spin-Lfirst', 'curve-left-spin-Rfirst',
                                  'curve-left-step', 'curve-right-spin-Lfirst',
                                  'curve-right-spin-Rfirst', 'curve-right-step',
                                  'jump-one-leg', 'jump-two-leg',
                                  'lateral-shuffle-left', 'lateral-shuffle-right',
                                  'lay', 'run',
                                  'sit', 'sit-to-stand',
                                  'stair-down', 'stair-up',
                                  'stand', 'stand-to-sit',
                                  'v-cut-left-Lfirst', 'v-cut-left-Rfirst',
                                  'v-cut-right-Lfirst', 'v-cut-right-Rfirst',
                                  'walk'),
                       labels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Label, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
validation_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[, 2:9] = scale(training_set[, 2:9])
validation_set[, 2:9] = scale(validation_set[, 2:9])

# Fitting Logistic Regression to the Training Set
classifier = glm(formula = Label ~ ., 
                 family = binomial,
                 data = training_set)

# Predicting Test set results using classifier
prob_pred = predict(classifier, type = 'response', newdata = validation_set[-1])

# results -----horrible
y_pred = round(prob_pred)
y_pred = as.vector(y_pred)
response = (validation_set[1] == y_pred)
summary(response)

