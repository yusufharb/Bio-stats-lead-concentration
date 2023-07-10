# Load required library
install.packages("dplyr")
library(dplyr)
library(utils)
# Load the RData file
load("lead.RData")
# View the data
View(lead);
iqr <- quantile(lead$MAXFWT, 0.75, na.rm = TRUE) - quantile(lead$MAXFWT, 0.25, na.rm = TRUE)

# Calculate the lower and upper bounds for outliers
lower_bound <- quantile(lead$MAXFWT, 0.25, na.rm = TRUE) - 1.5 * iqr
lower_bound
upper_bound <- quantile(lead$MAXFWT, 0.75, na.rm = TRUE) + 1.5 * iqr
upper_bound
# Identify any outliers in the dataset
outliers <- lead %>% filter(MAXFWT < lower_bound | MAXFWT > upper_bound, na.rm = TRUE)

# Visualize the outliers using a boxplot
plot(lead$MAXFWT, xlab = "", ylab = "MAXFWT", main = "MAXFWT with Outliers")

# Add the outliers to the plot
points(outliers$MAXFWT, col = "red", pch = 19)


male <- lead %>% filter(Sex == "1")
female <- lead %>% filter(Sex == "2")

# Calculate the mean and standard deviation of MAXWT for males
mean_male <- mean(male$MAXFWT, na.rm = TRUE)
mean_male
sd_male <- sd(male$MAXFWT, na.rm = TRUE)
sd_male

# Calculate the mean and standard deviation of MAXWT for females
mean_female <- mean(female$MAXFWT, na.rm = TRUE)
mean_female
sd_female <- sd(female$MAXFWT, na.rm = TRUE)
sd_female

# Calculate the sample size for males
n_male <- nrow(male)
n_male

# Calculate the sample size for females
n_female <- nrow(female)
n_female


# Calculate the 90% confidence interval for males
ci_male_90 <- t.test(male$MAXFWT, conf.level = 0.9)$conf.int
print(ci_male_90)
#The confidence interval ci_male_90 = 45.10538 56.25462 indicates that there is a 90% probability that the true population mean of the MAXWT variable in the male group falls within the range of 45.10538 to 56.25462.

# Calculate the 95% confidence interval for males
ci_male_95 <- t.test(male$MAXFWT, conf.level = 0.95)$conf.int
ci_male_95
#46.49985 54.86015 

# Calculate the 99% confidence interval for males
ci_male_99 <- t.test(male$MAXFWT, conf.level = 0.99)$conf.int
ci_male_99

# Calculate the 90% confidence interval for females
ci_female_90 <- t.test(female$MAXFWT, conf.level = 0.9)$conf.int

# Calculate the 95% confidence interval for females
ci_female_95 <- t.test(female$MAXFWT, conf.level = 0.95)$conf.int

# Calculate the 99% confidence interval for females
ci_female_99 <- t.test(female$MAXFWT, conf.level = 0.99)$conf.int
ci_female_99  

#the width of the confidence interval increases as the confidence level increases. This is because a higher confidence level requires a wider range of values to be included in the interval to account for the greater uncertainty.

