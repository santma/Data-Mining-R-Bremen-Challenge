# importing the dataset

training_data = read.csv("training_data.csv")
training_data = training_data[2:22]

# Creating Dummy Variables for Label Column
training_data$Label = as.numeric(factor(training_data$Label, 
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
                           labels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)))
# library(fastDummies)
# training_data = dummy_cols(training_data)
# training_data = training_data[-1]

# Splitting the dataset into the training set and validation set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(training_data, SplitRatio = 0.8)
training_set = subset(training_data, split == TRUE)
validation_set = subset(training_data, split == FALSE)

# Feature Scaling
training_set[2:21] = scale(training_set[2:21])
validation_set[2:21] = scale(validation_set[2:21])

# Fitting ANN to the Training set 
# install.packages("h2o")
library(h2o)
h2o.init(nthreads = -1)
classifier = h2o.deeplearning(y = 'Label',
                              training_frame = as.h2o(training_set),
                              activation = 'Rectifier',
                              hidden = c(5,5),  #average number of x vaiables and outputs
                              epochs = 100,
                              train_samples_per_iteration = -2)

# Predicting the Validation set results
prob_pred = h2o.predict(classifier, newdata = as.h2o(validation_set))
y_pred = round(prob_pred)
y_pred = as.vector(y_pred)

# results --> Terrible 
response = (validation_set[1] == y_pred)
summary(response)


h2o.shutdown

