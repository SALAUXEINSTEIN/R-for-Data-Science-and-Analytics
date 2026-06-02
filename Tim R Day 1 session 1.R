# Module 1
# 2pm-3pm

# Basic R syntax and data types

# Assigning values to variables
D <- 17
A <- 3
B <- 15
x <- 5
y <- 10

# Printing the result
result <- x + y
print(result)

Subtraction <- B-A
print(Subtraction)

# Basic arithmetic operations
a <- 7
b <- 3

sum <- a + b
difference <- a - b
product <- a * b
Multiplication <- b*a
quotient <- a / b

# Displaying the results
print(sum)
print(difference)
print(product)
print(quotient)

# Data types in R
# Numeric
num_var <- 10

# Character
char_var <- "Hello, World!"

my_name <- "Salau Ayobami"

# Logical
bool_var <- FALSE

# Integer
int_var <- 5L

# Complex
comp_var <- 3 + 4i

# Displaying the data types
print(my_name)
print(class(my_name))
print(class(num_var))
print(class(char_var))
print(class(bool_var))
print(class(int_var))
print(class(comp_var))







# Module 2

# 3pm-4pm

# Creating a vector
my_vector <- c(4,10,16,20)
vector_var <- c(1, 2, 3, 4, 5)
print(vector_var)
print(my_vector)
print(class(vector_var))


# Accessing elements of a vector
print(my_vector[4])
print(my_vector[2:3])
print(vector_var[1])
print(vector_var[2:4])




# Naming elements of a vector
named_vector <- c(first = 1, second = 2, third = 3)
print(named_vector)

# Creating a matrix
matrix_var <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
print(matrix_var)

matrix_var1 <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
print(matrix_var1)

matrix_var2 <- matrix (c(1,2,3,4,5,6,7,8,9), nrow =3, ncol =3)
print(matrix_var2)
print(matrix_var2[, 3])

# Accessing elements of a matrix
print(matrix_var[1, 2])
print(matrix_var[, 3])
print(matrix_var2[, 2])

print(matrix_var2[2 ,])
print(matrix_var2[1 ,])
print(matrix_var2[3 ,])
print(matrix_var2[1, 3])



# Creating a data frame
df <- data.frame(name = c("John", "Jane", "Mike"),
                 age = c(25, 30, 35),
                 salary = c(50000, 60000, 70000))
print(df)

df1 <- data.frame(name = c("raheemah", "adejuwon" , "odunayo" ),
                  age = c(21, 26,23),
                  salary_in_UAE = c(900, 1000, 11000))

print(df1)

# Accessing columns of a data frame
print(df$name)
print(df[, "age"])
print(df[, "salary"])

print(df1$name)
print(df1$age)
print(df1$salary_in_UAE)
print(df1[, "age"])



print(df["age" ,"salary_in_UAE"])



# Creating a list
list_var <- list(1, "text", TRUE)
print(list_var)

# Accessing elements of a list
print(list_var[[1]])
print(list_var[[2]])

# Creating a factor
factor_var <- factor(c("low", "medium", "high", "low"))
print(factor_var)

# Creating a logical vector
logical_vector <- c(TRUE, FALSE, TRUE)
print(logical_vector)

# Conditional statements
if (x > y) {
  print("x is greater than y")
} else {
  print("x is not greater than y")
}

# Application of a conditional statement
x <- 10
y <- 7

if (x > y) {
  print("x is greater than y")
} else {
  print("x is not greater than y")
}


# For loop
for (i in 1:5) {
  print(i)
}






# While loop
j <- 1
while (j <= 5) {
  print(j)
  j <- j + 1
}

# Functions
add_numbers <- function(a, b) {
  sum <- a + b
  return(sum)
}

result <- add_numbers(3, 4)
print(result)

# String manipulation
text <- "Hello, World!"
print(substr(text, 1, 5))
print(paste("Today is", date()))

# Reading data from a CSV file
data <- read.csv("HW6Data.csv")
print(data)
summary(data)




# Writing data to a CSV file
Data1 <- mtcars
Data1


write.csv(Data1, "written_data.csv", row.names = FALSE)




# Data cleaning and preprocessing techniques

