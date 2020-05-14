#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Homework 7 
#  Purpose    : Use the ANN methodology with five (5) nodes in the hidden layer, to develop a classification model for the Diagnosis.
#  First Name : Sanam
#  Last Name  : Jena
#  Id			    : 10454295
#  Date       : April-28-2020
#  Comments   : 
#################################################

rm(list=ls())

#################### Install Packages #############################
library(neuralnet)

#################### Reading the data #############################
file_name <- file.choose()
Breast_Cancer<- read.csv(file_name, na.strings="?")
View(Breast_Cancer)
Breast_Cancer<-data.frame(lapply(Breast_Cancer[,-1],as.numeric))

#################### Normalizing the data #############################
df <- as.data.frame(apply(Breast_Cancer[,1:ncol(Breast_Cancer)],2,function(x) (x - min(x))/(max(x)-min(x))))

#################### Categorize the data #############################
index <- seq (1,nrow(df),by=5)
test<- df[index,]
train<-df[-index,]

#################### Applying ANN & Plotting #############################
model<- neuralnet( diagnosis~. ,train, hidden=5, exclude = NULL,threshold=0.01)
plot(model)

#################### Calculating & Printing Prediction Rate #############################
prediction <-predict(model , test)
print(prediction)
pred_cat <- ifelse(prediction<0.5,0,1)
table(Actual = test$diagnosis, Prediction = pred_cat)

wrong<- (test$diagnosis!=pred_cat)
error_rate<-sum(wrong)/length(wrong)
error_rate

successrate <- 1 - error_rate
successrate
