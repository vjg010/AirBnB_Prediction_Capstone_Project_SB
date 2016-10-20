# AirBnB data located in the weblink below: 
# https://www.kaggle.com/c/airbnb-recruiting-new-user-bookings/data
getwd()
setwd("/Users/vijaygopalakrishnan/R Programming/Capstone project")

age_gender_bckts <- read.csv("age_gender_bkts.csv")
countries <- read.csv("countries.csv")
sessions <- read.csv("sessions.csv")
train_users <-read.csv("train_users_2.csv")
test_users <- read.csv("test_users.csv")
sample_submission_ndf <- read.csv("sample_submission_NDF.csv")

head(countries)
head(sessions)
head(age_gender_bckts)
head(train_users)
head(test_users)
head(sample_submission_ndf)

str(countries)
str(sessions)
str(age_gender_bckts)
str(train_users)
str(test_users)
str(sample_submission_ndf)

levels(train_users$gender)
summary(train_users$age)
dim(train_users)
quantile(train_users$age, c(0.001, 0.005, 0.01, 0.25, 0.50, 0.75, 0.9, 0.95, 0.99), na.rm = TRUE)

# Basic scatter plot:
#plot(quality$OfficeVisits, quality$Narcotics, col = quality$PoorCare)
library(ggplot2)
ggplot(data = train_users, aes(x = age, y = country_destination, col = gender)) + 
  geom_point()

#summary(sessions)
#hist(train_users$age)

#ggplot(train_users, aes (x = country_destination, fill= factor(age))) + 
 # geom_histogram(binwidth = 1)

library(ggplot2)
# counts
ggplot(train_users, aes(x=gender)) +
  geom_bar()

train_users_new <- train_users[ which(train_users$age <= 100),]
ggplot(train_users_new, aes(x=age)) +
  geom_bar(fill = "blue")

# proportion of age
ggplot(train_users_new, aes(x=age)) +
  geom_bar(fill = "blue",aes(y=..count../sum(..count..)))

# counts
ggplot(train_users_new, aes(x=gender)) +
  geom_bar(fill = "blue")

# proportion of gender
ggplot(train_users_new, aes(x=gender)) +
  geom_bar(fill = "blue",aes(y=..count../sum(..count..)))

# proportion of destination countries
ggplot(train_users_new, aes(x=country_destination)) +
  geom_bar(fill = "blue",aes(y=..count../sum(..count..)))

# proportion of signup_method
ggplot(train_users_new, aes(x=signup_method)) +
  geom_bar(fill = "blue",aes(y=..count../sum(..count..)))

# proportion of signup_flow
ggplot(train_users_new, aes(x=signup_flow)) +
  geom_bar(fill = "blue",aes(y=..count../sum(..count..)))

# proportion of signup_app
ggplot(train_users_new, aes(x=signup_app)) +
  geom_bar(fill = "blue",aes(y=..count../sum(..count..)))

# proportion of first_device_type
ggplot(train_users_new, aes(x=first_device_type)) +
  geom_bar(fill = "blue",aes(y=..count../sum(..count..)))

# proportion of first_browser
ggplot(train_users_new, aes(x=first_browser)) +
  geom_bar(fill = "blue",aes(y=..count../sum(..count..)))

# proportion of language
ggplot(train_users_new, aes(x=language)) +
  geom_bar(fill = "blue",aes(y=..count../sum(..count..)))

# proportion of affiliate_channel
ggplot(train_users_new, aes(x=affiliate_channel)) +
  geom_bar(fill = "blue",aes(y=..count../sum(..count..)))

# Age missing
train_users_agemissing <- train_users[ is.na(train_users$age),]

head(train_users_agemissing)
# counts
ggplot(train_users_agemissing, aes(country_destination)) +
  geom_bar(fill = "blue")
# proportion of destination countries
ggplot(train_users_agemissing, aes(x=country_destination)) +
  geom_bar(fill = "blue",aes(y=..count../sum(..count..)))

# Box plots
ggplot(train_users_new, aes(x=country_destination, y=age, fill=age)) + geom_boxplot(outlier.shape = NA) +
  coord_cartesian(ylim = c(15, 60)) 

ggplot(train_users_new, aes(x=country_destination, y=age, fill=gender)) + geom_boxplot(outlier.shape = NA) +
  coord_cartesian(ylim = c(15, 60)) 
# + coord_flip()