# Generating sample data
set.seed(123)
data <- data.frame(
  numeric_column = c(runif(100), NA),              # Numeric column with missing values
  categorical_column = sample(LETTERS[1:3], 101, replace = TRUE)  # Categorical column
)

data



# Handling missing values
# Check for missing values
missing_values <- is.na(data)
missing_values


# Count missing values
num_missing <- sum(missing_values)
print(num_missing)

# Remove rows with missing values
clean_data <- na.omit(data)
clean_data

# Replace missing values with mean
mean_value <- mean(data$numeric_column, na.rm = TRUE)
mean_value

data$numeric_column[is.na(data$numeric_column)] <- mean_value
data

# Data transformations
# Log transformation
data$log_transformed <- log(data$numeric_column)

data
summary((data))

# Min-max normalization
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}
data$normalized_column <- normalize(data$numeric_column)
data
(0.2875775201-0.0006248)/(0.9942698-0.0006248)

# Standardization
standardize <- function(x) {
  return((x - mean(x)) / sd(x))
}
data$standardized_column <- standardize(data$numeric_column)


# Binning
bin_data <- cut(data$numeric_column, breaks = c(0, 0.5, 1), labels = c("low", "high"))

# Outlier detection and removal
# Detect outliers using z-score
z_scores <- scale(data$numeric_column)
outliers <- abs(z_scores) > 3

# Remove outliers
clean_data <- data[!outliers, ]

# Data imputation
# Install and load the "mice" package
#install.packages("mice")
library(mice)

# Perform multiple imputation using mice
imputed_data <- mice(data, m = 5, method = "pmm", seed = 123)

# Access the imputed data
imputed_data_complete <- complete(imputed_data, 1)

# Data aggregation
# Group by a variable and calculate mean
aggregate_data <- aggregate(numeric_column ~ categorical_column, data = data, mean)

print((aggregate_data))


#Module 3

# Creating a plot
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)
plot(x, y, type = "h", main = "Line Plot", xlab = "X-axis", ylab = "Y-axis")



x <- c(1, 2, 3, 4, 5)
y <- c (1, 5, 3, 2, 0)

plot (x, y)

# Example -2

dose <- c(20, 30, 40, 50, 60)

drugA <- c(16, 20, 27, 40, 60)

drugB <- c(40, 31, 25, 18, 12)

plot(dose, drugA)

plot(dose, drugB)

help(plot)

#type argument

#"p" for points,

#"l" for lines,

#"b" for both,

#"c" for the lines part alone of "b",

#"o" for both 'overplotted',

#"h" for 'histogram' like (or 'high-density') vertical lines,

#"s" for stair steps,

#"S" for other steps, see 'Details' below,

#"n" for no plotting.

#Different types of plot
data<- read.csv(file="HW6Data.csv",header=TRUE)
head(data)

#main="Car Distribution",xlab="Number of Gears", ylab = "Count"

plot(data$travel_time, data$travel_cost, main="Travel time against Travel cost",xlab="Travel_time",ylab="Trave_cost")


plot(data$travel_time, data$travel_cost, type="h")

plot(dose, drugA, type="p")

plot(dose, drugA, type="l")

plot(dose, drugA, type="b")

plot(dose, drugA, type="c")

plot(dose, drugA, type="o")

plot(dose, drugA, type="h")

plot(dose, drugA, type="s")

plot(dose, drugA, type="n")


# Load the MASS package

library(MASS)

str(mtcars)



########################################################

#[, 1] mpg Miles/(US) gallon

#[, 2] cyl Number of cylinders

#[, 3] disp Displacement (cu.in.)

#[, 4] hp Gross horsepower

#[, 5] drat Rear axle ratio

#[, 6] wt Weight (1000 lbs)

#[, 7] qsec 1/4 mile time

#[, 8] vs Engine (0 = V-shaped, 1 = straight)

#[, 9] am Transmission (0 = automatic, 1 = manual)

#[,10] gear Number of forward gears

#[,11] carb Number of carburetors

########################################################

summary(mtcars)

plot(mtcars$hp, mtcars$mpg)

plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower", ylab = "Gas mileage")

plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower", ylab = "Gas mileage", main = "MPG vs Horsepower")

# Compute max_hp

max_hp <- max(mtcars$hp)

# Compute max_mpg

max_mpg <- max(mtcars$mpg)

