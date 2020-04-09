rm(list=ls())


traininginput <- runif(50, min = 0, max = 100)
view(traininginput)
print(traininginput)

trainingoutput <- 

trainingdata <- cbind(traininginput, training)
install.packages('neuralnet')
library(neuralnet)

net.sqrt <- neuralnet(output~Input, trainingdata, hidden =10, threshold = 0.01)
print(net.sqrt)


str()


print(cleanoutput)