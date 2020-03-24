#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Homework 4 
#  Purpose    : Use the Naïve Bayes methodology to develop a classification model for the Diagnosis
#  First Name : Sanam
#  Last Name  : Jena
#  Id			    : 10454295
#  Date       : March-24-2019
#  Comments   : 
#################################################

rm(list=ls())

#################### Install Packages #############################
#install.packages("e1071")
#install.packages(class)
library(e1071)
library(class)

#################### Reading the data #############################
file_name <- file.choose()
Breast_Cancer<- read.csv(file_name, na.strings="?")
View(Breast_Cancer)

#################### Deleting the rows with missing values #############################
Breast_Cancer <- na.omit(Breast_Cancer)
Breast_Cancer
Breast_Cancer$F6<-as.integer(Breast_Cancer$F6)

#################### Changing to the factor #############################
Breast_Cancer$Class <-factor(Breast_Cancer$Class,levels = c(2,4), labels = c("benign","malignant"))
is.factor(Breast_Cancer$Class)

#################### Structure of Breast Cancer Dataset #############################
str(Breast_Cancer)

newData<- Breast_Cancer[2:11]

smp_size <- floor(0.70 * nrow(newData))

set.seed(123)
train_ind <- sample(seq_len(nrow(newData)), size = smp_size)

#################### Loading 70% Breast cancer record in training dataset #############################
training <- newData[train_ind, ]

#################### Loading 30% Breast cancer in test dataset #############################
test <- newData[-train_ind, ]

#################### Implementing NaiveBayes #############################
model_naive<- naiveBayes(Class ~ ., data = training)

#################### Predicting target class for the Validation set #############################
predict_naive <- predict(model_naive, test)

table(model_naive=predict_naive,class=test$Class)

#################### prop table #############################
prop.table(table(model_naive=predict_naive,class=test$Class))

#################### Error in perdiction of the result #############################
wrong_prediction<-sum(predict_naive!=test$Class)

#################### Error Rate #############################
wrong_prediction_rate<-wrong_prediction/length(predict_naive)

#################### Output #############################
print(paste("Total number of wrong Predictions:" , wrong_prediction))
print(paste("Error Rate:" , wrong_prediction_rate))
print(paste("Accuracy:" , 100-(wrong_prediction_rate*100)))
