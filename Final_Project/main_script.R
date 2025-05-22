#Chad Huntebrinker
#Use signifigance value of 0.05

library(readxl)
library(leaps)
library(psych)
library(lmtest)

excel_data <- read_excel("market_share.xlsx")


#Check for outliers for continuous predictor variables (price, and gnrpoints)
par(mfrow = c(1, 2))
boxplot(excel_data$price, xlab = "Price Boxplot", horizontal = TRUE)
boxplot(excel_data$gnrpoints, xlab = "Gross Nielson rating points Boxplot", horizontal = TRUE)
par(mfrow = c(1, 1))
#Boxplots either show only potentially one outlier.

#Check boxplot for the response variable (marketshare)
par(mfrow = c(1, 2))
boxplot(excel_data$marketshare, xlab = "Market share Boxplot", horizontal = TRUE)
hist(excel_data$marketshare, main = "Market share Histogram", xlab = "Market share (in percentage)")
par(mfrow = c(1, 1))
#No outliers for the response variable

#Multicollinearity
pairs.panels(excel_data[,-1], ellipses = FALSE, density = FALSE)
temp <- c(1, 7, 8)
cor(excel_data[,-temp])
#there is some concern with multicollinearity with discount and market share

#Check to see what are the best three subsets
mr <- regsubsets(marketshare~price + gnrpoints + discount + promotion + year,
                 data=excel_data)
sum_of_mr <- summary(mr)

#Check Cp, R^2, and BIC
sum_of_mr$cp
sum_of_mr$rsq
sum_of_mr$bic

#Model 3 is our best model
sum_of_mr$which[3,]
#Thus, we will include price, discount and promotion

#Create a model with those three variables in it
final_model <- lm(marketshare~price + discount + promotion, data = excel_data)

#Check for outliers
#Check studentized residuals against the predicted values in the model
plot(fitted(final_model), rstudent(final_model),
     col = "lightgreen", pch = 16,
     xlab = expression(hat(Y)),
     ylab = "Studentized Residuals",
     ylim = c(-5, 5), main = "(a)",
     cex.lab = 0.7, cex = 0.5)
abline(h = 0, lty = 2, lwd = 3,
       col = "darkgray")
abline(h = 3, lty = 3, lwd = 3,
       col = "darkgray")
abline(h = -3, lty = 3, lwd = 3,
       col = "darkgray")

#Cook's Distance
print("Value to use for Cook's Distance:")
pf(0.95, df1 = 3, df2 = 33)
cat("\n")
cat("\n")

cooksd <- cooks.distance(final_model)
plot(cooksd, pch = "*", cex.main = 0.7, main = "(b)",
     ylab = "Cooks distance", cex.lab = 0.7)
text(x = 1:length(cooksd) + 1, y = cooksd, labels = ifelse(cooksd > 0.5722362, names(cooksd), ""),col = "yellow")


#Homorskedasticity
plot(fitted(final_model), residuals(final_model), main = "(c)",
     xlab = expression(hat(Y)), ylab = "Residuals")
abline(h = 0, col = "gray", lwd = 2,lty = 2)

#Normality
qqnorm(residuals(final_model), main = "(d)")
qqline(residuals(final_model), col = "blue", lwd = 2)
hist(residuals(final_model), main = "(e)", xlab = "Residuals")

#Independence of error terms
plot(residuals(final_model), type = "l", col = "blue", main = "(f)", ylab = "Residuals")

#Validate the model
predict(final_model, data.frame(price = 2.179, discount = 1, promotion = 0),
        level = 0.95, interval = "prediction")
print("Actual value: 2.69")
cat("\n")

predict(final_model, data.frame(price = 2.260, discount = 0, promotion = 1),
        level = 0.95, interval = "prediction")
print("Actual value: 2.42")
cat("\n")

predict(final_model, data.frame(price = 2.248, discount = 0, promotion = 0),
        level = 0.95, interval = "prediction")
print("Actual value: 2.45")
cat("\n")

predict(final_model, data.frame(price = 2.557, discount = 1, promotion = 0),
        level = 0.95, interval = "prediction")
print("Actual value: 2.72")
cat("\n")

predict(final_model, data.frame(price = 2.336, discount = 1, promotion = 1),
        level = 0.95, interval = "prediction")
print("Actual value: 3.05")
cat("\n")

#Check p-score
p_score <- coeftest(final_model)

abs(p_score[2,4]) <= 0.05
abs(p_score[3,4]) <= 0.05
abs(p_score[4,4]) <= 0.05