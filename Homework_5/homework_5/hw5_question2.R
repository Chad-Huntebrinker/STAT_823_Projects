#Body surface area (BSA) is an important parameter used in healthcare, particularly in determining
#medication dosages and assessing burn injury severity. The formula to calculate BSA is as follows

#BSA(m^2) = sqrt((Height(cm) * Weight (Kg)) / 3600)

#A Medical data scientist created the following function to calculate BSA.
#Modify this function to calculate BSA in a single step.

calculate_BSA <- function(height_cm, weight_kg) {
  bsa <- sqrt((height_cm * weight_kg) / 3600)
  return(bsa)
}

calculate_BSA(300, 50)