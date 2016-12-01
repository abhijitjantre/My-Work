library(caret)
library(kernlab)
data(spam)
inTrain <- createDataPartition(y=spam$type,p=0.75,list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
a <- training$capitalAve
hist(a,xlab="Average Capital Run Length")
mean(a)
sd(a)
dim(training)
preObj <- preProcess(training[,-58],method=c("center","scale"))
a1 <- predict(preObj,training[,-58])$capitalAve
mean(a1)
sd(a1)
b1 <- testing$capitalAve
b1 <- predict(preObj,testing[,-58])$capitalAve
mean(b1)
sd(b1)
set.seed(33333)
modelFit <- train(type~.,data=training,preProcess=c("center","scale"),method="glm")
modelFit
preObj <- preProcess(training[,-58],method=c("BoxCox"))
a2 <- predict(preObj,training[,-58])$capitalAve
par(mfrow=c(1,2))
hist(a2)
qqnorm(a2)
modelFit <- train(type~.,data=training,preProcess="pca",method="glm")
confusionMatrix(testing$type,predict(modelFit,testing))
M <- abs(cor(training[,-58]))
diag(M) <- 0
which(M>0.8,arr.ind = T)
