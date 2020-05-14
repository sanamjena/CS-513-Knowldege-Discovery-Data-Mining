rm(list=ls())
data(iris)
View(iris)

#create test & Training dataset
index <- seq (1,nrow(iris), by= 5)
test <- iris[index,]
training <- iris[-index,]

library(e1071)
?svm

##svm
svm.model <- svm(Species~ ., data = training)
svm.pred <- predict(svm.model, test)

table(actual=test[,5],svm.pred)
svm_wrong <- (test$species != svm.pred)
rate <- sum(svm_wrong)/length(svm_wrong)