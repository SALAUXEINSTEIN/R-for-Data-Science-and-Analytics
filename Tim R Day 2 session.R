# Time: 2pm-3pm
# Module 4: Statistical Analysis with R

data<- read.csv(file="HW6Data.csv",header=TRUE)
print(head(data))
print(tail(data))
summary(data)

# Introduction to statistical concepts in R
# Hypothesis testing
t.test(data$travel_cost, mu = 5.315385)

t.test(data$travel_cost)

t.test(data$travel_time, mu = 15)


# Confidence intervals
confidence_interval <- t.test(data$travel_cost)$conf.int
print(confidence_interval)


# Conducting t-tests for categorical data
# Chi-square test
data1<- read.csv(file="data1.csv",header=TRUE)
print(head(data1))
print(tail(data1))
summary(data1)

# Perform Fisher's exact test
fisher_result <- fisher.test(data1$Gender, data1$Marital_status)

# Print the test result
print(fisher_result)


data2<- read.csv(file="data2.csv",header=TRUE)
head(data2)
tail(data2)
chi_square_result <- chisq.test(data2$Gender, data2$Marital_status)
print(chi_square_result)

#The warning message you received suggests that the chi-squared approximation used in the chisq.test() function may not be accurate for your data. This warning typically occurs when one or more expected cell counts are below a certain threshold.

#To address this warning, you can consider combining categories or increasing your sample size to ensure that each expected cell count meets the assumptions for the chi-square test. Additionally, you can use alternative methods for analyzing categorical data, such as Fisher's exact test or exact multinomial test, which may be more suitable for small sample sizes or when expected cell counts are low.

#Here's an example using the fisher.test() function for analyzing the relationship between gender and marital status:

fisher_result1 <- fisher.test(data2$Gender, data2$Marital_status)
print(fisher_result1)



# Performing linear regression analysis
# Simple linear regression
data

lm_model <- lm(travel_cost ~ travel_time, data = data)
summary(lm_model)
print(lm_model)


#y = -0.2453x + 11.6372

# Multiple linear regression
# Create the linear regression model

data3<- read.csv(file="dataset1.csv",header=TRUE)
head(data3)

lm_model3<- lm(Sales ~ Profit + Price , data = data3)

lm_model4 <- lm(Price ~ Sales + Profit, data = data3)

summary(lm_model4)

# Print the summary of the model
summary(lm_model3)
print(lm_model3)

# y = 1.6995x1 + 0.7039 x2 + 18.6471




# Time: 3pm-4pm
# Module 5: Data Visualization with R

data<- read.csv(file="HW6Data.csv",header=TRUE)
print(head(data))
print(tail(data))
summary(data)

library(ggplot2)
# Advanced data visualization using ggplot2 package
# Bar plot
ggplot(data, aes(x = travel_cost, y = travel_time)) +
  geom_bar(stat = "identity")

# Histogram
ggplot(data, aes(x = travel_cost)) +
  geom_histogram(binwidth = 1)

# Box plot
ggplot(data, aes(x = travel_cost, y = travel_time)) +
  geom_boxplot()

# Heatmap
ggplot(data, aes(x = travel_cost, y = travel_time, fill = NULL)) +
  geom_tile()

ggplot(data, aes(x = travel_cost, y = travel_time)) +
  geom_tile()

# Line plot
ggplot(data, aes(x = travel_cost, y = travel_time)) +
  geom_line()

# Scatter plot
ggplot(data, aes(x = travel_cost, y = travel_time)) +
  geom_point() +
  labs(title = "Scatter plot", x = "travel_cost", y = "travel_time")




plot(data$travel_cost,data$travel_time, main="Scatter plot", xlab="travel_cost", ylab="travel_time")

# Customizing plots
# Adding labels and titles
ggplot(data, aes(x = travel_cost, y = travel_time)) +
  geom_bar(stat = "identity") +
  labs(title = "Bar Plot", x = "travel_cost", y = "travel_time")

# Changing colors and themes
ggplot(data, aes(x = travel_cost, y = travel_time, fill = NULL)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("red", "blue", "green")) +
  theme_bw()

ggplot(data, aes(x = travel_cost, y = travel_time, fill = NULL)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("blue")) +
  theme_bw()

ggplot(data, aes(x = travel_cost, y = travel_time, fill = NULL)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("red", "blue")) +
  theme_bw()