plot(mtcars$hp, mtcars$mpg,type = "p",
     
     xlim = c(0, max_hp),
     
     ylim = c(0, max_mpg), xlab = "Horsepower",
     
     ylab = "Miles per gallon", main = "Horsepower vs Mileage")

#################################################################################


#################################################################################
# Line Chart
plot(AirPassengers,type="l")  #Simple Line Plot

head(AirPassengers)
str(AirPassengers)


#Example 2
# Create the data for the chart.
v <- c(7,12,28,3,41)

# Plot the line chart. 
plot(v,type = "o")

# Plot the line chart.
plot(v,type = "o", col = "red", xlab = "Month", ylab = "Rain fall",
     main = "Rain fall chart")

#Multiple Lines
# More than line can be drawn on the same chart by using the line() function
# Create the data for the chart.
t <- c(14,7,6,19,3)

lines(t, type = "o", col = "blue")

#################################################################################




#################################################################################

# Bar Plot

#Simple Bar Plot

counts <- table(mtcars$gear)

counts

barplot(counts)

barplot(counts, main="Car Distribution",xlab="Number of Gears", ylab = "Count")

barplot(counts, main="Car Distribution",xlab="Number of Gears", ylab = "Count", legend= rownames (counts))

barplot(counts, main="Car Distribution",xlab="Number of Gears", ylab = "Count", legend= rownames (counts), col = c("blue", "black", "green"))

#Simple Horizontal Bar Plot with Added Labels

barplot(counts, horiz=TRUE)

barplot(counts, main="Car Distribution", horiz=TRUE,
        
        names.arg=c("3 Gears", "4 Gears", "5 Gears"))

#Stacked Bar Plot with Colors and Legend

counts <- table(mtcars$vs, mtcars$gear)

counts

barplot(counts, main="Car Distribution by

        Gears and V/S",
        
        xlab="Number of Gears",
        
        col=c("skyblue","red"),
        
        legend = rownames(counts))

#Grouped Bar plot

counts <- table(mtcars$vs, mtcars$gear)

counts

barplot(counts, main="Car Distribution by Gears

        and V/S",
        
        xlab="Number of Gears",
        
        col=c("darkblue","red"),
        
        legend = rownames(counts),
        
        beside=TRUE)

###############################################################################


###############################################################################

#Pie Chart

#Simple Pie Charts

slices <- c(10, 12,4, 16, 8)

lbls <- c("US", "UK", "Australia", "Germany", "France")

pie(slices, labels = lbls, main="Pie Chart of Countries")

#Pie Chart with Annotated Percentages

pct <- round(slices/sum(slices)*100)

pct

lbls <- paste(paste(lbls, round(pct),"%",sep=" ")) # add % to

lbls

pie(slices,labels = lbls)

pie(slices,labels = lbls,col=rainbow(length(lbls)), main="Pie Chart of Countries")



###############################################################################



#Histogram



#Simple histogram



hist(mtcars$mpg)



#Colored histogram



?hist



#The width of each of the bar can be decided by using breaks.



hist(mtcars$mpg, breaks = 6, col = "lightblue", xlab = "mpg", ylab = "freq")



hist(mtcars$mpg, breaks = 15, col=rainbow(7), xlab = "mpg", ylab = "freq")



#Change of bin



hist(AirPassengers, col=rainbow(7))



#Histogram of the AirPassengers dataset with 5 breakpoints



hist(AirPassengers, breaks=5)



# If you want to have more control over the breakpoints between bins,



# you can enrich the breaks argument by giving it a vector of breakpoints.



# You can do this by using the c() function:



# Compute a histogram for the data values in AirPassengers,



# and set the bins such that they run from 100 to 300, 300 to 500 and 500 to 700.



hist(AirPassengers, breaks= c(100, 300, 500, 700))



# We can use seq(x, y, z) function instaed of c()



# x = begin number of the x-axis,



# y = end number of the x-axis



# z = the interval in which these numbers appear.



hist(AirPassengers, breaks= seq(100, 700, 100))



# Note that you can also combine the two functions:



# Make a histogram for the AirPassengers dataset, start at 100 on the x-axis,



# and from values 200 to 700, make the bins 150 wide



hist(AirPassengers, breaks=c(100, seq(200,600, 150), 700))



