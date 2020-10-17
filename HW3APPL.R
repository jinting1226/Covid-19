#

str(AAPL)

head(AAPL)

summary(AAPL)

library(VIM)

APPL_1 <- kNN(AAPL, variable = c("Open", "High", "Low", "Close"), k = 7)
summary(APPL_1)

head(APPL_1)

APPL_2 <- subset(APPL_1, select = Open:Volume)
head(APPL_2)

str(AAPL_2)

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }

AAPL_2 <- as.data.frame(lapply(AAPL_1[1:6], normalize))

AAPL_Train <- AAPL_2[1:50,]
AAPL_Test <- AAPL_2[51:56,]

AAPL_Train_Labels <- AAPL_2[1:50, 1]
AAPL_Test_Labels <- AAPL_2[51:56, 1]

library(class)
APPL_test_pred = knn(train = AAPL_Train, test = AAPL_Test, cl = AAPL_Train_Labels, k = 7)