ggplot(data3, aes(x = Price, y = Profit, fill = Sales)) +
  geom_bar(stat = "identity", position = "dodge")

ggplot(data3, aes(x = Price, y = Profit, fill = Sales)) +
  geom_bar(stat = "identity", position = "stack")



# Creating complex visualizations
# Grouped bar plot
ggplot(data, aes(x = travel_cost, y = travel_time, fill = NULL)) +
  geom_bar(stat = "identity", position = "dodge")

# Stacked bar plot
ggplot(data, aes(x = travel_cost, y = travel_time, fill = NULL)) +
  geom_bar(stat = "identity", position = "stack")

# Time series plot
ggplot(data, aes(x = travel_cost, y = travel_time)) +
  geom_line()



# Time: 4pm-5pm
# Module 6: Introduction to Machine Learning with R

# supervised machine learning

# unsupervised machine learning

# Overview of machine learning concepts and algorithms
# Random Forest
#install.packages("caret")
library(caret)

datasets



train_data <- read.csv(file="HW6Data.csv",header=TRUE)
head(train_data)


model <- train(travel_cost ~ ., data = train_data, method = "rf")
print(model)
#summary(model)
# Regression
model2 <- train(travel_cost ~ ., data = train_data, method = "lm")
#(elastic net regression)
print(model2)

train_data2<- read.csv(file="dataset1.csv",header=TRUE)


model <- train(Sales ~ ., data = train_data2, method = "glmnet")



summary(model)
print(model)

# Unsupervised learning
# Clustering
#install.packages("cluster")
library(cluster)
kmeans_result <- kmeans(data, centers = 5)
#summary(kmeans_result)
print(kmeans_result)
# Dimensionality reduction
#install.packages("caret")
library(caret)
pca_result <- preProcess(data, method = "pca")
summary(pca_result)
# Time series forecasting
#install.packages("forecast")
library(forecast)
modelt <- auto.arima(data$travel_cost)
summary(modelt)
# Ensemble methods
#install.packages("randomForest")
library(randomForest)
modeler <- randomForest(travel_cost ~ ., data = train_data)

summary(modeler)

# Neural networks
#install.packages("neuralnet")
library(neuralnet)
model5 <- neuralnet(travel_cost~ ., data = train_data, hidden = c(5, 3))
summary(model5)
# Model evaluation
# Confusion matrix
#install.packages("caret")
train_datal <- read.csv(file="HW6Data.csv",header=TRUE)
datal <- read.csv(file="HW6Data.csv",header=TRUE)
library(caret)
datal$travel_cost <- factor(datal$travel_cost)


train_datal$travel_cost <- factor(train_datal$travel_cost)
levels(datal$travel_cost)
levels(train_datal$travel_cost)
confusion_matrix <- confusionMatrix(datal$travel_cost, train_datal$travel_cost)
summary(confusion_matrix)
print(confusion_matrix)

# Accuracy, precision, recall, F1-score
#install.packages("caret")
library(caret)
accuracy <- confusion_matrix$overall["Accuracy"]
precision <- confusion_matrix$byClass["Pos Pred Value"]
recall <- confusion_matrix$byClass["Sensitivity"]
f1_score <- confusion_matrix$byClass["F1"]

summary(accuracy)
print(accuracy)

# Cross-validation
#install.packages("caret")
library(caret)
train_data3<- read.csv(file="dataset1.csv",header=TRUE)

sum(is.na(train_data3$Sales))
sum(is.na(train_data3[, -which(names(train_data3) == "Sales")]))
modelit <- train(Sales ~ ., 
                 data = train_data3, 
                 method = "glmnet",
                 trControl = trainControl(method = "cv", number = 10))




summary(modelit)
print(modelit)

#modeliter <- train(Sales ~ ., data = train_data3, method = "classification_algorithm", trControl = trainControl(method = "cv", number = 10))

#The specific classification algorithm you are referring to, "classification_algorithm," is not a predefined algorithm in any specific library. It seems to be a placeholder name or an example mentioned in the context of specifying the method parameter for the train function.

# Hyperparameter tuning
#install.packages("caret")


library(caret)

# Specify the classification algorithm and its associated tuning grid
algorithm <- "rf"
tuning_grid <- expand.grid(mtry = c(2, 4, 6))

# Train the model
model <- train(travel_cost ~ ., data = train_data, method = algorithm, tuneGrid = tuning_grid)

# Print the model results
print(model)




