#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Homework 6_2 
#  Purpose    : Use the Random Forest methodology to develop a classification model for the Diagnosis and identify important features.
#  First Name : Sanam
#  Last Name  : Jena
#  Id			    : 10454295
#  Date       : April-28-2020
#  Comments   : 
#################################################

rm(list=ls())

#################### Install Packages #############################
library(randomForest)

#################### Reading the data #############################
file_name <- file.choose()
Breast_Cancer<- read.csv(file_name, na.strings="?")
View(Breast_Cancer)

#################### Deleting the rows with missing values #############################
Breast_Cancer <- na.omit(Breast_Cancer)
Breast_Cancer

#################### Changing to the factor #############################
Breast_Cancer$Class <- factor(Breast_Cancer$Class, levels = c(2,4),labels = c("Benign", "Malignant"))
is.factor(Breast_Cancer$Class)

#################### Loading 70% Breast cancer record in training dataset #############################
idx<-sort(sample(nrow(Breast_Cancer),as.integer(.70*nrow(Breast_Cancer))))
training<-Breast_Cancer[idx,]

#################### Loading 30% Breast cancer in test dataset #############################
test <- Breast_Cancer[-idx, ]
dev.off()

#################### Preparing & Plotting  #############################
fit <- randomForest( Class~., data=training, importance=TRUE, ntree=1000)
importance(fit)
varImpPlot(fit)

#################### Calculating & Printing Prediction Rate #############################
prediction<- predict(fit, test)
table(actual=test[,10],prediction)
str(prediction)
wrong<-sum(test$Class!=prediction)
error_rate<-wrong/length(test[,11])
error_rate

successrate <- 1 - error_rate
successrate
