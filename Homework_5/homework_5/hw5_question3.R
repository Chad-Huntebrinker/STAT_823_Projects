#Question 3:

#You are provided with cell_viability.csv file that contains the results from the cell viability assay that
#recorded the percent of cell viabilities with three drugs treatments.

# a. Read the table into cell.via dataframe

# b. Write a function calculate_mean_viability () to calculate mean viability for each drug treatment.
#When you call the function calculate_mean_viability (cell.via), it should print the mean viability of each
#drug treatment.

# c. Write a Function calculate_sd_viability () to calculate standard deviation of viability for each drug
#treatment. When you call the function calculate_sd_viability(cell.via), it should print the standard
#deviation of each drug treatment.

# d. Write a function plot_dose_response_curves () to plot dosage-response curves for each drug where
#the x-axis should have dosage and y axis contains the percent viability. When you call the function
#plot_dose_response_curves(cell.via), it should print dose response curve of each drug. You need to use
#for loop within the function to plot the dose response curve of three drugs. Generate all the three curves
#into a single figure by mentioning the following function before the plot function.

#par(mfrow = c(3, 1))

#This function will help to generate all the three plots one below the other.
#For your easy understanding the plot is provided here.

#Part a
cell.via <- read.csv("cell_viability.csv")

#Part b
print("Part B")
calculate_mean_viability <- function(cell.via) {
  print(mean(cell.via$drug1))
  print(mean(cell.via$drug2))
  print(mean(cell.via$drug3))
}
calculate_mean_viability(cell.via)

#Part c
print("Part C")
calculate_sd_viability <- function(cell.via) {
  print(sd(cell.via$drug1))
  print(sd(cell.via$drug2))
  print(sd(cell.via$drug3))
}
calculate_sd_viability(cell.via)

#Part d
print("Part D")
plot_dose_response_curves <- function(cell.via) {
  par(mfrow = c(3, 1))
  
  #No need to include the first row, it's just the control row
  plot(cell.via$drug1[2:7] ~ cell.via$Dosage_mg[2:7], xlab = "Dosage (nM)", ylab = "Percentage Viability",
       main = "Dose-Response Curve for drug 1")
  lines(cell.via$Dosage_mg[2:7], cell.via$drug1[2:7])
  
  plot(cell.via$drug2[2:7] ~ cell.via$Dosage_mg[2:7], xlab = "Dosage (nM)", ylab = "Percentage Viability",
       main = "Dose-Response Curve for drug 2")
  lines(cell.via$Dosage_mg[2:7], cell.via$drug2[2:7])
  
  plot(cell.via$drug3[2:7] ~ cell.via$Dosage_mg[2:7], xlab = "Dosage (nM)", ylab = "Percentage Viability",
       main = "Dose-Response Curve for drug 3")
  lines(cell.via$Dosage_mg[2:7], cell.via$drug3[2:7])
}

plot_dose_response_curves(cell.via)
