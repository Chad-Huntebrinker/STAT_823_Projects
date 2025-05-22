#Question 4:

#You are provided with a patient data information Patient_data.csv
#Read this table into Pt.data dataframe. Use for loop and if else to perform the following investigations.

#a. Write a for loop to print the cancer types of first 10 patients in the dataframe

#b. Which patients (Patient_IDs) are older than 50 and have smoking status as TRUE?

#c. What is the marker associated with patients who have age less than or equal to 30?

#d. Which patients are Hispanic and have received Stem Cell Transplantation?

#e. Which patients are older than 60 and have cancer type "Prostate"?

#f. Create a new column "age_group" based on age categories: 
#"Young" (age <= 30), "Middle-aged" (30 < age <= 60), "Elderly" (age > 60).
#Use a for loop with if else control statements
  
Pt.data <- read.csv("Patient_data.csv")

#Part a
print("Part A")
for(i in 1:10){
  print(Pt.data$cancer_type[i])
}

#Part b
print("Part B")
for(i in 1:nrow(Pt.data)){
  if(Pt.data$age[i] > 50 && Pt.data$smoking[i]) {
    print(Pt.data$Patient_id[i])
  }
}

#Part c
print("Part C")
for(i in 1:nrow(Pt.data)){
  if(Pt.data$age[i] <= 30) {
    print(Pt.data$marker[i])
  }
}

#Part d
print("Part D")
for(i in 1:nrow(Pt.data)){
  if(Pt.data$ethnicity[i] == "Hispanic" && Pt.data$therapy[i] == "Stem Cell Transplantation") {
    print(Pt.data$Patient_id[i])
  }
}

#Part e
print("Part E")
for(i in 1:nrow(Pt.data)){
  if(Pt.data$age[i] > 60 && Pt.data$cancer_type[i] == "Prostate") {
    print(Pt.data$Patient_id[i])
  }
}

#Part f
print("Part F")
for(i in 1:nrow(Pt.data)){
  Pt.data$age_group[i] <- ifelse(Pt.data$age[i] <= 30, "Young",
         ifelse(Pt.data$age[i] <= 60, "Middle-aged", "Elderly"))
}
