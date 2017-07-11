library(randomForest)
library(mice)

data3 <- read.csv(file="F:/Downloads/Data science using R/DA@ibhubs/av_loan_sum/train_Data.csv")
data3 <- data3[-1]

head(data3)
dim(data3)

anyNA(data3)

data3 <- knnImputation(data3)
anyNA(data3)

data4 <- read.csv(file="F:/Downloads/Data science using R/DA@ibhubs/av_loan_sum/test_Data.csv")
data4 <- data4[-1]
head(data4)
dim(data4)
anyNA(data4)

sapply(data4, unique)
sapply(data4, class)

data4 
colnames(data4)
colMeans(is.na(data4))
aggr(data4)
missmap(data4)
anyNA(data4)

data4 <- knnImputation(data4)
anyNA(data4)

missmap(data4)

modelFit <- train(Loan_Status~., data=data3, method="rf") 
modelFit

predicted<- predict(modelFit,newdata=data4)
predicted

write.csv(predicted, file = "F:/Downloads/Data science using R/DA@ibhubs/av_loan_sum/ksmoutputrf.csv")


