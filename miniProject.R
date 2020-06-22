library(caret)
data(iris)
dataset <- iris
filename <- "iris.csv"
colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
validation <- dataset[-validation_index,]
dataset <- dataset[validation_index,]
dim(dataset)
sapply(dataset, class)
head(dataset)
levels(dataset$Species)
percentage <- prop.table(table(dataset$Species)) * 100
cbind(freq=table(dataset$Species), percentage=percentage)
summary(dataset)
x <- dataset[,1:4]
y <- dataset[,5]
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)
oxygen <- read.csv("J:/input.csv")
predictions <- predict(fit.lda, oxygen)
