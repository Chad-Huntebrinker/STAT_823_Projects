#Question 1:
  
#Load the R built-in dataset "longley".
data("longley")

#Perform a summary analysis on the "GNP.deflator" and "Employed" variables in the "longley" dataset.
summary(longley$GNP.deflator)
summary(longley$Employed)

#Identify the correlation between "GNP.deflator" and "Employed" in the subset of records prior to 1950.
data_prior_1950 <- subset(longley, longley$Year < 1950)
correlation <- cor(data_prior_1950$GNP.deflator, data_prior_1950$Employed)
print(correlation)

#Calculate a new variable "Product" by multiplying "GNP.deflator" and "Employed" for each record.
Product <- longley$GNP.deflator * longley$Employed

#Calculate the average value of the "Product" variable.
mean(Product)

#Print only the records in the "longley" dataset prior to 1950, including the new "Product" variable.
longley$Product <- Product
product_prior_1950 <- subset(longley, longley$Year < 1950)
print(product_prior_1950)

#Use R "head()" function to print the first 7 rows of the "longley" dataset.
head(longley, 7)

#Export the resulting subset of the "longley" dataset to a tab-delimited text file named "longley_subset.txt".
write.table(head(longley, 7), file = "longley_subset.txt")
