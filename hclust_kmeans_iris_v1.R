#  First Name      : Khasha
#  Last Name       : Dehnad
#  Id              : 12345
#  purpose         : performing cluster analysis on IRIS dataset


rm(list=ls())
data(iris)
View(iris)

?hclust
?dist
?cutree

iris_dist<-dist(iris[,-5])
hclust_resutls<-hclust(iris_dist)
plot(hclust_resutls)
hclust_3<-cutree(hclust_resutls,3)
table(hclust_3,iris[,5])


?kmeans

kmeans_3<- kmeans(iris[,-5],3,nstart = 10)
kmeans_3$cluster
table(kmeans_3$cluster,iris[,5])


