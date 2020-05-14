#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Homework 8_1 
#  Purpose    : Using hclust, categorize the "wisc_bc_ContinuousVar.csv" data into two (2) clusters based on. 
#               All the features except the diagnosis column. Tabulate the clustered rows against the "diagnosis" column. 
#               (Remove the rows with missing values first)
#  First Name : Sanam
#  Last Name  : Jena
#  Id			    : 10454295
#  Date       : April-28-2020
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
summary(Breast_Cancer)
table(Breast_Cancer$diagnosis)

#################### Applying hclust & Plotting #############################
Breast_Cancer <- Breast_Cancer[-1]
cancerdist <- dist(Breast_Cancer[,-1])
hclustres <- hclust(cancerdist)
plot(hclustres)
hclust2 <- cutree(hclustres,2)
table(hclust2, Breast_Cancer[,1])