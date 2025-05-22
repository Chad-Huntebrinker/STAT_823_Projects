#Write a function to calculate BMI using the following formula:

#BMI = Weight in KG / Height in Meters^2

#The function should receive the two arguments weight and height and return the BMI.

calc_bmi <- function(weight, height) {
  return(weight / (height ^ 2))
}

calc_bmi(150, 2)
