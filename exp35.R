# Load required library
library(dplyr)
library(reshape2)

# Load the ChickWeight dataset
data("ChickWeight")

# (i) Order the data frame by weight in ascending order, grouped by diet, and extract the last 6 records
ordered_data <- ChickWeight %>%
  arrange(Diet, weight) %>%
  group_by(Diet) %>%
  slice_tail(n = 6)

# (ii) (a) Perform melting
melted_data <- melt(ordered_data, id.vars = c("Chick", "Time", "Diet"), measure.vars = "weight")

# (ii) (b) Perform cast to display the mean value of weight grouped by Diet
cast_mean <- melted_data %>%
  group_by(Diet, variable) %>%
  summarise(mean_value = mean(value, na.rm = TRUE)) %>%
  dcast(Diet ~ variable, value.var = "mean_value")

# (ii) (c) Calculate mode of weight grouped by Diet
cast_mode <- melted_data %>%
  group_by(Diet, variable) %>%
  summarise(mode_value = as.numeric(names(table(value))[table(value) == max(table(value))])) %>%
  dcast(Diet ~ variable, value.var = "mode_value")

# Display the results
print("Ordered Data:")
print(ordered_data)

print("Melted Data:")
print(melted_data)

print("Mean Weight by Diet:")
print(cast_mean)

print("Mode Weight by Diet:")
print(cast_mode)