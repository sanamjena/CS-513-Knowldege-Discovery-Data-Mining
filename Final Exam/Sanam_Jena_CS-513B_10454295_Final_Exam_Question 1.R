#################################################
#  Company    : Stevens Institute of Technology
#  Project    : CS-513 B_Final_Exam_Problem_1 
#  Purpose    : .	Use the kmeans clustering method to create two clusters for the Admission dataset using gre and gpa as clustering variables. 
#               Tabulate the clustered rows against the "ADMIT" column.
#               .	Use the hierarchical clustering method to create two clusters for the Admission dataset using gre and gpa as clustering variables. 
#               Tabulate the clustered rows against the "ADMIT" column.
#  First Name : Sanam
#  Last Name  : Jena
#  Id			    : 10454295
#  Date       : May-13-2020
#  Comments   : 
#################################################

rm(list=ls())

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

#################### Applying kmeans & Tabulating #############################
kmeanss<- kmeans(Admission_cat1[,c(2,3)],2,nstart = 10)
kmeanss$cluster
table(kmeanss$cluster,Admission_cat1[,1])

#################### Applying hclust & Tabulating #############################
Admission_cat_dist<-dist(Admission_cat1[,c(2,3)])
hclust_res<-hclust(Admission_cat_dist)
plot(hclust_res)
hclustt<-cutree(hclust_res,2)
table(hclust = hclustt,Admission_cat1[,1])