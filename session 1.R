library(tidyverse)
library(modelr)
library(broom)

#create data
data <- tibble(
  ads = c(10,15,20,25)
  sales = c(100,130,190,233)
)

#fit linear model
model <- lm(sales - ads, data = data)

#tidy model summary
