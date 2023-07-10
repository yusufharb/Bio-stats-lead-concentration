myData<-read.table('Project E.RData')
summary(myData)
load("Project E.RData")
str(lead)
summary(lead)

#mean, median, minimum, maximum, first and third quartile (for each variable).



###

mean(lead$Age)
median(lead$Age)
min(lead$Age)
max(lead$Age)
quantile(lead$Age, 0.25)
quantile(lead$Age, 0.75)

mean(lead$Iqf)
median(lead$Iqf)
min(lead$Iqf)
max(lead$Iqf)
quantile(lead$Iqf, 0.25)
quantile(lead$Iqf, 0.75)

mean(lead$Ld72)
median(lead$Ld72)
min(lead$Ld72)
max(lead$Ld72)
quantile(lead$Ld72, 0.25)
quantile(lead$Ld72, 0.75)

mean(lead$Ld73)
median(lead$Ld73)
min(lead$Ld73)
max(lead$Ld73)
quantile(lead$Ld73, 0.25)
quantile(lead$Ld73, 0.75)

mean(lead$MAXFWT,na.rm=TRUE)
median(lead$MAXFWT,na.rm=TRUE)
min(lead$MAXFWT,na.rm=TRUE)
max(lead$MAXFWT,na.rm=TRUE)
quantile(lead$MAXFWT, 0.25,na.rm=TRUE)
quantile(lead$MAXFWT, 0.75,na.rm=TRUE)

mean(lead$Totyrs)
median(lead$Totyrs)
min(lead$Totyrs)
max(lead$Totyrs)
quantile(lead$Totyrs, 0.25)
quantile(lead$Totyrs, 0.75)
#	For the categorical variable existing, calculate a frequency table
table(lead$Sex)
table(lead$Area)
table(lead$Id)
table(lead$Lead_type)
table(lead$Exposed)
#•	Calculate the correlation coefficient (MAXWT and Ld72) and (MAXWT and Ld73)
cor.test(lead$MAXFWT, lead$Ld72, method = "pearson")
cor.test(lead$MAXFWT, lead$Ld73, method = "pearson")
#	Fit a linear regression to the data and interpret the regression coefficient (for the one of the hypotheses mentioned above)
lm(lead)

y=lm(MAXFWT~Sex,lead)
y
summary(y)
##
##
x=lm(MAXFWT~Lead_type+Sex,lead)
x
summary(x)
#Calculate and interpret a 95% confidence interval of the regression slope , (bonus)
confint(y, level=0.95)
confint(x, level=0.95)

##Estimating the average MAXFWT reduction for
##with increasing the lead concentration (Lead73) to 100 μg /100 ml 
# Fit a linear regression model
model <- lm(MAXFWT ~ Ld73, data = lead)

# Predict the MAXFWT value for a Lead73 value of 100
prediction <- predict(model, newdata = data.frame(Ld73 = 100))

# Print the prediction
print(paste("Predicted MAXFWT value:", prediction))

