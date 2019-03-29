#importing dataset
dataset = read.csv("sd_training_data.csv")

# cleaning
dataset = dataset[,-1]

# Splitting the training_set into the Training set and Validation set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
validation_set = subset(dataset, split == FALSE)


# Fitting K-NN to the Training set and Predicting the Test set results
library(class)
y_pred = knn(train = training_set[, -1],
             test = validation_set[, -1],
             cl = training_set[, 1],
             k = 5,
             prob = TRUE)

# Evaluating Preformance # 66% with KNN
y_act = as.factor(validation_set[, 1])
response = (y_act == y_pred)
summary(response)

# # Lets Try LDA with this model:
# 
# # Applying LDA
# library(MASS)
# lda = lda(formula = Label ~ ., data = training_set)
# training_set = as.data.frame(predict(lda, training_set))
# training_set = training_set[c(25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,1)]
# validation_set = as.data.frame(predict(lda, validation_set))
# validation_set = validation_set[c(25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,1)]
# 
# # Fitting K-NN to the LD Sets
# library(class)
# y_pred = knn(train = training_set[, -16],
#              test = validation_set[, -16],
#              cl = training_set[, 16],
#              k = 25,
#              prob = TRUE)
# 
# # Evaluating Preformance 
# y_act = as.factor(validation_set[, 16])
# response = (y_act == y_pred)
# summary(response)

## This model seems good enough, so lets import the test data and get our results:
# importing test data
test_data = read.csv("sd_testing_data.csv")
test_data = test_data[5:55]

# # Applying LDA to entire dataset
# library(MASS)
# lda = lda(formula = Label ~ ., data = dataset)
# dataset = as.data.frame(predict(lda, dataset))
# dataset = dataset[c(25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,1)]
# test_data = as.data.frame(predict(lda, test_data))
# test_data = test_data[c(25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,1)]

# Fitting K-NN to the Test Set
library(class)
y_pred = knn(train = training_set[, -1],
             test = test_data[, 5:55],
             cl = training_set[, 1],
             k = 17,
             prob = TRUE)

# # Getting Label vector
# y_test = as.factor(test_data[, 4])

# Attaching results to Challenge.csv
challenge = read.csv("challenge.csv")
challenge = challenge[1:2]
challenge = cbind(challenge, y_pred)
colnames(challenge) <- c("Subject", "Datafile", "Label")

write.csv(challenge, file = "challenge_final_2.csv")
