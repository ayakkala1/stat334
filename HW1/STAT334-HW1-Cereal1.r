# R Script for STAT 334, Spring 2019, HW 1
# This script sets up the matrices needed for Problem 10 on HW1.
# After running this script, you should have a response vector, y, and several design matrices, Xa, Xb, and Xc.
# You must compute the necessary results by adding matrix formulas to this script
# or running them from the R Console.

# Load the Cereal Data
# In RStudio, use the "File>Import Dataset>From Text (base)..." command
# Select the Cereal.txt file that you downloaded from PolyLearn
# Click the Import button

# Formatting the data into matrices
y <- Cereal1$Sugar
x.text <- Cereal1$Type
n <- length(y)
x0 <- matrix(1,n,1)

# Creating the design matrix X.A for the two means parameterization of the model
# We will call this version A of the model
x1.A <- ifelse(x.text == "Adult", 1, 0)
x2.A <- ifelse(x.text == "Child", 1, 0)
X.A <- cbind(x1.A,x2.A)

# Creating the design matrix X.B for the two means parameterization of the model
# We will call this version A of the model
x1.B <- ifelse(x.text == "Adult", 1, ifelse(x.text == "Child", -1, 0))
X.B <- cbind(x0,x1.B)

# Creating the design matrix X.C for the two means parameterization of the model
# We will call this version C of the model
x1.C <- ifelse(x.text == "Adult", 1, 0)
X.C <- cbind(x0,x1.C)