#Chad Huntebrinker
#HW1

#Question 1:
#Calculate the mean, median, and standard deviation of the following vector.
#my_vec <- c(15, 20, 25, 30, 35)
my_vec <- c(15, 20, 25, 30, 35)
mean_vec <- mean(my_vec)
median_vec <- median(my_vec)
standard_vec <- sd(my_vec)
print(my_vec)
print(mean_vec)
print(median_vec)
print(standard_vec)

#Question 2:
#Generate two vectors called “abc” and “xyz” with a random values of 100 in each.
#Generate scatter plot, bar plot and line plot with required labels and headings.
abc <- runif(100, min = 1, max = 20)
xyz <- runif(100, min = 1, max = 20)
plot(abc,xyz, xlab = "abc axis", ylab = "xyz axis", main = "Scatter Plot")
barplot(abc,xyz, xlab = "abc axis", ylab = "xyz axis", main = "Bar Plot")
plot(abc,xyz,type = "l", xlab = "abc axis", ylab = "xyz axis", main = "Line Plot")
#Question 3:
#Generate 1000 random numbers from a normal distribution with mean 0 and standard deviation 10. (Do not print out the 1000 numbers on the solution document.) Save the result into object x.
#Plot a histogram for x object. (Hint: use hist() function)
#Calculate the mean and variance of x. (Hint: R already has a built-in function to calculate variance, search online to find this function)
x <- rnorm(1000, mean = 0, sd = 10)
hist(x)
mean(x)
var(x)
