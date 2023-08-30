# Load the Iris dataset
data(iris)

# (i) Dimension, Structure, Summary Statistics, Standard Deviation
dim(iris)  # Dimension
str(iris)  # Structure
summary(iris)  # Summary Statistics
sapply(iris[, 1:4], sd)  # Standard Deviation of all features

# (ii) Mean and Standard Deviation grouped by species
aggregate(. ~ Species, data = iris, FUN = function(x) c(mean = mean(x), sd = sd(x)))

# (iii) Quantile values of Sepal Width and Length
quantile(iris$Sepal.Width, probs = seq(0, 1, by = 0.25))
quantile(iris$Sepal.Length, probs = seq(0, 1, by = 0.25))

# (iv) Create new data frame with Sepal.Length categorized
iris1 <- iris
iris1$Sepal.Length.Cate <- cut(iris1$Sepal.Length, breaks = quantile(iris1$Sepal.Length, probs = seq(0, 1, by = 0.25)))

# (v) Average value of numerical variables by Species and Sepal.Length.Cate
aggregate(. ~ Species + Sepal.Length.Cate, data = iris1, FUN = mean)

# (vi) Average mean value of numerical variables by Species and Sepal.Length.Cate
aggregate(. ~ Species + Sepal.Length.Cate, data = iris1, FUN = function(x) mean(x, na.rm = TRUE))

# (vii) Create Pivot Table based on Species and Sepal.Length.Cate
pivot_table <- aggregate(. ~ Species + Sepal.Length.Cate, data = iris1, FUN = function(x) mean(x, na.rm = TRUE))