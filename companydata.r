data<- read.csv(file.choose())
data$category[data$Sales>5]<- "High"
data$category[data$Sales<=5]<- "Low"
data$category<-factor(data$category)
View(data)

data_train<- data[1:300,]
data_test<- data[301:400,]

prop.table(table(data_train$category))
prop.table(table(data_test$category))
prop.table(table(data$category))

library(randomForest)
data_forest<- randomForest(category~., data=data_train, importance=TRUE)
plot(data_forest)
varImpPlot(data_forest)
