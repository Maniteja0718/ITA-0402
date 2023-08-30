# Load required libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Load the Titanic dataset
data("Titanic")

# Convert Titanic dataset to a format suitable for plotting
titanic_data <- as.data.frame(Titanic) %>%
  gather(key = "Survived", value = "Count", -Class, -Sex) %>%
  mutate(Survived = factor(Survived, levels = c("No", "Yes")))

# (a) Bar chart to show details of "Survived" based on passenger Class
barplot_class_survived <- ggplot(titanic_data, aes(x = Class, y = Count, fill = Survived)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(x = "Class", y = "Count", title = "Survival by Passenger Class") +
  scale_fill_manual(values = c("No" = "red", "Yes" = "green"))

# (b) Modify the plot based on gender of people who survived
barplot_class_gender_survived <- ggplot(titanic_data, aes(x = Class, y = Count, fill = Survived)) +
  geom_bar(stat = "identity", position = "stack") +
  facet_grid(. ~ Sex) +
  labs(x = "Class", y = "Count", title = "Survival by Passenger Class and Gender") +
  scale_fill_manual(values = c("No" = "red", "Yes" = "green"))

# Display the plots
print(barplot_class_survived)
print(barplot_class_gender_survived)