# Load required libraries
library(ggplot2)
library(dplyr)

# Load the ChickWeight dataset
data("ChickWeight")

# (a) Create Box plot for "weight" grouped by "Diet"
boxplot_plot <- ggplot(ChickWeight, aes(x = factor(Diet), y = weight)) +
  geom_boxplot() +
  labs(x = "Diet", y = "Weight", title = "Box Plot of Weight by Diet")

# (b) Create Histogram for "weight" features belong to Diet-1 category
histogram_plot <- ChickWeight %>%
  filter(Diet == 1) %>%
  ggplot(aes(x = weight)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  labs(x = "Weight", y = "Frequency", title = "Histogram of Weight for Diet-1")

# (c) Create Scatter plot for "weight" vs "Time" grouped by Diet
scatter_plot <- ggplot(ChickWeight, aes(x = Time, y = weight, color = factor(Diet))) +
  geom_point() +
  labs(x = "Time", y = "Weight", title = "Scatter Plot of Weight vs Time by Diet") +
  scale_color_discrete(name = "Diet")

# Display the plots
print(boxplot_plot)
print(histogram_plot)
print(scatter_plot)