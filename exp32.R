# Load the airquality dataset
data(airquality)

# i. Compute the mean temperature (without using built-in function)
mean_temperature <- sum(airquality$Temp, na.rm = TRUE) / length(airquality$Temp)
cat("Mean Temperature:", mean_temperature, "\n")

# ii. Extract the first five rows from airquality
first_five_rows <- airquality[1:5, ]
print(first_five_rows)

# iii. Extract all columns except Temp and Wind
selected_columns <- airquality[, !(colnames(airquality) %in% c("Temp", "Wind"))]
print(selected_columns)

# iv. Find the coldest day during the period
coldest_day <- airquality[which.min(airquality$Temp), ]
print("Coldest Day:")
print(coldest_day)