pm25=read.csv("D:/pm25.csv")
library(forecast)
ptime <- ts(pm25, frequency=12, start=c(2007,1))
fit <- auto.arima(ptime)
tsdiag(fit)
lines(fit$x,col="red")
lines(fitted(fit),col="green")
legend("topright",lty=1,col=c(2,3,4),
       legend=c("observed","fit","forecast"))
summary(fit)
Box.test(fit$residuals,lag=1)