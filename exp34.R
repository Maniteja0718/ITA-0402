# Load the airquality dataset
data(airquality)

# (i) Find missing values and handle them
missing_percentage <- colMeans(is.na(airquality)) * 100
print("Missing Percentage:")
print(missing_percentage)

threshold <- 10  # 10% threshold for missing values

for (col in colnames(airquality)) {
  if (missing_percentage[col] < threshold) {
    mean_value <- mean(airquality[[col]], na.rm = TRUE)
    airquality[[col]][is.na(airquality[[col]])] <- mean_value
  } else {
    airquality <- airquality[complete.cases(airquality), ]
  }
}

# (ii) Apply linear regression on "Ozone" and "Solar.R"
lm_model <- lm(Ozone ~ Solar.R, data = airquality)
summary(lm_model)

# (iii) Plot Scatter plot with regression line
plot(airquality$Solar.R, airquality$Ozone, xlab = "Solar.R", ylab = "Ozone", main = "Scatter plot of Ozone vs Solar.R")
abline(lm_model, col = "red")