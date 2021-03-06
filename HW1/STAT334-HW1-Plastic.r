# R Script for STAT 334, Spring 2019, HW 1
# This script sets up the matrices needed for Problem 9 on HW1.
# After running this script, you should have a response vector, y, and a design matrix, X.
# You must compute the necessary results by adding matrix formulas to this script
# or running them from the R Console.

# Load the Plastic Hardness Data
# In RStudio, use the "File>Import Dataset>From Text (base)..." command
# Select the Plastic.txt file that you downloaded from PolyLearn
# Click the Import button

# Formatting the data into matrices
y <- Plastic$Hardness
n <- length(y)
x1 <- Plastic$Time
x0 <- matrix(1,n,1)
X <- cbind(x0,x1)

# Here are some other matrices that you may need
I <- diag(1,n)  # the n x n identity matrix
J <- x0%*%t(x0) # an n x n matrix containing all 1's -- you could also use matrix(1,n,n) here

b <- solve(t(X) %*% X) %*% (t(X) %*% y)

variance <- sum((y - (t(x0) %*% y)/length(y)) ** 2)/(length(y) - 1)

e <- (y - (X %*% b))

MSE <- (t(e) %*% e) / (length(y) - ncol(X))

covariance_mat <- MSE[1,1]*solve(t(X) %*% X)

r <- (covariance_mat[1,2])/(covariance_mat[1,1] ** 0.5 * covariance_mat[2,2] ** 0.5)

H <- X %*% solve(t(X) %*% X) %*% t(X)

H[2,2]
H[2,14]

t(X %*% b) %*% e
