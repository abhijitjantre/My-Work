library(datasets)
data(swiss); 
require(stats); 
require(graphics)
pairs(swiss, panel = panel.smooth, main = "Swiss data", col = 3 + (swiss$Catholic > 50))
attach(swiss)
summary(lm(Education~.,data=swiss))
summary(lm(Education~.,data=swiss))$coefficients
summary(lm(Education~Agriculture,data=swiss))$coefficients
summary(lm(Education~Fertility,data=swiss))$coefficients

n <- 100
x2 <- 1:n
x1 <- 0.01*x2+runif(n, -.1, .1)
y <- -x1+x2+rnorm(n,sd=0.01)
summary(lm(y~x1))$coef
summary(lm(y~x1+x2))$coef
par(mfrow=c(1,2))
plot(x1, y, pch=21,col="black",bg=topo.colors(n)[x2], frame = FALSE, cex = 1.5)
title('Unadjusted, color is X2')
abline(lm(y ~ x1), lwd = 2)
plot(resid(lm(x1 ~ x2)), resid(lm(y ~ x2)), pch = 21, col = "black", bg = "lightblue", frame = FALSE, cex = 1.5)
title('Adjusted')
abline(0, coef(lm(y ~ x1 + x2))[2], lwd = 2)

