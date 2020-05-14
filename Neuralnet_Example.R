rm(list=ls())


traininginput <- runif(50, min = 0, max = 100)
view(traininginput)
print(traininginput)

trainingoutput <- sqrt(traininginput)

trainingdata <- cbind(traininginput, trainingoutput)
trainingdata[1:20,]

colnames(trainingdata) <- c("Input" , "Output")
#install.packages("neuralnet")
library("neuralnet")

net.sqrt <- neuralnet(Output~Input, trainingdata, hidden =10, threshold = 0.01)
print(net.sqrt)

#Plot the neural Network
plot(net.sqrt)

#Test the neural network on some training data
testdata <- as.data.frame((1:10)^2) #Generate some squared numbers
net.results <- compute(net.sqrt, testdata)

str(net.results)
cleanoutput <- cbind(testdata,sqrt(testdata) , 
                     as.data.frame(net.results$net.result))
colnames(cleanoutput) <- c("Input","Expected Output", "Neural Net Output")


print(cleanoutput)