# Load required libraries
library(dplyr)
library(stats)

# Load the ChickWeight dataset
data("ChickWeight")

# Convert "Diet" to a factor variable
ChickWeight$Diet <- as.factor(ChickWeight$Diet)

# (a) Create a multiple regression model
multi_reg_model <- lm(weight ~ Time + Diet, data = ChickWeight)

# (b) Predict weight for Time=10 and Diet=1
new_data <- data.frame(Time = 10, Diet = factor(1))  # Convert Diet to a factor
predicted_weight <- predict(multi_reg_model, newdata = new_data)

cat("Predicted weight:", predicted_weight, "\n")

# (c) Calculate the error in the model for the same prediction
actual_weight <- ChickWeight %>%
  filter(Time == 10, Diet == 1) %>%
  select(weight) %>%
  unlist()

prediction_error <- actual_weight - predicted_weight
cat("Prediction Error:", prediction_error, "\n")

# Summary of the multiple regression model
summary(multi_reg_model)