###############################################################################


###############################################################################



#Kernel Density Plot



density_data <- density(mtcars$mpg)



plot(density_data)



plot(density_data, main = "Kernel Density of Miles per gallon")



polygon(density_data, col = "green", border= "black" )



###############################################################################


###############################################################################

# Boxplot

vec <- c(3,2,5,6,4,8,1,2,3,2,4,30,36)

?boxplot

boxplot(vec)

boxplot(vec, varwidth = TRUE)

# Boxplot of MPG by Car Cylinders

# a formula, such as y ~ grp, where y is a numeric vector of data values

# to be split into groups according to the grouping variable grp (usually a factor).

boxplot(mpg~cyl, data = mtcars)

boxplot(mpg~cyl,data=mtcars, main="Car Milage Data",
        
        xlab="Number of Cylinders", ylab="Miles Per Gallon",col=(c("gold","darkgreen","Blue")))

###############################################################################

#########################################################################

# Mosiac Plot

data(HairEyeColor)

mosaicplot(HairEyeColor)

?mosaicplot

###############################################################################



#########################################################################

#3D graph with lattice package

library(lattice)

attach(mtcars)

# Change am column to factor as "Automatic" and "Manual"

mtcars$am[which(mtcars$am == 0)] <- 'Automatic'

mtcars$am[which(mtcars$am == 1)] <- 'Manual'

mtcars$am <- as.factor(mtcars$am)

#3d scatterplot by factor level

cloud(hp~mpg*wt, data = mtcars)

cloud(hp~mpg*wt, data = mtcars, main = "3D Scatterplot")

cloud(hp~mpg*wt, data = mtcars, main = "3D Scatterplot", col = cyl)

cloud(hp~mpg*wt, data = mtcars, main = "3D Scatterplot", col = cyl, pch = 17)

cloud(hp~mpg*wt|am, data = mtcars, main = "3D Scatterplot", col = cyl, pch = 17)

?cloud

##############################################################

# 3D graph with plotly packaage

#install.packages("plotly")

library(plotly)

data(mtcars)

# Basic 3D Scatter Plot

plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec)

# Basic 3D Scatter Plot with Color

plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec, color = ~am, colors = c('#BF382A', '#0C4B8E')) %>%
  
  add_markers() %>%
  
  layout(scene = list(xaxis = list(title = 'Weight'),
                      
                      yaxis = list(title = 'horsepower'),
                      
                      zaxis = list(title = 'qsec')))

#3D Scatter Plot with color scaling

plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec,
        
        marker = list(color = ~mpg, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE)) %>%
  
  add_markers() %>%
  
  layout(scene = list(xaxis = list(title = 'Weight'),
                      
                      yaxis = list(title = 'horsepower'),
                      
                      zaxis = list(title = 'qsec')),
         
         annotations = list(
           
           x = 1.13,
           
           y = 1.05,
           
           text = 'Miles/(US) gallon',
           
           xref = 'paper',
           
           yref = 'paper',
           
           showarrow = FALSE
           
         ))



# Load the `plotly` library

library(plotly)

# Your volcano data

str(volcano)

volcano

# The 3d surface map

plot_ly(z = ~volcano, type = "surface")

#########################################################################



########################################################################



# WordCloud



#Instal the packages



#install.packages("wordcloud")



#install.packages("RColorBrewer")



#Load the packages



library("wordcloud")



library("RColorBrewer")



# Create model_table of manufacturer frequencies

mtcars

rownames(mtcars)
colnames(mtcars)


model_table <- table(rownames(mtcars))



model_table



# Create the default wordcloud from this table



#scale - range of the size of the word



#freq - frequency of word



wordcloud(words = names(model_table),
          
          
          
          freq = as.numeric(model_table),
          
          
          
          scale = c(1.5, 0.25))



# Change the minimum word frequency



#min.freq - below min.freq word will not be plotted



wordcloud(words = names(model_table),
          
          
          
          freq = as.numeric(model_table),
          
          
          
          scale = c(1, 0.25),
          
          
          
          min.freq = 1)



##################################################################################







# Graphics with Ggplot2



#install.packages(ggplot2)



library(ggplot2)



# ggplot2 Layer:



###########################################################################



#1. Data Layer



