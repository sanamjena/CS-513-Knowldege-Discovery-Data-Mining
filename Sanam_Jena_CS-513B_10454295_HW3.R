#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Homework 2 
#  Purpose    : Use the knn methodology to develop a classification model for the Diagnosis
#  First Name : Sanam
#  Last Name  : Jena
#  Id			    : 10454295
#  Date       : March-10-2019
#  Comments   : 
#################################################

rm(list=ls())

#################### Reading the data #############################
file_name <- file.choose()
Breast_Cancer<- read.csv(file_name, na.strings="?")
View(Breast_Cancer)

#################### Deleting the rows with missing values #############################
Breast_Cancer <- na.omit(Breast_Cancer)
Breast_Cancer

#################### Changing to the factor #############################
Breast_Cancer$Class <-factor(Breast_Cancer$Class,levels = c(2,4), labels = c("benign","malignant"))
is.factor(Breast_Cancer$Class)

#################### Applying KNN #############################
library(kknn)
?kknn

round(prop.table(table(Breast_Cancer$Class)) * 100,digits = 1)
normalize <- function(x) {
  return ((x - min(x))/(max(x) - min(x)))
}
cancer_n <- as.data.frame(lapply(Breast_Cancer[1:9], normalize))
cols <-colnames(cancer_n)
cancer_n[cols] <- lapply(cancer_n[cols],factor)

train <- sample(nrow(cancer_n), size = floor(.70*nrow(cancer_n)), replace = F) 

cancer_train <- cancer_n[train,]
cancer_test <-  cancer_n[-train,]

cancer_train_labels <- Breast_Cancer[train,10]
cancer_test_labels <- Breast_Cancer[-train,10]

#install.packages("class")
library(class)

cancer_test_pred_3 <- knn(train = cancer_train, test = cancer_test, cl = cancer_train_labels, k = 3)
cancer_test_pred_5 <- knn(train = cancer_train, test = cancer_test, cl = cancer_train_labels, k = 5)
cancer_test_pred_10 <- knn(train = cancer_train, test = cancer_test, cl = cancer_train_labels, k = 10)

#install.packages("gmodels")
library(gmodels)

CrossTable(x = cancer_test_labels, y = cancer_test_pred_3, prop.chisq = FALSE)
CrossTable(x = cancer_test_labels, y = cancer_test_pred_5, prop.chisq = FALSE)
CrossTable(x = cancer_test_labels, y = cancer_test_pred_10, prop.chisq = FALSE)
## Using k=3 is the best way here. Because of ease to prepare model.
