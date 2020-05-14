rm(list=ls())
data(iris)
View(iris)

#install.packages("kohonen")


library("kohonen")
?som()
example(som)

dev.off()

training<- iris[,-5]
iris_som <- som(as.matrix(training), grid = somgrid(3,1))

summary(iris_som)
str(iris_som)
iris_som$unit.classif

length(iris_som$unit.classif)
length(iris[,5])

table(cluster = iris_som$unit.classif, iris[,5])