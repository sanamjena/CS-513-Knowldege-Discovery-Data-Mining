############################
#Course     : CS-513-A     #
#First Name : Meghana Bhat #
#Last Name  : Manikal      #
#CWID       : 10446083     #
#Homework   : Project      #
############################


rm(list=ls())

#installed.packages()

#install.packages('randomForest')
library(randomForest)
#Normalizing
library(kknn)
set.seed(123)
file_name <- file.choose()
employee_data <- read.csv("C:\\Users\\sanam\\Documents\\Desk\\CS 513 B\\dataset\\attrition_data.csv", na.strings="?")
View(employee_data)

summary(employee_data)

#employee_data<- na.omit(employee_data)



employee_data[, 1] <- as.numeric( employee_data[, 1] )
employee_data[, 2] <- as.numeric( employee_data[, 2] )
employee_data[, 3] <- as.numeric(employee_data[, 3] )
employee_data[, 4] <- as.numeric( employee_data[, 4] )



employee_data[, 5] <- as.numeric( employee_data[, 5] )
employee_data[, 6] <- as.numeric( employee_data[, 6] )
employee_data[, 7] <- as.numeric(employee_data[, 7] )
employee_data[, 8] <- as.numeric(employee_data[, 8] )
employee_data[, 9] <- as.numeric( employee_data[, 9] )
employee_data[, 10] <- as.numeric( employee_data[, 10] )
employee_data[, 11] <- as.numeric( employee_data[, 11] )
employee_data[, 12] <- as.numeric( employee_data[, 12] )
employee_data[, 13] <- as.numeric( employee_data[, 13] )
employee_data[, 14] <- as.numeric( employee_data[, 14] )

employee_data[, 15] <- as.numeric(employee_data[, 15] )
employee_data[, 16] <- as.numeric(employee_data[, 16] )
employee_data[, 17] <- as.numeric( employee_data[, 17] )
employee_data[, 18] <- as.numeric( employee_data[, 18] )
employee_data[, 19] <- as.numeric(employee_data[, 19] )
employee_data[, 20] <- as.numeric(employee_data[, 20] )


employee_data[, 21] <- as.numeric( employee_data[, 21] )
employee_data[, 22] <- as.numeric( employee_data[, 22] )
employee_data[, 23] <- as.numeric( employee_data[, 23] )
employee_data[, 24] <- as.numeric( employee_data[, 24] )
employee_data[, 25] <- as.numeric(employee_data[, 25] )
employee_data[, 26] <- as.numeric( employee_data[, 26] )
employee_data[, 27] <- as.numeric(employee_data[, 27] )

round(prop.table(table(employee_data$STATUS)) * 100,digits = 1)
normalize <- function(x) {
  return ((x - min(x))/(max(x) - min(x)))
}

employee_data_normalized <- as.data.frame(lapply(employee_data[2:27], normalize))
cols <-colnames(employee_data_normalized)
employee_data_normalized[cols] <- lapply(employee_data_normalized[cols],factor)

View(employee_data_normalized)
summary(employee_data_normalized)

warnings()
summary(employee_data)

##data is divided into training data and test data
idx <- sort(sample(nrow(employee_data_normalized), as.integer(.70*nrow(employee_data_normalized))))
training<-employee_data_normalized[idx,]
test<-employee_data_normalized[-idx,]


#employee_data_normalized <- factor(employee_data_normalized$STATUS)

?na.action()
dev.off()

fit <- randomForest(STATUS~.,data = training, importance = TRUE, ntree = 1000)

importance(fit)
varImpPlot(fit)
Predction <- predict(fit, test)
table(actual=test$Class, Predction)

wrong <- (test$Class!= Predction)
error_rate<- sum(wrong) / length(wrong)
error_rate

count <- sum(is.na(employee_data$ANNUAL_RATE))
is.na(employee_data$ANNUAL_RATE)
summary(employee_data$TERMINATION_YEAR)
S
which(is.na(employee_data$REFERRAL_SOURCE))

colnames(employee_data)[ apply(employee_data, 2, anyNA) ]

names(which(sapply(employee_data, anyNA)))

colnames(employee_data)[colSums(is.na(employee_data)) > 0]