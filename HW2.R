# Get quantmod
if (!require("quantmod")) {
  install.packages("quantmod")
  library(quantmod)
}

start = as.Date("2020-02-01")
end = as.Date("2020-06-01")
getSymbols(c("AAPL", "MSFT", "GOOG"), src = "yahoo", from = start, to = end)

head(AAPL)
head(MSFT)
head(GOOG)
plot(AAPL[, "AAPL.Close"], main = "AAPL")
plot(MSFT[, "MSFT.Close"], main = "MSFT")
plot(GOOG[, "GOOG.Close"], main = "GOOG")

d1 <- read.csv(file="national_history.csv", header = TRUE)
d1 <- national_history
head(d1, 6)

library(ggplot2)
plot(national_history$positiveIncrease,national_history$totalTestResults,xlab = 'Positve Increase',ylab = 'Total Test Results', main = 'Positive Cases')
ggplot(national_history)

library(superheat)
superheat(M, scale = TRUE)

