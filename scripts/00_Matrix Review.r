# This script will load the data needed for notes "00_Matrix Review".
# To run each section of code, select the code, then choose "Edit>Run line or selection"

data = c(6,-1,8,2,4,5) # reads the list of numbers into R as a data object called data.
A = matrix(data, nrow=3, ncol=2) # reads the data into the matrix called A.
D = matrix(data, nrow=3, ncol=2, byrow=TRUE) # reads the matrix in by rows to create D.

dim(A)    # shows the dimension of matrix A

t(A)      # transposes the matrix A

y = matrix(c(3,5,3,2,7), nrow=5, ncol=1)  # reads in the column vector y
t(y)

A + D     # adds the matrices A and D

A %*% D   # A and D cannot be multiplied because they are not the correct dimensions
A %*% t(D)  # But A and t(D) can be multiplied

# Load matrix B from Matrix Algebra 1 page 3
B = matrix(c(4,3,2,-2),nrow=2,ncol=2)

C = A %*% B  # multiply A and B, put into C
C            # display C

A * D   # elementwise multiplication of A and D--must have same dimension


crossprod(ones,y)    # this is the inner product of the ones vector and y, it is the same as t(ones) %*% x1
t(ones) %*% y        # verify that this line gives the same answer as the line above
sum(y)               # the inner product of the ones vector with any other vector sums up the values in that vector

tcrossprod(ones,y)   # this is the outer product of the ones vector and x1, it is the same as ones %*% t(x1)
ones %*% t(y)        # verify that this line gives the same answer as the line above

# crossprod with only one argument produces the sum of squares of that matrix
crossprod(y)

# An identity matrix is a square matrix with 1 along the diagonal and 0 elsewhere
I2 = diag(2)          # this can also be done with matrix(1,nrow=2,ncol=2)
I2
I3 = diag(3)          # this can also be done with matrix(1,nrow=3,ncol=3)
I3

# Check that pre-multiplying or post-multiplying by an identity matrix does not change the other matrix
A
A %*% I2
I3 %*% A

# Linear Dependence. Matrix Review, page 4
# Load matrices A, B, C, and D from page 4,
# then install the Matrix package.
A = matrix(c(1,5,3,9,1,2,4,4,3,9,11,17),nrow=4,ncol=3)
B = matrix(c(5,4,2,6,3,7,10,8,4),nrow=3,ncol=3)
C = matrix(c(1,-1,0,2,2,1,3,7,2),nrow=3,ncol=3)
D = matrix(c(1,1,1,1,2,2,2,2,3,3,3,3),nrow=4,ncol=3)

# install.packages("Matrix") # Remove the comment in front of this command if you need to install the package.
library(Matrix)

# Rank is the minimum of the number of linearly independent columns or rows (whichever is less) in a matrix.
# A full rank or nonsingular matrix will have a rank equal to min(nrows,ncols).
# If any of the rows or columns are linearly dependent, the matrix is rank deficient (or singular).
# The rankMatrix command gives the rank of a matrix as its first result. You may ignore the other results.

A
dim(A)          # If A were full rank, what must its rank be?
rankMatrix(A)   # Is matrix A full rank?

B
dim(B)          # If B were full rank, what must its rank be?
rankMatrix(B)   # Is matrix B full rank?

C
dim(C)          # If C were full rank, what must its rank be?
rankMatrix(C)   # Is matrix C full rank?

D
dim(D)          # If D were full rank, what must its rank be?
rankMatrix(D)   # Is matrix D full rank?

# The determinant of a matrix exists only for square matrices.
# If a square matrix is rank-deficient, its determinant value will be 0.

det(A)          # the determinant doesn't exist for non-square matrices
det(B)
det(C)

# Load matrix A from Matrix Review, page 5.
A = matrix(c(5,-2,-3,2),nrow=2,ncol=2)
A

# Find the matrix inverse of A.
# Note: Only square matrices have inverses!
Ainv = solve(A)
Ainv

# Verify that Ainv is the inverse of A
Ainv %*% A
A %*% Ainv