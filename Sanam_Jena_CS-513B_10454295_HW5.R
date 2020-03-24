#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Homework 5 
#  Purpose    : Use the CART methodology to develop a classification model for the Diagnosis
#  First Name : Sanam
#  Last Name  : Jena
#  Id			    : 10454295
#  Date       : March-24-2019
#  Comments   : 
#################################################

rm(list=ls())

#################### Install Packages #############################
library(rpart)
library(rpart.plot)  		
library(rattle)          
library(RColorBrewer) 

#################### Reading the data #############################
file_name <- file.choose()
Breast_Cancer<- read.csv(file_name, na.strings="?")
View(Breast_Cancer)

#################### Changing to the factor #############################
Breast_Cancer$Class <- factor(Breast_Cancer$Class, levels = c(2,4),labels = c("Benign", "Malignant"))

is.factor(Breast_Cancer$Class)

#################### Loading 70% Breast cancer record in training dataset #############################
idx<-sort(sample(nrow(Breast_Cancer),as.integer(.70*nrow(Breast_Cancer))))
training<-Breast_Cancer[idx,]

#################### Loading 30% Breast cancer in test dataset #############################
test <- Breast_Cancer[-idx, ]

dev.off()

#################### Preparing & Plotting Model #############################
model<-rpart(Class~.,training[,-1])
rpart.plot(model)

#################### Calculating & Printing Prediction Rate #############################
prediction<-predict(model,test[,-1],type="class") 
table(test[,11],prediction)
str(prediction)
wrong<-sum(test[,11]!=prediction)
error_rate<-wrong/length(test[,11])
error_rate

#################### Plotting Model using fancyRpartPlot #############################
prp(model)
fancyRpartPlot(model)