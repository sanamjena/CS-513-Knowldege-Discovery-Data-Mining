x<-25
hello <-"Hello WOrld"
print(hello)
hello
print("How are you")
help.start()

x <-c(1,2,2,NA,5,10)
x
min(x,na.rm = TRUE)
max(x,na.rm = TRUE)
mean(x,na.rm = TRUE)
y <- mean(x,na.rm = TRUE)
y

?is.vector(hello)

?min()

summary(x)

length(hello)
nchar(hello)

ls()

rm("x")


x1 <-c(10,5,6,6,6,7)
x1
mode(x1)
x2<-c(1,2,3)
x2

x3 <-x1+x2
x1
x2
x3

?seq()
x3<-seq(from=10.2,to=26.5,by=2.1)
mode(x3)
typeof(x3)

x4<-c(1,2,3,4,5,6)
mode(x4)
typeof(x4)

x5<-seq(from=1, to=6, by=1)
typeof(x5)

x6<-1:6
typeof(x6)

x7<-as.integer(x5)
typeof(x7)

x5<-seq(from=1, to=6, by=1)
x6<-c('a','b',c)


mixed_vector<-c(1,2,8.6,'5')
mode(mixed_vector)
typeof(mixed_vector)

rm(list = ls())


myfirstname<-"Sanam"
myfirstname
mylastname<-"Jena"
mylastname

myname<-c(myfirstname,mylastname)
myname

rm(myfirstname)
myfirstname
myname

avector<-c(1,2,3,4)
avector

names(avector)<-c("one","two","three","four")
avector

typeof(avector)
elementnames<-names(avector)

?factor()

cat<-c("good","bad","good","bad","bad","good")

typeof(cat)
cat2<-factor(cat)
cat2
typeof(cat2)

cat3<-factor(cat,levels = (c("good","bad")))
cat3


days<-c("Monday","Tuesday","wednesday","Thursday","Saturday","Sunday")
days
days_factor<-factor(days)
days_factor

days_factor<-factor(days,levels=(c("Monday","Tuesday","wednesday","Thursday","Saturday")))


my.lst <- list(stud.id = 10454395, stud.name = c("Sanam", "Jena"), stud.marks=c(12.3,12,15,19))

is.list(my.lst)
mode(my.lst)
typeof(my.lst)
length(my.lst)

my.lst2 <- list(seq=1:10, my.lst)
length(my.lst2)

my.dataset <- data.frame(site=c('A','B','C','D','E'), ph = c(7.4,6.3,8.6,7.2,8.9))
is.list(my.dataset)
is.data.frame(my.dataset)
is.matrix(my.dataset)
typeof(my.dataset)
length(my.dataset)
nrow(my.dataset)
View(my.dataset)

data()

data("iris")

View(iris)

length(iris)

nrow(iris)

is.data.frame(iris)

?read.csv()


name <- file.choose()

subset4 <- iris[c(T,F,F,F),]

data("iris")
length(iris)
nrow(iris)
View(iris)
iris_missing<-iris
iris_missing[c(3,30,80),3] <- NA

View(iris_missing)

?boxplot()
boxplot(iris[1:3])
?hist()
hist(iris$Sepal.Length)
?pairs()
pairs(iris[1:2])

pairs(iris[1:4])
pairs(iris[1:4], main = "Iris Data", pch = 10 )

pairs(iris[1:4], main = "Anderrson's Iris Data -- 3 Species", pch = 21, bg = c("red", "green3", "blue")[factor(iris$Species)])
?plot
plot(iris[,1:2])


iris_missing<-iris
iris_missing[c(3,30,40),3]<-NA
?na.omit
iris_No_missing<-na.omit(iris_missing)

dev.off()

x<-c(1,2,6,6,6,7,7,7)
unique.x <- unique(x)

?match()
?tabulate()
tab <- tabulate(match(x,unique.x))
unique.x[tab == max(tab)]

mfv <- function(x){
  unique.x <- unique(x)
  tab <- tabulate(match(x, unique.x))
  unique.x[tab == max(tab)]
}

mfv.x <-mfv(x)
is.vector(mfv.x)

is.na(iris_missing$Petal.Length)
iris_missing[is.na(iris_missing$Petal.Length), "Petal.Length"]<- 2.2

iris_missing<-iris
iris_missing[c(3,30,80),3] <- NA

#install.packages('VIM)
library('VIM')

#Applying KNN on IRIS

rm(list = ls())
?install.packages

installed.packages()

install.packages("kknn")


library(kknn)
?kknn()

data(iris)
View(iris)

?sampllee()
range_1_100 <- 1:100
sample(range_1_100,80)

install.packages("VIM")
library('VIM')
?KNN()

iris_No_missing2 <- KNN(iris_No_missing, variable = 'Petal.Lenth')

