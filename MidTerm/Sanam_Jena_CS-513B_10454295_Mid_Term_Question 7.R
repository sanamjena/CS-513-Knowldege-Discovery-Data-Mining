#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Mid-Term Question 7
#  Purpose    : Use unweighted knn(k=5) to  predict infection rate (infected) for a random sample (30%) of the data (test dataset).
#  First Name : Sanam
#  Last Name  : Jena
#  Id			    : 10454295
#  Date       : March-29-2020
#  Comments   : 
#################################################

rm(list=ls())

#################### Reading the data #############################

file_name <- file.choose()
COVID19<- read.csv(file_name, na.strings = "?", colClasses=c("Infected"="factor" ))
is.factor(COVID19$Infected)
View(COVID19)

#################### Deleting the rows with missing values #############################
COVID19 <- na.omit(COVID19)
View(COVID19)

#################### Applying KNN #############################
index<-sort(sample(nrow( COVID19),round(.30*nrow(COVID19 ))))
training<- COVID19[-index,]
test<- COVID19[index,]

library(kknn) 
predict_k1 <- kknn(formula= Infected~., training[,c(-1)] , test[,c(-1)], k=5,kernel ="rectangular"  )

fit <- fitted(predict_k1)
table(test$Infected,fit)

wrong<- ( test$Infected!=fit)
rate<-sum(wrong)/length(wrong)
rate