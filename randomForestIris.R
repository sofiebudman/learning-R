library(randomForest)
library(caret) #used for ml a lot
#https://www.r-bloggers.com/2021/04/random-forest-in-r/
dataset <- iris 
head(dataset)
dataset$Species <- as.factor(dataset$Species)
str(dataset)
#since species is what we are classifying it should be a factor varaible

#data splitting
set.seed(22)
trainTestSplit <- sample(2,nrow(dataset), replace = TRUE, prob = c(0.7,0.3))
train <- dataset[trainTestSplit == 1,]
test <- dataset[trainTestSplit == 2,]
head(train)
head(test)

#random forest
rf <- randomForest(Species~., data= train, proximity = TRUE)
rf
#error rate of 5.61, prettty good

#prediction and confusion matrix of the train data
p1 <- predict(rf,train)
confusionMatrix(p1,train$Species)

#prediction and confusion matrix on test data
p2 <- predict(rf,test)
confusionMatrix(p2,test$Species)

#error rates with a grpah
plot(rf)