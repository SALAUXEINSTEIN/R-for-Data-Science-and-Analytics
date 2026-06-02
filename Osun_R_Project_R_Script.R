library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization
library(ggplot2)
library(tidyverse)
library(magrittr)
library(cluster)
library(cluster.datasets)




# QUESTION 1 ------------------------------------------------------------------- 
# We first created a working directory named "Emphasis yours", and the dataset needed was copied there as xlsx format
# We Import the Excel dataset given for the assignment into RStudio using the below command
# But NB Our excel file is in .xlsx format, and we have to convert it to .csv . we did that using the Excel conversion format.
HW6Data<- read.csv(file="HW6Data.csv",header=TRUE)
print(head(HW6Data))
summary(HW6Data)
# The below Code is used to Plot the Scatter plot of delay vs volume in the given dataset
plot(HW6Data$travel_time,HW6Data$travel_cost,xlab="Travel Time",ylab="Travel Cost",main="Figure 1: Plot of Travel Cost against Travel Time")
# from the plot we can see that there are clusters and via the eyeballing, there are three clusters.


# Question 2 -------------------------------------------------------------------
# Create the k-means model: km.out
km.out <- kmeans(HW6Data, centers=2, nstart=20)
# Inspect the result
summary(km.out)
km.out
# Print the cluster membership component of the model
# Coordinates of the clusters center
#library(svs)
#center=centers_ca(HW6Data, clusters, freq)
str(km.out)
km.out$cluster
# Print the km.out object
print(km.out)

# Scatter plot of HW6Data
plot(HW6Data,col=km.out$cluster, main="k-means with 2 clusters", xlab="Travel Time", ylab="Travel Cost")

#We can also view our results by using fviz_cluster. This provides a nice illustration of the clusters. 
#If there are more than two dimensions (variables) fviz_cluster will perform principal component analysis (PCA)
#and plot the data points according to the first two principal components that explain the majority of the variance.
fviz_cluster(km.out, data = HW6Data)

# Question 3 -------------------------------------------------------------------

k3 <- kmeans(HW6Data, centers = 3, nstart = 20)
k4 <- kmeans(HW6Data, centers = 4, nstart = 20)
k5 <- kmeans(HW6Data, centers = 5, nstart = 20)
k6 <- kmeans(HW6Data, centers = 6, nstart = 20)
k7 <- kmeans(HW6Data, centers = 7, nstart = 20)

# plots to compare
p1 <- fviz_cluster(km.out, geom = "point", data = HW6Data) + ggtitle("k = 2")
p2 <- fviz_cluster(k3, geom = "point",  data = HW6Data) + ggtitle("k = 3")
p3 <- fviz_cluster(k4, geom = "point",  data = HW6Data) + ggtitle("k = 4")
p4 <- fviz_cluster(k5, geom = "point",  data = HW6Data) + ggtitle("k = 5")
p5 <- fviz_cluster(k6, geom = "point",  data = HW6Data) + ggtitle("k = 6")
p6 <- fviz_cluster(k7, geom = "point",  data = HW6Data) + ggtitle("k = 7")

library(gridExtra)
grid.arrange(p1, p2, p3, p4,p5,p6, nrow = 3)

#Elbow method

set.seed(123)

# function to compute total within-cluster sum of square 
wss <- function(k) {
  kmeans(HW6Data, k, nstart = 10 )$tot.withinss
}

# Compute and plot wss for k = 1 to k = 7
k.values <- 1:7

# extract wss for 2-7 clusters
wss_values <- map_dbl(k.values, wss)

plot(k.values, wss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

# or 

set.seed(123)

fviz_nbclust(HW6Data, kmeans, method = "wss")

#using the silhouette method for confirmation

fviz_nbclust(HW6Data, kmeans, method = "silhouette")


# The optimal number of cluster based on the scree plot is 2
# Set k equal to the number of clusters corresponding to the elbow location
k <- 2


# Question 4 -------------------------------------------------------------------
# Based on the Identified number optimal number of clusters from Question 3, we redo the K-means analysis again

# Initialize total within sum of squares error: wss


cls <- kmeans(x = HW6Data, centers = 2)
HW6Data$cluster <- as.character(cls$cluster)
head(HW6Data)

#PLOT

ggplot() +
  geom_point(data = HW6Data, 
             mapping = aes(x = travel_time, 
                           y = travel_cost, 
                           colour = cluster))

#CENTROID

ggplot() +
  geom_point(data = HW6Data, 
             mapping = aes(x = travel_time, 
                           y = travel_cost, 
                           colour = cluster)) +
  geom_point(mapping = aes_string(x = cls$centers[, "travel_time"], 
                                  y = cls$centers[, "travel_cost"]),
             color = "red", size = 4)






# Question 5 -------------------------------------------------------------------

library("clValid")
#Showing for k-means cluster with clusters = 3
# Calculate Dunn's index: km.out1. Print it.
dunn_cls <- dunn(clusters = cls$cluster, Data = HW6Data)
dunn_cls



# Question 6 -------------------------------------------------------------------

#we want to use the dunn index to get the optimal number of clusters
# The higher the dunn index the better.

# Compute clValid
# Summary
HW <- read.csv(file="HW6Data.csv",header=TRUE)
str(HW)
dff <- data.matrix(HW)
dff
row.names(dff) <- NULL
attr(dff, "row.names") #> 1:4
deparse(dff) # or dput(df) -- shows
as.data.frame(dff)
rownames(dff) <- c(1:26)
dff
dim(dff)

clmethods <- c("hierarchical","kmeans","pam")
intern <- clValid(dff, nClust = 2:7, clMethods = clmethods, validation = "internal")

# Summary
summary(intern)
optimalScores(intern)


plot(intern)

#legend("bottomright")




# Question 7 -------------------------------------------------------------------
optimalcls <- kmeans(x = HW6Data, centers = 7)
HW6Data$cluster <- as.character(optimalcls$cluster)
head(HW6Data)

#PLOT

ggplot() +
  geom_point(data = HW6Data, 
             mapping = aes(x = travel_time, 
                           y = travel_cost, 
                           colour = cluster))

#CENTROID

ggplot() +
  geom_point(data = HW6Data, 
             mapping = aes(x = travel_time, 
                           y = travel_cost, 
                           colour = cluster)) +
  geom_point(mapping = aes_string(x = optimalcls$centers[, "travel_time"], 
                                  y = optimalcls$centers[, "travel_cost"]),
             color = "red", size = 4)


