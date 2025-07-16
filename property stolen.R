library (tidyverse)
library(broom)
library(modelr)

read.csv("10_Property_stolen_and_recovered.csv") ->df
view(df)

model <-lm(Cases_Property_Stolen~Cases_Property_Recovered,data = df)
model

df %>%
  ggplot(aes(x = Cases_Property_Stolen, y = Cases_Property_Recovered , color = Area_Name )) +
  geom_point (size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Linear Regression Example (Tidyverse)",
    x = "Cases_Property_Stolen",
    y= "Cases_Property_Recovered"
  )

