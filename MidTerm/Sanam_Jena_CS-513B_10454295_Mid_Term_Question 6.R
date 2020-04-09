#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Mid-Term Question 6
#  Purpose    : Construct a CART model to classify infection ("infected') based on the other variable
#  First Name : Sanam
#  Last Name  : Jena
#  Id			    : 10454295
#  Date       : March-29-2020
#  Comments   : 
#################################################

rm(list=ls())

#################### Reading the data #############################

file_name <- file.choose()
COVID19<- read.csv(file_name, na.strings="?")
View(COVID19)

#################### Deleting the rows with missing values #############################
COVID19 <- na.omit(COVID19)
View(COVID19)

#################### Changing to the factor #############################

COVID19$MonthAtHospital[ COVID19$MonthAtHospital < 6 ] <- 4
COVID19$MonthAtHospital[ COVID19$MonthAtHospital >= 6 ] <- 8
COVID19$MonthAtHospital <- factor(COVID19$MonthAtHospital, levels = c(4,8),labels = c("less than 6 months", "6 or more months"))

COVID19$Age[ COVID19$Age < 35 ] <- 1001
COVID19$Age[ COVID19$Age <= 50 ] <- 2001
COVID19$Age[ COVID19$Age < 1000 ] <- 3001
COVID19$Age <- factor(COVID19$Age, levels = c(1001,2001,3001),labels = c("less than 35", "35 to 50", "51 and over"))

library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle

#################### training data set #############################
index<-sort(sample(nrow(COVID19),round(.25*nrow(COVID19))))
training<-COVID19[-index,]

#################### test data set #############################
test<-COVID19[index,]

CART_class<-rpart( Infected~.,data=training)
rpart.plot(CART_class)
CART_predict2<-predict(CART_class,test, type="class") 
table(Actual=test[,7],CART=CART_predict2)
CART_predict<-predict(CART_class,test)

CART_predict_cat<-ifelse(CART_predict[,1]<=.5,'Yes','No')

table(Actual=test[,7],CART=CART_predict_cat)
CART_wrong<-sum(test[,7]!=CART_predict_cat)
CART_error_rate<-CART_wrong/length(test[,7])
CART_error_rate
CART_predict2<-predict(CART_class,test, type="class")

#################### Error in predicting the results #############################
CART_wrong2<-sum(test[,7]!=CART_predict2)

#################### Rate of error in predicting the results #############################
CART_error_rate2<-CART_wrong2/length(test[,7])
CART_error_rate2 

#################### Rate of accuracy in predicting the results #############################
accuract_rate <- 1-CART_error_rate2 
accuract_rate

fancyRpartPlot(CART_class)