#2. Aesthetic layer: x-axis, y-axis, color, fill, size



#3. Geometric layer: point, line, histogram, barplot, boxplot



#4. Facet layer: column , rows



#5. Statics layer: binning, smoothing



#6. Coordinates layer: fixed, polar, cartesian



#7. Themes Layer: non data link



###########################################################################



# Scatter plot



ggplot(mtcars, aes(x=wt, y = mpg)) # 2 Layer



ggplot(mtcars, aes(x=wt, y = mpg))+ geom_point() # 3 Layer



# Adding color



ggplot(mtcars, aes(x=wt, y = mpg, col = disp))+geom_point() # 3 Layer



#Adding color based on a factor



ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) + geom_point()# 3



#Add size



ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) + geom_point()



# Add color and shape (4 aesthetics):



ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl), shape = factor(am))) + geom_point()



# Add color shape and size(hp/wt) (5 aesthetics):



ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl), shape = factor(am), size = (hp/wt))) + geom_point()



#############################################################



#Bar Plot



p <- ggplot(mtcars, aes(x= factor(cyl)))



p



p + geom_bar()



ggplot(mtcars, aes(x= factor(cyl), fill = factor(am)))+ geom_bar()



# Histogram



q <- ggplot(mtcars, aes(x= mpg))



q + geom_histogram()



ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5)



ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5, color = "black")



ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5, color = "black", fill = "blue")



# Density plot



q + geom_density(color = "black", fill = "blue")



#Boxplot



ggplot(mtcars, aes(x=factor(cyl), y = mpg))+ geom_boxplot(color = "black", fill = "lightblue")



####################################################################



# Facet Layer



#Split the whole dataset based on a character along row or column



mtcars$am[which(mtcars$am == 0)] <- 'Automatic'



mtcars$am[which(mtcars$am == 1)] <- 'Manual'



mtcars$am <- as.factor(mtcars$am)



ggplot(mtcars, aes(x = wt, y = mpg, shape = factor(cyl), col = qsec)) +
  
  
  
  geom_point() +
  
  
  
  facet_grid(.~am)



# Basic scatter plot



p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  
  
  geom_point()



p



# 1 - Separate rows according to transmission type, am



p + facet_grid(am ~ .)



# 2 - Separate columns according to cylinders, cyl



p + facet_grid(. ~ cyl)



# 3 - Separate by both columns and rows



p + facet_grid(am ~ cyl)



#################################################################











# Installing and loading packages
#install.packages("ggplot2")
library(ggplot2)

# Scatter plot
data <- data.frame(x = c(1, 2, 3, 4, 5), y = c(2, 4, 6, 8, 10))
ggplot(data, aes(x, y)) +
  geom_point() +
  labs(title = "Scatter Plot", x = "X-axis", y = "Y-axis")

# Bar plot
data <- data.frame(category = c("A", "B", "C"), value = c(10, 20, 15))
ggplot(data, aes(category, value)) +
  geom_bar(stat = "identity") +
  labs(title = "Bar Plot", x = "Category", y = "Value")

# Line plot
data <- data.frame(x = c(1, 2, 3, 4, 5), y = c(2, 4, 6, 8, 10))
ggplot(data, aes(x, y)) +
  geom_line() +
  labs(title = "Line Plot", x = "X-axis", y = "Y-axis")

# Histogram
data <- data.frame(value = c(1, 2, 3, 4, 5, 2, 3, 4, 3, 4))
ggplot(data, aes(value)) +
  geom_histogram(binwidth = 1) +
  labs(title = "Histogram", x = "Value", y = "Frequency")

# Box plot
data <- data.frame(group = rep(c("A", "B"), each = 10),
                   value = c(rnorm(10), rnorm(10, mean = 2)))
ggplot(data, aes(group, value)) +
  geom_boxplot() +
  labs(title = "Box Plot", x = "Group", y = "Value")

# Heatmap
data <- matrix(c(1, 2, 3, 4, 5, 2, 4, 6, 8, 10), nrow = 2)
heatmap(data)

# Scatter plot with regression line
data <- data.frame(x = c(1, 2, 3, 4, 5), y = c(2, 4, 6, 8, 10))
ggplot(data, aes(x, y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatter Plot with Regression Line", x = "X-axis", y = "Y-axis")

