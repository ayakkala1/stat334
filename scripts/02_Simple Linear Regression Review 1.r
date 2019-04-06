# This script goes with notes "02_Simple Linear Regression Review 1"

# Load the Corollas Data
library(tidyverse)

Corollas <- read_table("datasets/02_Corollas.txt")

# In RStudio, use the "File>Import Dataset>From Text (base)..." command
# Select the Corollas.txt file that you downloaded from PolyLearn
# Click the Import button

# Formatting the data into matrices
y = Corollas$Price
n = length(y)
x1 = Corollas$Age
x0 = matrix(1,n,1)
X = cbind(x0,x1)

# Computing the parameter estimates showing intermediate steps
XtX = t(X)%*%X
Xty = t(X)%*%y
XtXinv = solve(XtX)
b = XtXinv%*%Xty

# Computing the predicted values and the residuals
H = X%*%XtXinv%*%t(X) # compute the hat matrix, H
y.hat = H%*%y # computes the predicted values
I = diag(1,n) # creates an nxn identity matrix
e = (I-H)%*%y # computes the residuals

# Each predicted value, y.hat, is a linear combination of the observed values, y.
# The contribution of each observed value to a particular predicted value is
# given by the elements of the hat matrix
# Let's look at the first row of the hat matrix
H[1,]

# Computing the variance and standard deviation of the residuals (MSE and RMSE)
SSE = t(e)%*%e  # You could also use crossprod(e) here. This is the sum of squared residuals.
SSE.df = n - dim(X)[2] # The denominator is n minus the number of columns in X. The number of columns is the second element output by dim(X)
MSE = SSE/SSE.df # The variance of the residuals (or MSE) is the SSE divided its degrees of freedom.
RMSE = sqrt(MSE) # The standard deviation of the residuals

# Computing a regression in R
# This is the actual way that you compute a regression in R. R computes all of the necessary matrices in the background.
Price = Corollas$Price  # This just simplifies the variable name(s)
Age = Corollas$Age

model1 = lm(Price~Age)  # lm is the linear model function. The tilde (~) separates y (left side) from the x's (right side)
summary(model1)  # model1 is an object containing all of the regression information. This summarizes the regression

plot(Age, Price)  # This plots the data (list x first, then y)
abline(model1$coefficients)  # This puts a regression line on the plot

# Each object in R has different elements attached to it. You can see these elements using the "names" command
names(Corollas)
names(model1)

# For example, from our regression model, we can list the following
model1$coefficients
model1$fitted.values
model1$residuals
model1$df.residual



