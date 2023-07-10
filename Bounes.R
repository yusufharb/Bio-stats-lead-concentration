#### Calculate and interpret a 95% confidence interval of the regression slope

load("E.RData")
head(lead)
names(lead)

# Fit a linear regression model
model <- lm(Ld73 ~ Age, data = lead)

# Extract the slope coefficient and standard error
slope <- coefficients(model)[2]
se <- summary(model)$coefficients[2, 2]

# Calculate the 95% confidence interval
ci <- slope + c(-1.96, 1.96) * se

# Print the results
print(paste("Slope coefficient:", slope))
print(paste("Standard error of slope:", se))
print(paste("95% confidence interval:", ci[1], "to", ci[2]))
#################################
##Estimating the average MAXFWT reduction for
##with increasing the lead concentration (Lead73) to 100 μg /100 ml 
# Fit a linear regression model
model <- lm(MAXFWT ~ Ld73, data = lead)

# Predict the MAXFWT value for a Lead73 value of 100
prediction <- predict(model, newdata = data.frame(Ld73 = 100))

# Print the prediction
print(paste("Predicted MAXFWT value:", prediction))
