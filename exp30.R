# Load the necessary library
library(caret)

# Load the necessary dataset
data("iris")

# Set a random seed for reproducibility
set.seed(123)

# Split the data into training (80%) and testing (20%) sets
train_index <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
train_data <- iris[train_index, ]
test_data <- iris[-train_index, ]

# Create logistic regression model using training data
logit_model <- glm(Species ~ Petal.Width + Petal.Length, data = train_data, family = "binomial")

# Predict probabilities using test data
predicted_probabilities <- predict(logit_model, newdata = test_data, type = "response")

# Convert predicted probabilities to predicted classes
predicted_classes <- ifelse(predicted_probabilities > 0.5, "versicolor", "setosa")

# Create confusion matrix
confusion <- table(predicted = predicted_classes, actual = test_data$Species)
print("Confusion Matrix:")
print(confusion)

# Calculate accuracy
accuracy <- sum(diag(confusion)) / sum(confusion)
cat("\nAccuracy:", accuracy)