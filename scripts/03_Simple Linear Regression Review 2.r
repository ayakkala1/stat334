# This script goes with notes "03_Simple Linear Regression Review 2"

# Load the Corollas Data
# In RStudio, use the "File>Import Dataset>From Text (base)..." command
# Select the Corollas.txt file that you downloaded from PolyLearn
# Change the Name field from "02_Corollas" to "Corollas"
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

# Computing the variance and standard deviation of the residuals (MSE and RMSE)
SSE = t(e)%*%e  # You could also use crossprod(e) here. This is the sum of squared residuals.
SSE.df = n - dim(X)[2] # The denominator is n minus the number of columns in X. The number of columns is the second element output by dim(X)
MSE = SSE/SSE.df # The variance of the residuals (or MSE) is the SSE divided its degrees of freedom.
RMSE = sqrt(MSE) # The standard deviation of the residuals

# Computing the variance-covariance matrix of the regression coefficients
VCOV.b = drop(MSE)*XtXinv # drop() is used to change the 1x1 matrix MSE into a scalar

# Extracting the standard errors of b0 and b1
SE.b = sqrt(diag(VCOV.b))


