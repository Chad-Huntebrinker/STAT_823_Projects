#Question 3:
  
#This question requires you to install and load “tidyverse” package before you start working.
#You are provided with exp_data.csv file that contains the data from an experiment.
#Read this data into a dataframe “exp.data” and then convert this into long format into “data_long” dataframe.
#Export the data_long as “exp_data_long.csv”
#Convert the long format back into wide format into a dataframe  “data_wide”
library("tidyverse")

exp.data <- read.csv("exp_data.csv")

# Convert to long format
data_long <- exp.data %>%
  pivot_longer(cols = !Sample_ID,
               names_to = "OD",
               values_to = "Data")
print(data_long)

write.csv(data_long, file = "exp_data_long.csv")
data_wide <- data_long %>% 
  pivot_wider(names_from = OD,
              values_from = Data)



