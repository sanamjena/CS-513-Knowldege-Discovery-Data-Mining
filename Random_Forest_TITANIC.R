rm(list=ls())

?tuneRF
file <- file.choose()
dsn <- read.csv(file)

#install.packages('randomForest')

library(randomForest)

?read.csv
set.seed(2201)
dsn2 <- na.omit(dsn)
set.seed(111)
?ifelse

idx<-seq(1,nrow(dsn2),5)
#idx

training<-dsn2[-idx,]
#training
test<-dsn2[idx,]
#test

index <-sort(sample(nrow(dsn2), round(.30*nrow(dsn2))))
training <-dsn2[-index,]
test <-dsn2[index,]
summary(training)
View(training)


fit <- randomForest(Survived~., data=training, importance=TRUE, ntree=1000)
importance(fit)
varImpPlot(fit)
Prediction <- predict(fit, test)
table(actual=test[,4],Prediction)


wrong<- (test[,4]!=Prediction)
error_rate <- sum(wrong)/length(wrong)
error_rate *100