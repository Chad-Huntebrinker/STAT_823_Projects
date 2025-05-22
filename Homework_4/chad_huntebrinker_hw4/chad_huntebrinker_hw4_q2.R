#Question 2:

#Load the R built-in dataset “airquality “
data("airquality")

#Assign the rownames as AQrecord1, AQrecord2 and so on for all the rows of airquality
rownames(airquality) <- paste("AQrecord", 1:nrow(airquality))

#What is the mean of "Ozone" and "Solar.R" columns?
mean(airquality$Ozone, na.rm = TRUE)
mean(airquality$Solar.R, na.rm = TRUE)
  
#Check if NA values are existing. Use the complete.cases function to identify the NA values and 
#separate the airquality into two different dataframes one with 
#record containing NA values (airquality.NA) and the second without NA (airquality.WNA) values. 
#How many records are in airquality.NA and without airquality.WNA?
sum(is.na(airquality))
airquality.NA <- subset(airquality, complete.cases(airquality) == FALSE)
airquality.WNA <- subset(airquality, complete.cases(airquality))
dimension_of_na <- dim(airquality.NA)
dimension_of_wna <- dim(airquality.WNA)
print(dimension_of_na[1])
print(dimension_of_wna[1])
  
#Export the airquality.WNA as a “airquality.WNA.csv” file.
write.csv(airquality.WNA, file = "airquality.WNA.csv")
