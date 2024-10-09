#Chad Huntebrinker

#Create a vector x. x contains a sequence of integers from 11 to 16.
x <- c(11:16)

#Name the elements of x using words: eleven, twelve, thirteen, fourteen, fifteen and sixteen.
names(x) <- c("eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen")
x

#Index the element "twelve - 12" by its name.
x["twelve"]

#Index the 3rd and 4th elements in the vector.
x[c(3,4)]

#Remove the names in the x vector.
names(x) <- NULL
x

#Use filtering to subset values that has a square value larger than or equal to 144. (Hint: use ">=")
subset_of_x <- x[x^2 >= 144]
subset_of_x

#Coerce the vector x into a matrix x of 3 rows and 2 columns.
matrix_x <- matrix(x, nrow = 3, ncol = 2)
matrix_x

#Transpose the matrix and save it into object y
y <- t(matrix_x)
y

#Calculate the mean of each row for x using the apply() function.
mean_of_rows <- apply(matrix_x, 1, mean)
mean_of_rows


#Apply function of your own (user defined function)  as argument for apply() and explain it.

#The purpose of this function is to find the hypotenuse of a triangle.
#It assumes it is getting a matrix with two columns (each column being a triangle's side). 
#Then we solve for c in the Pythagorean Theorem (a^2 + b^2 = c^2) which gives us:
#c = sqrt(a^2 + b^2)
find_hypotenuse <- function(x) {
  return(sqrt(x[1]^2 + x[2]^2))
}

#create a matrix that has the values for the sides of a triangle
triangle_matrix <- matrix(c(6, 21, 8, 72), nrow = 2, ncol = 2)
triangle_matrix

#this apply function will use the find_hypotenuse function above and store the answer
hypotenuse_answer <- apply(triangle_matrix, 1, find_hypotenuse)
hypotenuse_answer
