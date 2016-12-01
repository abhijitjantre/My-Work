library(ISLR)
library(caret)
data(Wage)
inTrain <- createDataPartition(y=Wage$wage,p=0.7,list=FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]
dim(training)
dim(testing)
table(training$jobclass)
dummies <- dummyVars(wage~jobclass,data=training)
head(predict(dummies,newdata=training))
nsv <- nearZeroVar(training,saveMetrics = TRUE)
nsv
library(splines)
bsBasis <- bs(training$age,df=3)
bsBasis
lm1 <- lm(wage~bsBasis,data=training)
plot(training$age,training$wage,pch=19,cex=0.4,col="blue")
points(training$age,predict(lm1,newdata=training),col="red",pch=19,cex=0.5)
predict(bsBasis,age=testing$age)
points(testing$age,predict(lm1,newdata=testing),col="red",pch=19,cex=0.5)
