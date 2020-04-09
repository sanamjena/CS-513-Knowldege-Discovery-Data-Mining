#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Mid-Term Question 2
#  Purpose    : Perform EDA Analysis
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

#################### Calulating min, max and mean for each column  ############################# 

summary(COVID19)

###################  Identifying missing values  ##############################

length(COVID19)
nrow(COVID19)

missing_values <- sum(is.na(COVID19))
missing_values
colSums(is.na(COVID19))
which(is.na(COVID19$Age))
which(is.na(COVID19$MonthAtHospital))

###################  Displaying the frequency table of "Infected" vs. "MaritalStatus"   ##############################

ftable(Infected=COVID19$Infected,MaritalStatus=COVID19$MaritalStatus)

###################  Displaying the scatter plot of "Age", "MaritalStatus" and "MonthAtHospital", one pair at a time   ##############################

keeps <- c("Age", "MaritalStatus" , "MonthAtHospital")
#COVID19_scatter[keeps]
pairs(COVID19[keeps][1:3])

Status<-factor(COVID19$MaritalStatus,levels=(c("Single","Married","Divorced")))  #level changed
plot(COVID19$Age , Status , main = "1. Single 2. Married 3. Divorced" , xlab ="x-axis-Age",ylab ="y-axis-Marital status")
plot(COVID19$MonthAtHospital, Status, main = "1. Single 2. Married 3. Divorced" , xlab ="x-axis-MonthsAtHospital",ylab ="y-axis-Marital status")
plot(COVID19$MonthAtHospital,COVID19$Age, main = "MonthHospital vs Age" , xlab ="x-axis-MonthsAtHospital",ylab ="y-axis-age")

###################  Show box plots for columns:  "Age", "MaritalStatus" and "MonthAtHospital"   ##############################

boxplot(COVID19$Age , COVID19$MaritalStatus , COVID19$MonthAtHospital , names = c("Age" , "MaritalStatus" , "MonthAtHospital"))

###################  Replacing the missing values of "Cases" with the "mean" of "Cases"  ##############################

missing_values_cases <- sum(is.na(COVID19$Cases))
missing_values_cases
#There are 0 missing values in the cases column, I am writing the code to replace the missing values in case the data is being updated with some missing values for the purpose of evaluation of the code
COVID19$Cases[is.na(COVID19$Cases)] <- mean(COVID19$Cases, na.rm = TRUE)


