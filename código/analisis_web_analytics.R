library(readxl)
library(dplyr)
library(ggplot2)
datos_excel <- excel_sheets("data/Web_Analytics.xls")
datos_excel
weekly_visits <- read_excel(
  "data/Web_Analytics.xls",
  sheet = "Weekly Visits",
  skip = 3
)
View(weekly_visits)
financials <- read_excel(
  "data/Web_Analytics.xls",
  sheet = "Financials",
  skip = 3
)
View(financials)
lbs_sold <- read_excel(
  "data/Web_Analytics.xls",
  sheet = "Lbs. Sold",
  skip = 3
)
View(lbs_sold)
daily_visits <- read_excel(
  "data/Web_Analytics.xls",
  sheet = "Daily Visits",
  skip = 3
)
View(daily_visits)
demographics <- read_excel(
  "data/Web_Analytics.xls",
  sheet = "Demographics",
  skip = 3
)
View(demographics)
datos_semana <- inner_join(
  weekly_visits,
  financials,
  by = "Week (2008-2009)"
)

View(datos_semana)
ggplot(datos_semana, aes(x = 1:nrow(datos_semana), y = `Unique Visits`)) +
  geom_line() +
  labs(
    title = "Unique Visits por semana",
    x = "Semana",
    y = "Unique Visits"
  )
ggplot(datos_semana, aes(x = 1:nrow(datos_semana), y = Revenue)) +
  geom_line() +
  labs(
    title = "Revenue por semana",
    x = "Semana",
    y = "Revenue"
  )

ggplot(datos_semana, aes(x = 1:nrow(datos_semana), y = Profit)) +
  geom_line() +
  labs(
    title = "Profit por semana",
    x = "Semana",
    y = "Profit"
  )

ggplot(datos_semana, aes(x = 1:nrow(datos_semana), y = `Lbs. Sold`)) +
  geom_line() +
  labs(
    title = "Lbs. Sold por semana",
    x = "Semana",
    y = "Lbs. Sold"
  )