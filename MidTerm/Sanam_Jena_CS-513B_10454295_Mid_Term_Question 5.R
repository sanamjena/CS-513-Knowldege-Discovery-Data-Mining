#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Mid-Term Question 5
#  Purpose    : Construct a Naïve Bayes model to classify infection ("infected') based on the other variables
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


library(arules)  #used to discretize values
library(e1071) #for Naive Bayes
library(class)

table(class=COVID19$Age,Infected=COVID19$Infected)
prop.table(table(Class=COVID19$Age,Infected=COVID19$Infected)) 

table(class=COVID19$MonthAtHospital,Infected=COVID19$Infected)
prop.table(table(Class=COVID19$MonthAtHospital,Infected=COVID19$Infected)) 

#################### training data set #############################
idx <- sample(nrow(COVID19), as.integer(.7*nrow(COVID19)))

training <- COVID19[idx,]
View(training)

#################### test data set #############################
test <- COVID19[-idx,]
View(test)

#################### Naive Bayes classification #############################
nBayes_class <- naiveBayes(Infected ~ ., data = training)
category_class <- predict(nBayes_class, test)

table(nBayes_class=category_class, class = test$Infected)

prop.table(table(nBayes_class=category_class, class = test$Infected))

#################### Error in predicting the results #############################
errorPredictions <- sum(category_class != test$Infected)
errorPredictions

#################### Rate of error in predicting the results #############################
errorPredictionsRate <- errorPredictions/length(category_class)
errorPredictionsRate

#################### Rate of accuracy in predicting the results #############################
accuracy_rate <- 1 - errorPredictionsRate
accuracy_rate

str(nBayes_class)
nBayes_class[[1]]
nBayes_class[[2]]
nBayes_class[[3]]
nBayes_class[[4]]
nBayes_class[[5]]
