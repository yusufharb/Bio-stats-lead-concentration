## install packages 
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("scales")

library(tidyverse)
library(ggplot2)
library(dplyr)
library(scales)

load("E.RData")
head(lead)
names(lead)
View (lead)
summary(lead)

#1# Create the bar chart
ggplot(lead, aes(x = Sex)) +
  geom_bar()
#######################
##Generate a bar chart graph with mean MAXWT in  males and females 
# Calculate the mean MAXWT for males and females
mean_maxwt <- aggregate(MAXFWT ~ Sex, lead, mean)

# Create the bar chart
ggplot(data = mean_maxfwt, aes(x = Sex, y = MAXFWT)) +
  geom_bar(stat = "identity", fill = "blue") +
  xlab("Sex") + ylab("Mean MAXFWT") +
  ggtitle("Mean MAXWT by Gender")

##########################

##Make a histogram of a continuous variable: “age” as well as “MAXFWT”.

# Create a histogram for age

ggplot(lead, aes(x = Age)) +
  geom_histogram()

# Create a histogram for MAXWT
ggplot(lead, aes(x = MAXFWT)) +
  geom_histogram()
##########################
###Make a scatterplot of 2 continuous variables Ld72 and MAXWT, and add the regression lines for each gender

# Convert the values in the Sex column to "Male" and "Female"
lead$Sex <- ifelse(lead$Id %% 2 == 1, "Male", "Female")

# Convert the Sex column to a factor
lead$Sex <- as.factor(lead$Sex)


# Create separate regression models for each gender
male_regression <- lm(Ld72 ~ MAXFWT, data = lead, subset = Sex == "Male")
female_regression <- lm(Ld72 ~ MAXFWT, data = lead, subset = Sex == "Female")



# Create the scatterplot
plot <- ggplot(lead, aes(x = MAXFWT, y = Ld72, color = Sex)) +
  geom_point()

# Add the regression lines
plot + abline(male_regression, col = "red") +
  abline(female_regression, col = "blue")
head(lead)


str(lead)

######################
####Make a boxplot of age  and a separate boxplots per Ld72 and per Ld73 (as.factors). 

# Convert Ld72 and Ld73 to factors
load("E.RData")
head(lead)
names(lead)

ggplot(lead, aes(x = Ld72, y = Age)) +
  geom_boxplot() +
  xlab("Ld72")+ ylab("Age")
ggplot(lead, aes(x = Ld73, y = Age)) +
  geom_boxplot() +
  xlab("Ld73")+ ylab("Age")





