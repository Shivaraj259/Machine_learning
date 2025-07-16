library(tidyverse)
library(broom)     
library(modelr)    

# Example Data
data <- tibble(
  age = c(22, 25, 30, 35, 40, 28, 32, 21),
  bought = c(0, 0, 1, 1, 1, 0, 1, 0)
)

# Fit Logistic Regression
model <- glm(bought ~ age, data = data, family = binomial)

# Summary of model coefficients
tidy(model)

# Predict Probabilities on original data
data_with_preds <- data %>%
  mutate(prob = predict(model, type = "response"))

# Predict on new data
new_data <- tibble(age = c(24, 29, 38)) %>%
  mutate(
    probability = predict(model, newdata = ., type = "response"),
    predicted_class = if_else(probability > 0.5, 1, 0)
  )

print(new_data)

# Plot: Age vs Probability of Buying
ggplot(data_with_preds, aes(x = age, y = prob)) +
  geom_point(aes(y = bought), color = "blue", size = 4) +
  geom_line(color = "red", size = 1) +
  geom_point(data = new_data, aes(x = age, y = probability), 
             color = "green", size = 4, shape = 17) +
  labs(
    title = "Logistic Regression: Probability of Buying",
    x = "Age",
    y = "Predicted Probability"
  ) +
  theme_minimal()
