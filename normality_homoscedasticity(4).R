
#### installed packages 

install.packages("lmtest")
install.packages("nortest")

###libraries
library(nortest)
library(ggplot2)
library(lmtest)
library(stats)
library(graphics)


#####data
load("E.RData")
head(lead)
names(lead)



##Check the homoscedasticity using two methods. 
############################
####scatter plot 
############################

# Fit a linear regression model
model <- lm(y ~ x, data = lead)

# Calculate the residuals
residuals <- residuals(model)

# Create the scatter plot
plot(model$fitted.values, residuals, xlab = "Predicted Values", ylab = "Residuals")
abline(h = 0)




###################################
######Bartlett's test: 
##################################


bartlett.test(lead)



################################################
####normality test 
##shapiro test
########################################################

# Set the alpha level
alpha <- 0.05

# Loop through the variables in the data frame
for(i in 1:ncol(lead)){
  x <- lead[,i]
  
  # Conduct the Shapiro-Wilk test
  shapiro.test(x)
  
  # Check the p-value
  if(shapiro.test(x)$p.value < alpha){
    print(paste("Variable", colnames(lead)[i], "is not normal"))
  } else {
    print(paste("Variable", colnames(lead)[i], "is normal"))
  }
}

####################
##Q_Q plot
#################
# Loop through the variables in the data frame
par(mfrow = c(3, 3))

for(i in 1:ncol(lead)){
  x <- lead[,i]
  # Create the Q-Q plot
  qqnorm(x)
  qqline(x)
  
  # Add a title to the plot
  title(paste("Q-Q Plot for Variable", colnames(lead)[i]))
}

###################
qqnorm(as.matrix(lead))
qqline(as.matrix(lead))

