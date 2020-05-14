#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Final_Exam_Problem_3 
#  Purpose    : Use the c5.0 methodology to develop a classification model for the Admission_cat dataset using the gre, 
#               the gpa and the rank variables as predictors. Use 30% of the records to create the test dataset and score the test dataset. 
#               What is the accuracy of your model?
#  First Name : Sanam
#  Last Name  : Jena
#  Id			    : 10454295
#  Date       : May-13-2020
#  Comments   : 
#################################################

rm(list=ls())

#################### Install Packages #############################
#install.packages("C50")
library(C50)

#################### Reading the data #############################
file_name <- file.choose()
Admission_cat<- read.csv(file_name, na.strings="?")
View(Admission_cat)

#################### Changing to the factor #############################
Admission_cat$ADMIT <- factor(Admission_cat$ADMIT, levels = c(0,1),labels = c("NOT_ADMIT" , "ADMIT"))
is.factor(Admission_cat$ADMIT)

#################### Deleting the rows with missing values #############################
Admission_cat <- na.omit(Admission_cat)
Admission_cat
summary(Admission_cat)

#################### Removing Applicant COlumn #############################
Admission_cat1 <- Admission_cat[,-1]

#################### Loading 70% Admission record in training dataset #############################
set.seed(100)
idx<-sort(sample(nrow(Admission_cat1),as.integer(.70*nrow(Admission_cat1))))
training<-Admission_cat1[idx,]

#################### Loading 30% Admission in test dataset #############################
test <- Admission_cat1[-idx, ]
dev.off()

#################### Preparing & Plotting Model #############################
model <- C5.0(ADMIT~. , data = training)
summary(model)
plot(model)

#################### Calculating & Printing Prediction Rate #############################
prediction<-predict(model,test,type="class") 
table(actual=test[,1],prediction)
str(prediction)

wrong<-sum(test[,1]!=prediction)
error_rate<-wrong/length(test[,1])
error_rate * 100

success_rate <- 1 - error_rate
success_rate * 100