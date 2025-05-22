#Chad Huntebrinker
#rm(list = ls())

#Part 1: Basic Analysis of Cancer Patients Data Using Lists
  
#Question 1: create a list object
#Create a list named patient_data to represent information about cancer patients.
#Include the given 5 patients, within the following four vectors on the list:
  
#PatientID (Numeric) : 1, 2, 3, 4, 5
#Age (Numeric) : 45, 32, 58, 41, 50
#CancerType (Character) : "Breast", "Lung", "Colon", "Breast", "Lung"
#TreatmentStatus (Logical) : TRUE, FALSE, TRUE, TRUE, FALSE
#Display the patient_data.

patient_data <- list(
  PatientID = c(1, 2, 3, 4, 5),
  Age = c(45, 32, 58, 41, 50),
  CancerType = c("Breast", "Lung", "Colon", "Breast", "Lung"),
  TreatmentStatus = c(TRUE, FALSE, TRUE, TRUE, FALSE))

#Question 2 : Perform Basic Operations on the list object
#Find the average age of patients.
print(mean(patient_data$Age))

#Retrieve the patientIDs with “Breast” cancer type.
index <- which(patient_data$CancerType == "Breast")
ids <- patient_data$PatientID[indexes]

#Update the treatment status for the “Colon” cancer patient to FALSE.
patient_data$TreatmentStatus[3] <- FALSE

#Display the updated patient_data.
print(patient_data)

#Calculate the percentage of patients undergoing treatment
num_treatments <- which(patient_data$TreatmentStatus == TRUE)
final_percentage <- (length(num_treatments) / 5) * 100
cat(toString(final_percentage), "%", sep = "")

#Question 3: Update the patient_data by adding another patient with the following details.
#Print the updated list
patient_data$PatientID[6] <- 6 
patient_data$Age[6] <- 68
patient_data$CancerType[6] <- "Brain"
patient_data$TreatmentStatus[6] <- TRUE
print(patient_data)


#Question 4: plot a histogram for the age of patients
hist(patient_data$Age, xlab = "Age", main = "Histogram of Patient Ages")

#------------------------------------------End of Part 1 --------------------------------------------------------
  
#Part 2: Analysis of Breast cancer data set
#You are provided with a breast cancer data set (BC_data.cvs) and you have to work on this table as per the instructions provided.

#Question 1:
#Read the Breast cancer data into a dataframe called "Bc.data"
rm(list = ls())
Bc.data <- read.csv("BC_data.csv", header = TRUE, row.names = 1)

#The rownames should be the patient_IDs.
rownames(Bc.data)

#Perform all the basic functions on the dataframe and get familiarize with the data.
dim(Bc.data)
class(Bc.data)
str(Bc.data)
ncol(Bc.data)
colnames(Bc.data)

#Do not try to print the data of the dataframe in the report as it has several rows.

#Question 2:
  
#Check if NA values are available.
any(is.na(Bc.data))

#create a vector called "Surv_Mnths" with the data from "Survival_Months" column
Surv_Mnths <- Bc.data$Survival_Months

#create a vector called "Tum_Size" with the data from "Tumor_Size" column
Tum_Size <- Bc.data$Tumor_Size

#check the correlation between "Surv_Mnths" and "Tum_Size" and interpret the relation based on the correlation value. 
#Write your interpretation in the comments. Clue: There is a built-in function for correlation
cor(Surv_Mnths, Tum_Size)
#The cor function returns a value of -0.1989186
#Thus, there is a negative linear relationship between the two

#Calculate the mean and median of the "Survival_Months" column.
mean(Surv_Mnths)
median(Surv_Mnths)

#generate a scatter plot "Surv_Mnths" Vs "Tum_Size" and present with proper axis labels
plot(Surv_Mnths, Tum_Size, ylab= "Tumor Size", xlab = "Survival Months", main = "Tumor Size to Survival Months")
View(Bc.data)

#Question 3:
#Print a table to show how many patients are DECEASED and how many LIVING
table(Bc.data$Survival_Status)

#Create a new dataframe called "living_patient" with only living patients.
living_patients <- subset(Bc.data, Bc.data$Survival_Status=="LIVING")
View(living_patients)
#In these living patients, how many are undergoing Chemotherapy and how many undergoing Hormone_Therapy
table(living_patients$Chemotherapy)
table(living_patients$Hormone_Therapy)


#Question 4:
  
#Create an additional column in the BC.data dataframe with the name 'Full_Info' by
#concatenating the values of Survival_Status with Tumor_Stage seperated by underscore.
Bc.data$Full_Info <- paste(Bc.data$Survival_Status, Bc.data$Tumor_Stage, sep = "_") 

#Create additional column 'Survival_Status_Short' by replacing the  the Survival_Status values "DECEASED" with "D" and "LIVING" with "L".
Bc.data$Survival_Status_Short[Bc.data$Survival_Status == "LIVING"] <- "L"
Bc.data$Survival_Status_Short[Bc.data$Survival_Status == "DECEASED"] <- "D"

#Check the factor levels of Survival_Status, Tumor_Stage  and Surgery_Type in BC.data dataframe
factor(Bc.data$Survival_Status)
factor(Bc.data$Tumor_Stage)
factor(Bc.data$Surgery_Type)
