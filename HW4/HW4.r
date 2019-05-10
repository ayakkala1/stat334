# Before using this script you must import the data in file HW4.csv.
# Use the File>Import Dataset>From CSV command.

# These commands take the data in object 'HW4' and split it into columns.
HW4 <- read.csv("HW4/HW4.csv")

y=matrix(HW4$V1)
x1=matrix(HW4$V2)
x2=matrix(HW4$V3)

X <- cbind(rep(1,length(x1)),x1,x2)

b <- solve(t(X) %*% X) %*% (t(X) %*% y)

I <- diag(length(x1))

H <- X %*% solve(t(X) %*% X) %*% t(X)

e <- (I - H) %*% y

J <- array(1L, dim(H))

SSR <- t(y) %*% (H - (1/length(x1) * J)) %*% y

SSE <- t(e) %*% e

MSE <- SSE/(nrow(y) - 2 - 1)

s_b <- MSE[1,1] * solve(t(X) %*% X)

new_x <- matrix(c(1,10,30), 3,1)

new_y <- t(new_x) %*% b

x_v <- matrix(c(1,10,30),3,1)
h_v <- t(x_v) %*% solve(t(X) %*% X) %*% x_v

MSE[1,1] * h_v
# After running this script, use R commands to make the design matrix X,
# then calculate the values listed in Problem 6.27 on page 254 of the textbook.
# Skip part (d).

