#Load the DNase dataset. Display the first few rows of the dataset
data("DNase")
head(DNase)

#Calculate the mean and standard deviation of the 'density' column.
mean(DNase$density)
sd(DNase$density)

#Create a new column 'conc_category' based on the 'conc' values (e.g., Low, Medium, High)
DNase$conc_category <- ifelse(DNase$conc < 1, "Low",
                              ifelse(DNase$conc <= 5, "Medium", "High"))

#Calculate the correlation between 'conc' and 'density'. Check the relation between concentration and density by generating a plot
cor(DNase$density, DNase$conc)
plot(DNase$density, DNase$conc, pch = 16, xlab = "Density", ylab = "Concentration")

#Calculate the percentage change in 'density' from the first row to the last row
cat(((DNase$density[nrow(DNase)] - DNase$density[1]) / DNase$density[1]) * 100, "%", sep = "")

#Export the modified dataframe as a table (e.g., CSV format)
write.csv(DNase, file = "DNase_file.csv")
