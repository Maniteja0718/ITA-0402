# Load the required library
library(reshape2)

# Load the airquality dataset
data(airquality)

# (i) Summary Statistics of airquality dataset
summary(airquality)

# (ii) Melt airquality dataset and display in long-format
melted_long <- melt(airquality)
print(melted_long)

# (iii) Melt airquality dataset and specify month and day as ID variables
melted_id_vars <- melt(airquality, id.vars = c("Month", "Day"))
print(melted_id_vars)

# (iv) Cast the molten airquality dataset with respect to Month and Day
casted_data <- dcast(melted_id_vars, Month + Day ~ variable)
print(casted_data)

# (v) Compute the average of Ozone, Solar.R, Wind, and Temperature per month
average_per_month <- dcast(melted_id_vars, Month ~ variable, fun.aggregate = mean)
print(average_per_month)