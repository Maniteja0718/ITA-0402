# Given data
data <- c(90, 50, 70, 80, 70, 60, 20, 30, 80, 90, 20)

# Mean
mean_value <- mean(data)
cat("Mean:", mean_value, "\n")

# Median
median_value <- median(data)
cat("Median:", median_value, "\n")

# Mode (using a custom function)
mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
mode_value <- mode(data)
cat("Mode:", mode_value, "\n")
second_highest <- sort(data, decreasing = TRUE)[2]
cat("2nd Highest:", second_highest, "\n")

# Find 3rd lowest value
third_lowest <- sort(data)[3]
cat("3rd Lowest:", third_lowest, "\n")