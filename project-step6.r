library(plyr)
library(car)
library(report)
library(multcomp)
library(dunn.test)
library(postHoc)

my_data <-  load("/home/marwan/Documents/University/Biomedical_Statistics/project/Project E.RData")
head(my_data)
lead
lead$Sex = factor(lead$Sex,labels =  c("male","female"))
lead$Lead_type = factor(lead$Lead_type,labels =  c("type1","type2"))
# We hypothesis that MAXWT is different between male vs female. Assuming normality and homoscedasticity, 
# can you test this hypothesis using statistical hypothesis framework
# hypothesis framework:
# 1- statistical question: does the MAXWT increase or decrease between the males and females 
# 2- Null Hypothesis is that MAXWT doesn't change between the males and females
# 3- applying the t-test
lead_male = lead[lead$Sex == 1,]
lead_female = lead[lead$Sex == 2,]
t.test(lead_male$MAXFWT, lead_female$MAXFWT)
# 4- p-value = 0.1964 (> 0.05) ;thus, the evidence doesn't support the alternative hypothesis which states that the MAXWT is different between females to males

lead_ld72 = lead[lead$Ld72 <= 40,]
lead_ld72more = lead[lead$Ld72 > 40,]

shapiro.test(lead_ld72$MAXFWT)
shapiro.test(lead_ld72more$MAXFWT)
hist(lead_ld72$MAXFWT)
hist(lead_ld72more$MAXFWT)
qqnorm(lead_ld72$MAXFWT)
qqline((lead_ld72$MAXFWT))
qqnorm(lead_ld72more$MAXFWT)
qqline((lead_ld72more$MAXFWT))
### based on the tests above the evidence supports the non-normality of the data thus we shall use wilcox test
wilcox.test(lead_ld72more$MAXFWT, lead_ld72$MAXFWT, alternative = "less")
## p-value = 0.001518 which means that the evidence supports that the Ld72 when more than 40 is lower than that of the Ld72 less than or equal to 40

# Anova test for 4 groups
AnovaTest = aov(lm(MAXFWT ~ Sex + Lead_type, data = lead))
summary(AnovaTest)
eval(AnovaTest)
# the Anova test supports the existence of difference between the lead type 1 and lead type 2 in the MAXFWT (P-value = 0.00213) 
# however the anova test doesn't support the difference between the Males and Females in the MAXFWT (p-value = 0.21208)


## posthoc
posthoc = TukeyHSD(AnovaTest)
# the adjusted p-value shows is still significant when it comes to type 1 and type 2 in the lead types and still not significant 
# when it comes to male and female regarding their MaxFWT

