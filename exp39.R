# Load the USArrests dataset
data("USArrests")

# (i) a. Explore the summary of the dataset
# Number of features and their types
num_features <- ncol(USArrests)
feature_types <- sapply(USArrests, class)

# Number of records for each feature
num_records <- sapply(USArrests, length)

# Summary statistics of the dataset
summary_stats <- summary(USArrests)

# (i) b. Print the state with the largest total number of rape
state_largest_rape <- rownames(USArrests)[which.max(USArrests$Rape)]

# (i) c. Print the states with max & min crime rates for murder
state_max_murder <- rownames(USArrests)[which.max(USArrests$Murder)]
state_min_murder <- rownames(USArrests)[which.min(USArrests$Murder)]

# (ii) a. Find the correlation among the features
correlation_matrix <- cor(USArrests)

# (ii) b. Print the states with assault arrests more than median
states_above_median_assault <- rownames(USArrests)[USArrests$Assault > median(USArrests$Assault)]

# (ii) c. Print the states in the bottom 25% of murder
states_bottom_25_murder <- rownames(USArrests)[USArrests$Murder < quantile(USArrests$Murder, 0.25)]

# (iii) a. Create a histogram and density plot of murder arrests
hist_density_plot <- ggplot(USArrests, aes(x = Murder)) +
  geom_histogram(binwidth = 2, fill = "skyblue", color = "black") +
  geom_density(aes(y = after_stat(scaled) * 10), color = "red") +
  labs(x = "Murder Arrests", y = "Density", title = "Histogram and Density Plot of Murder Arrests")

# Display the histogram and density plot
print(hist_density_plot)


# (iii) b. Create a scatter plot with assault arrests and urban proportion
scatter_plot <- ggplot(USArrests, aes(x = Murder, y = UrbanPop, color = Assault)) +
  geom_point() +
  scale_color_gradient(low = "blue", high = "red") +
  labs(x = "Murder Arrests", y = "Urban Population Proportion", title = "Scatter Plot with Assault Arrests")

# (iii) c. Create a bar graph to show the murder rate for each state
barplot_murder_rate <- ggplot(USArrests, aes(x = reorder(row.names(USArrests), -Murder), y = Murder)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(x = "State", y = "Murder Rate", title = "Murder Rate for Each State")

# Display the outputs
print(num_features)
print(feature_types)
print(num_records)
print(summary_stats)
print(state_largest_rape)
print(state_max_murder)
print(state_min_murder)
print(correlation_matrix)
print(states_above_median_assault)
print(states_bottom_25_murder)
print(hist_density_plot)
print(scatter_plot)
print(barplot_murder_rate)